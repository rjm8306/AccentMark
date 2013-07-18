    //
    //  AudioStreamer.m
    //  StreamingAudioPlayer
    //

#import "AudioPlayer.h"
#import <CFNetwork/CFNetwork.h>
//#import "UIDevice+Hardware.h"
#define kCFCoreFoundationVersionNumber_MIN 550.32
#define BitRateEstimationMaxPackets 500
#define BitRateEstimationMinPackets 5

NSString * const ASStatusChangedNotification = @"ASStatusChangedNotification";
NSString * const ASPresentAlertWithTitleNotification = @"ASPresentAlertWithTitleNotification";

static AudioStreamer *__streamer = nil;

NSString * const AS_NO_ERROR_STRING = @"No error.";
NSString * const AS_FILE_STREAM_GET_PROPERTY_FAILED_STRING = @"File stream get property failed.";
NSString * const AS_FILE_STREAM_SEEK_FAILED_STRING = @"File stream seek failed.";
NSString * const AS_FILE_STREAM_PARSE_BYTES_FAILED_STRING = @"Parse bytes failed.";
NSString * const AS_FILE_STREAM_OPEN_FAILED_STRING = @"Open audio file stream failed.";
NSString * const AS_FILE_STREAM_CLOSE_FAILED_STRING = @"Close audio file stream failed.";
NSString * const AS_AUDIO_QUEUE_CREATION_FAILED_STRING = @"Audio queue creation failed.";
NSString * const AS_AUDIO_QUEUE_BUFFER_ALLOCATION_FAILED_STRING = @"Audio buffer allocation failed.";
NSString * const AS_AUDIO_QUEUE_ENQUEUE_FAILED_STRING = @"Queueing of audio buffer failed.";
NSString * const AS_AUDIO_QUEUE_ADD_LISTENER_FAILED_STRING = @"Audio queue add listener failed.";
NSString * const AS_AUDIO_QUEUE_REMOVE_LISTENER_FAILED_STRING = @"Audio queue remove listener failed.";
NSString * const AS_AUDIO_QUEUE_START_FAILED_STRING = @"Audio queue start failed.";
NSString * const AS_AUDIO_QUEUE_BUFFER_MISMATCH_STRING = @"Audio queue buffers don't match.";
NSString * const AS_AUDIO_QUEUE_DISPOSE_FAILED_STRING = @"Audio queue dispose failed.";
NSString * const AS_AUDIO_QUEUE_PAUSE_FAILED_STRING = @"Audio queue pause failed.";
NSString * const AS_AUDIO_QUEUE_STOP_FAILED_STRING = @"Audio queue stop failed.";
NSString * const AS_AUDIO_DATA_NOT_FOUND_STRING = @"No audio data found.";
NSString * const AS_AUDIO_QUEUE_FLUSH_FAILED_STRING = @"Audio queue flush failed.";
NSString * const AS_GET_AUDIO_TIME_FAILED_STRING = @"Audio queue get current time failed.";
NSString * const AS_AUDIO_STREAMER_FAILED_STRING = @"Audio playback failed";
NSString * const AS_NETWORK_CONNECTION_FAILED_STRING = @"Network connection failed";
NSString * const AS_AUDIO_BUFFER_TOO_SMALL_STRING = @"Audio packets are larger than kAQDefaultBufSize.";

@interface AudioStreamer ()

- (void)handlePropertyChangeForFileStream:(AudioFileStreamID)inAudioFileStream
                     fileStreamPropertyID:(AudioFileStreamPropertyID)inPropertyID
                                  ioFlags:(UInt32 *)ioFlags;
- (void)handleAudioPackets:(const void *)inInputData
               numberBytes:(UInt32)inNumberBytes
             numberPackets:(UInt32)inNumberPackets
        packetDescriptions:(AudioStreamPacketDescription *)inPacketDescriptions;
- (void)handleBufferCompleteForQueue:(AudioQueueRef)inAQ
                              buffer:(AudioQueueBufferRef)inBuffer;
- (void)handlePropertyChangeForQueue:(AudioQueueRef)inAQ
                          propertyID:(AudioQueuePropertyID)inID;
- (void)handleInterruptionChangeToState:(AudioQueuePropertyID)inInterruptionState;
- (void)enqueueBuffer;
- (void)handleReadFromStream:(CFReadStreamRef)aStream
                   eventType:(CFStreamEventType)eventType;

@end

#pragma mark Audio Callback Function Prototypes

void MyAudioQueueOutputCallback(void* inClientData, AudioQueueRef inAQ, AudioQueueBufferRef inBuffer);
void MyAudioQueueIsRunningCallback(void *inUserData, AudioQueueRef inAQ, AudioQueuePropertyID inID);
void MyPropertyListenerProc(	void *							inClientData,
                            AudioFileStreamID				inAudioFileStream,
                            AudioFileStreamPropertyID		inPropertyID,
                            UInt32 *						ioFlags);
void MyPacketsProc(				void *							inClientData,
                   UInt32							inNumberBytes,
                   UInt32							inNumberPackets,
                   const void *					inInputData,
                   AudioStreamPacketDescription	*inPacketDescriptions);
OSStatus MyEnqueueBuffer(AudioStreamer* myData);

void MyAudioSessionInterruptionListener(void *inClientData, UInt32 inInterruptionState);

#pragma mark Audio Callback Function Implementations

    //
    // MyPropertyListenerProc
    //
void MyPropertyListenerProc(	void *							inClientData,
                            AudioFileStreamID				inAudioFileStream,
                            AudioFileStreamPropertyID		inPropertyID,
                            UInt32 *						ioFlags)
{
    AudioStreamer* streamer = (__bridge AudioStreamer *)inClientData;
	[streamer
     handlePropertyChangeForFileStream:inAudioFileStream
     fileStreamPropertyID:inPropertyID
     ioFlags:ioFlags];
}

    //
    // MyPacketsProc
    //
    // This function is adapted from Apple's example in AudioFileStreamExample with
    // CBR functionality added.
    //
void MyPacketsProc(				void *							inClientData,
                   UInt32							inNumberBytes,
                   UInt32							inNumberPackets,
                   const void *					inInputData,
                   AudioStreamPacketDescription	*inPacketDescriptions)
{
        // this is called by audio file stream when it finds packets of audio
	AudioStreamer* streamer = (__bridge AudioStreamer *)inClientData;
	[streamer
     handleAudioPackets:inInputData
     numberBytes:inNumberBytes
     numberPackets:inNumberPackets
     packetDescriptions:inPacketDescriptions];
}

    //
    // MyAudioQueueOutputCallback
    //
    // This function is unchanged from Apple's example in AudioFileStreamExample.
    //
void MyAudioQueueOutputCallback(	void*					inClientData,
                                AudioQueueRef			inAQ,
                                AudioQueueBufferRef		inBuffer)
{
	AudioStreamer* streamer = (__bridge AudioStreamer*)inClientData;
	[streamer handleBufferCompleteForQueue:inAQ buffer:inBuffer];
}

    //
    // MyAudioQueueIsRunningCallback
    //
void MyAudioQueueIsRunningCallback(void *inUserData, AudioQueueRef inAQ, AudioQueuePropertyID inID)
{
	AudioStreamer* streamer = (__bridge AudioStreamer *)inUserData;
	[streamer handlePropertyChangeForQueue:inAQ propertyID:inID];
}


    //
    // MyAudioSessionInterruptionListener
    //
void MyAudioSessionInterruptionListener(void *inClientData, UInt32 inInterruptionState)
{
	[__streamer handleInterruptionChangeToState:inInterruptionState];
}

#pragma mark CFReadStream Callback Function Implementations

    //
    // ReadStreamCallBack
    //
void ASReadStreamCallBack
(
 CFReadStreamRef aStream,
 CFStreamEventType eventType,
 void* inClientInfo
 )
{
	AudioStreamer* streamer = (__bridge AudioStreamer *)inClientInfo;
	[streamer handleReadFromStream:aStream eventType:eventType];
}

@implementation AudioStreamer

@synthesize errorCode;
@synthesize state;
@synthesize stopReason;
    //@synthesize bitRate;
@synthesize httpHeaders;
    //@synthesize numberOfChannels;
@synthesize vbr;

    //
    // initWithURL
    //
    // Init method for the object.
    //
- (id)initWithURL:(NSURL *)aURL
{
	self = [super init];

	return self;
}

    //
    // bufferFillPercentage
    //
    // returns a value between 0 and 1 that represents how full the buffer is
    //
-(double)bufferFillPercentage
{
	return (double)buffersUsed/(double)(kNumAQBufs - 1);
}


    //
    // isFinishing
    //
    // returns YES if the audio has reached a stopping condition.
    //
- (BOOL)isFinishing
{
	@synchronized (self)
	{
		if ((errorCode != AS_NO_ERROR && state != AS_INITIALIZED) ||
			((state == AS_STOPPING || state == AS_STOPPED) &&
             stopReason != AS_STOPPING_TEMPORARILY))
		{
			return YES;
		}
	}
	
	return NO;
}

    //
    // runLoopShouldExit
    //
    // returns YES if the run loop should exit.
    //
- (BOOL)runLoopShouldExit
{
	@synchronized(self)
	{
		if (errorCode != AS_NO_ERROR ||
			(state == AS_STOPPED &&
             stopReason != AS_STOPPING_TEMPORARILY))
		{
			return YES;
		}
	}
	
	return NO;
}

    //
    // stringForErrorCode:
    //
+ (NSString *)stringForErrorCode:(AudioStreamerErrorCode)anErrorCode
{
	switch (anErrorCode)
	{
		case AS_NO_ERROR:
			return AS_NO_ERROR_STRING;
		case AS_FILE_STREAM_GET_PROPERTY_FAILED:
			return AS_FILE_STREAM_GET_PROPERTY_FAILED_STRING;
		case AS_FILE_STREAM_SEEK_FAILED:
			return AS_FILE_STREAM_SEEK_FAILED_STRING;
		case AS_FILE_STREAM_PARSE_BYTES_FAILED:
			return AS_FILE_STREAM_PARSE_BYTES_FAILED_STRING;
		case AS_AUDIO_QUEUE_CREATION_FAILED:
			return AS_AUDIO_QUEUE_CREATION_FAILED_STRING;
		case AS_AUDIO_QUEUE_BUFFER_ALLOCATION_FAILED:
			return AS_AUDIO_QUEUE_BUFFER_ALLOCATION_FAILED_STRING;
		case AS_AUDIO_QUEUE_ENQUEUE_FAILED:
			return AS_AUDIO_QUEUE_ENQUEUE_FAILED_STRING;
		case AS_AUDIO_QUEUE_ADD_LISTENER_FAILED:
			return AS_AUDIO_QUEUE_ADD_LISTENER_FAILED_STRING;
		case AS_AUDIO_QUEUE_REMOVE_LISTENER_FAILED:
			return AS_AUDIO_QUEUE_REMOVE_LISTENER_FAILED_STRING;
		case AS_AUDIO_QUEUE_START_FAILED:
			return AS_AUDIO_QUEUE_START_FAILED_STRING;
		case AS_AUDIO_QUEUE_BUFFER_MISMATCH:
			return AS_AUDIO_QUEUE_BUFFER_MISMATCH_STRING;
		case AS_FILE_STREAM_OPEN_FAILED:
			return AS_FILE_STREAM_OPEN_FAILED_STRING;
		case AS_FILE_STREAM_CLOSE_FAILED:
			return AS_FILE_STREAM_CLOSE_FAILED_STRING;
		case AS_AUDIO_QUEUE_DISPOSE_FAILED:
			return AS_AUDIO_QUEUE_DISPOSE_FAILED_STRING;
		case AS_AUDIO_QUEUE_PAUSE_FAILED:
			return AS_AUDIO_QUEUE_DISPOSE_FAILED_STRING;
		case AS_AUDIO_QUEUE_FLUSH_FAILED:
			return AS_AUDIO_QUEUE_FLUSH_FAILED_STRING;
		case AS_AUDIO_DATA_NOT_FOUND:
			return AS_AUDIO_DATA_NOT_FOUND_STRING;
		case AS_GET_AUDIO_TIME_FAILED:
			return AS_GET_AUDIO_TIME_FAILED_STRING;
		case AS_NETWORK_CONNECTION_FAILED:
			return AS_NETWORK_CONNECTION_FAILED_STRING;
		case AS_AUDIO_QUEUE_STOP_FAILED:
			return AS_AUDIO_QUEUE_STOP_FAILED_STRING;
		case AS_AUDIO_STREAMER_FAILED:
			return AS_AUDIO_STREAMER_FAILED_STRING;
		case AS_AUDIO_BUFFER_TOO_SMALL:
			return AS_AUDIO_BUFFER_TOO_SMALL_STRING;
		default:
			return AS_AUDIO_STREAMER_FAILED_STRING;
	}
	
	return AS_AUDIO_STREAMER_FAILED_STRING;
}

    //
    // presentAlertWithTitle:message:
    //
- (void)presentAlertWithTitle:(NSString*)title message:(NSString*)message
{
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:title, @"title", message, @"message", nil];
	NSNotification *notification =
	[NSNotification
	 notificationWithName:ASPresentAlertWithTitleNotification
	 object:self
	 userInfo:userInfo];
	[[NSNotificationCenter defaultCenter]
	 postNotification:notification];
}

    //
    // failWithErrorCode:
    //

- (void)failWithErrorCode:(AudioStreamerErrorCode)anErrorCode
{
	@synchronized(self)
	{
		if (errorCode != AS_NO_ERROR)
		{
                // Only set the error once.
			return;
		}
		
		errorCode = anErrorCode;
        
		if (err)
		{
			char *errChars = (char *)&err;
			NSLog(@"%@ err: %c%c%c%c %d\n",
                  [AudioStreamer stringForErrorCode:anErrorCode],
                  errChars[3], errChars[2], errChars[1], errChars[0],
                  (int)err);
		}
		else
		{
			NSLog(@"%@", [AudioStreamer stringForErrorCode:anErrorCode]);
		}
        
		if (state == AS_PLAYING ||
			state == AS_PAUSED ||
			state == AS_BUFFERING)
		{
			self.state = AS_STOPPING;
			stopReason = AS_STOPPING_ERROR;
			AudioQueueStop(audioQueue, true);
		}
        
		[self presentAlertWithTitle:NSLocalizedStringFromTable(@"File Error", @"Errors", nil)
							message:NSLocalizedStringFromTable(@"Unable to configure network read stream.", @"Errors", nil)];
	}
}

    //
    // mainThreadStateNotification
    //
- (void)mainThreadStateNotification
{
	NSNotification *notification =
    [NSNotification
     notificationWithName:ASStatusChangedNotification
     object:self];
	[[NSNotificationCenter defaultCenter]
     postNotification:notification];
}

    //
    // setState:
    //
- (void)setState:(AudioStreamerState)aStatus
{
	@synchronized(self)
	{
		if (state != aStatus)
		{
			state = aStatus;
			
			if ([[NSThread currentThread] isEqual:[NSThread mainThread]])
			{
				[self mainThreadStateNotification];
			}
			else
			{
				[self
                 performSelectorOnMainThread:@selector(mainThreadStateNotification)
                 withObject:nil
                 waitUntilDone:NO];
			}
		}
	}
}

    //
    // isPlaying
    //
    // returns YES if the audio currently playing.
    //
- (BOOL)isPlaying
{
	if (state == AS_PLAYING)
	{
		return YES;
	}
	
	return NO;
}

    //
    // isPaused
    //
    // returns YES if the audio currently playing.
    //
- (BOOL)isPaused
{
	if (state == AS_PAUSED)
	{
		return YES;
	}
	
	return NO;
}

    //
    // isWaiting
    //
    // returns YES if the AudioStreamer is waiting for a state transition of some
    // kind.
    //
- (BOOL)isWaiting
{
	@synchronized(self)
	{
		if ([self isFinishing] ||
			state == AS_STARTING_FILE_THREAD||
			state == AS_WAITING_FOR_DATA ||
			state == AS_WAITING_FOR_QUEUE_TO_START ||
			state == AS_BUFFERING)
		{
			return YES;
		}
	}
	
	return NO;
}

    //
    // isIdle
    //
- (BOOL)isIdle
{
	if (state == AS_INITIALIZED)
	{
		return YES;
	}
	
	return NO;
}

    //
    // hintForFileExtension:
    //
+ (AudioFileTypeID)hintForFileExtension:(NSString *)fileExtension
{
	AudioFileTypeID fileTypeHint = kAudioFileMP3Type;
	if ([fileExtension isEqual:@"mp3"])
	{
		fileTypeHint = kAudioFileMP3Type;
	}
	else if ([fileExtension isEqual:@"wav"])
	{
		fileTypeHint = kAudioFileWAVEType;
	}
	else if ([fileExtension isEqual:@"aifc"])
	{
		fileTypeHint = kAudioFileAIFCType;
	}
	else if ([fileExtension isEqual:@"aiff"])
	{
		fileTypeHint = kAudioFileAIFFType;
	}
	else if ([fileExtension isEqual:@"m4a"])
	{
		fileTypeHint = kAudioFileM4AType;
	}
	else if ([fileExtension isEqual:@"mp4"])
	{
		fileTypeHint = kAudioFileMPEG4Type;
	}
	else if ([fileExtension isEqual:@"caf"])
	{
		fileTypeHint = kAudioFileCAFType;
	}
	else if ([fileExtension isEqual:@"aac"])
	{
		fileTypeHint = kAudioFileAAC_ADTSType;
	}
	return fileTypeHint;
}

    //
    // hintForMIMEType
    //

+ (AudioFileTypeID)hintForMIMEType:(NSString *)mimeType
{
	AudioFileTypeID fileTypeHint = kAudioFileMP3Type;
	if ([mimeType isEqual:@"audio/mpeg"])
	{
		fileTypeHint = kAudioFileMP3Type;
	}
	else if ([mimeType isEqual:@"audio/x-wav"])
	{
		fileTypeHint = kAudioFileWAVEType;
	}
	else if ([mimeType isEqual:@"audio/x-aiff"])
	{
		fileTypeHint = kAudioFileAIFFType;
	}
	else if ([mimeType isEqual:@"audio/x-m4a"])
	{
		fileTypeHint = kAudioFileM4AType;
	}
	else if ([mimeType isEqual:@"audio/mp4"])
	{
		fileTypeHint = kAudioFileMPEG4Type;
	}
	else if ([mimeType isEqual:@"audio/x-caf"])
	{
		fileTypeHint = kAudioFileCAFType;
	}
	else if ([mimeType isEqual:@"audio/aac"] || [mimeType isEqual:@"audio/aacp"])
	{
		fileTypeHint = kAudioFileAAC_ADTSType;
	}
	return fileTypeHint;
}

    //
    // openReadStream
    //
- (BOOL)openReadStream
{
	@synchronized(self)
	{
		NSAssert([[NSThread currentThread] isEqual:internalThread],
                 @"File stream download must be started on the internalThread");
		NSAssert(stream == nil, @"Download stream already initialized");
		
            //
            // Create the HTTP GET request
            //
		CFHTTPMessageRef message= CFHTTPMessageCreateRequest(NULL, (CFStringRef)@"GET", (__bridge CFURLRef)url, kCFHTTPVersion1_1);
		stream = CFReadStreamCreateForHTTPRequest(NULL, message);
		CFRelease(message);
		
            //
            // Enable stream redirection
            //
		if (CFReadStreamSetProperty(
                                    stream,
                                    kCFStreamPropertyHTTPShouldAutoredirect,
                                    kCFBooleanTrue) == false)
		{
			[self presentAlertWithTitle:NSLocalizedStringFromTable(@"File Error", @"Errors", nil)
								message:NSLocalizedStringFromTable(@"Unable to configure network read stream.", @"Errors", nil)];
			return NO;
		}
		
            //
            // Handle SSL connections
            //
		if( [[url absoluteString] rangeOfString:@"https"].location != NSNotFound )
		{
			NSDictionary *sslSettings =
            [NSDictionary dictionaryWithObjectsAndKeys:
             (NSString *)kCFStreamSocketSecurityLevelNegotiatedSSL, kCFStreamSSLLevel,
             [NSNumber numberWithBool:YES], kCFStreamSSLAllowsExpiredCertificates,
             [NSNumber numberWithBool:YES], kCFStreamSSLAllowsExpiredRoots,
             [NSNumber numberWithBool:YES], kCFStreamSSLAllowsAnyRoot,
             [NSNumber numberWithBool:NO], kCFStreamSSLValidatesCertificateChain,
             [NSNull null], kCFStreamSSLPeerName,
             nil];
            
			CFReadStreamSetProperty(stream, kCFStreamPropertySSLSettings, (__bridge CFTypeRef)(sslSettings));
		}
		
            //
            // We're now ready to receive data
            //
		self.state = AS_WAITING_FOR_DATA;
        
            //
            // Open the stream
            //
		if (!CFReadStreamOpen(stream))
		{
			CFRelease(stream);
			[self presentAlertWithTitle:NSLocalizedStringFromTable(@"File Error", @"Errors", nil)
								message:NSLocalizedStringFromTable(@"Unable to configure network read stream.", @"Errors", nil)];
			return NO;
		}
		
            //
            // Set our callback function to receive the data
            //
		CFStreamClientContext context = {0, (__bridge void *)(self), NULL, NULL, NULL};
		CFReadStreamSetClient(
                              stream,
                              kCFStreamEventHasBytesAvailable | kCFStreamEventErrorOccurred | kCFStreamEventEndEncountered,
                              ASReadStreamCallBack,
                              &context);
		CFReadStreamScheduleWithRunLoop(stream, CFRunLoopGetCurrent(), kCFRunLoopCommonModes);
	}
	
	return YES;
}

    //
    // startInternal
    //
    // This method contains bits of the "main" function from Apple's example in
    // AudioFileStreamExample.
    //
- (void)startInternal
{
		@synchronized(self)
	{
		if (state != AS_STARTING_FILE_THREAD)
		{
			if (state != AS_STOPPING &&
				state != AS_STOPPED)
			{
				NSLog(@"### Not starting audio thread. State code is: %d", state);
			}
			self.state = AS_INITIALIZED;
			return;
		}
		
        
        
            // initialize a mutex and condition so that we can block on buffers in use.
		pthread_mutex_init(&queueBuffersMutex, NULL);
		pthread_cond_init(&queueBufferReadyCondition, NULL);
		
		if (![self openReadStream])
		{
			goto cleanup;
		}
	}
	
        //
        // Process the run loop until playback is finished or failed.
        //
	BOOL isRunning = YES;
	do
	{
		isRunning = [[NSRunLoop currentRunLoop]
                     runMode:NSDefaultRunLoopMode
                     beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.25]];
		
		@synchronized(self) {
            
		}
		if (buffersUsed == 0 && self.state == AS_PLAYING)
		{
			err = AudioQueuePause(audioQueue);
			if (err)
			{
				[self failWithErrorCode:AS_AUDIO_QUEUE_PAUSE_FAILED];
				return;
			}
			self.state = AS_BUFFERING;
		}
	} while (isRunning && ![self runLoopShouldExit]);
	
cleanup:
    
	@synchronized(self)
	{
            //
            // Cleanup the read stream if it is still open
            //
		if (stream)
		{
			CFReadStreamClose(stream);
			CFRelease(stream);
			stream = nil;
		}
		
            //
            // Close the audio file strea,
            //
		if (audioFileStream)
		{
			err = AudioFileStreamClose(audioFileStream);
			audioFileStream = nil;
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_CLOSE_FAILED];
			}
		}
		
            //
            // Dispose of the Audio Queue
            //
		if (audioQueue)
		{
			err = AudioQueueDispose(audioQueue, true);
			audioQueue = nil;
			if (err)
			{
				[self failWithErrorCode:AS_AUDIO_QUEUE_DISPOSE_FAILED];
			}
		}
        
		pthread_mutex_destroy(&queueBuffersMutex);
		pthread_cond_destroy(&queueBufferReadyCondition);
		AudioSessionSetActive(false);
		httpHeaders = nil;
		bytesFilled = 0;
		packetsFilled = 0;
		seekByteOffset = 0;
		packetBufferSize = 0;
		self.state = AS_INITIALIZED;
		internalThread = nil;
	}
    
}

    //
    // start
    //

- (void)start
{
	@synchronized (self)
	{
		if (state == AS_PAUSED)
		{
			[self pause];
		}
		else if (state == AS_INITIALIZED)
		{
			NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]],
                     @"Playback can only be started from the main thread.");
			notificationCenter =
            [NSNotificationCenter defaultCenter];
			self.state = AS_STARTING_FILE_THREAD;
			internalThread =
            [[NSThread alloc]
             initWithTarget:self
             selector:@selector(startInternal)
             object:nil];
			[internalThread setName:@"InternalThread"];
			[internalThread start];
		}
	}
}
    //do i need this method
- (double)progress
{
	@synchronized(self)
	{
		if (sampleRate > 0 && ![self isFinishing])
		{
			if (state != AS_PLAYING && state != AS_PAUSED && state != AS_BUFFERING)
			{
				return lastProgress;
			}
            
			AudioTimeStamp queueTime;
			Boolean discontinuity;
			err = AudioQueueGetCurrentTime(audioQueue, NULL, &queueTime, &discontinuity);
            
			const OSStatus AudioQueueStopped = 0x73746F70; // 0x73746F70 is 'stop'
			if (err == AudioQueueStopped)
			{
				return lastProgress;
			}
			else if (err)
			{
				[self failWithErrorCode:AS_GET_AUDIO_TIME_FAILED];
			}
            
			double progress = seekTime + queueTime.mSampleTime / sampleRate;
			if (progress < 0.0)
			{
				progress = 0.0;
			}
			
			lastProgress = progress;
			return progress;
		}
	}
	
	return lastProgress;
}

    //
    // calculatedBitRate
    //
- (double)calculatedBitRate
{
	if (vbr)
	{
		if (packetDuration && processedPacketsCount > BitRateEstimationMinPackets)
		{
			double averagePacketByteSize = processedPacketsSizeTotal / processedPacketsCount;
			return 8.0 * averagePacketByteSize / packetDuration;
		}
        
		if (bitRate)
		{
			return (double)bitRate;
		}
	}
	else
	{
		bitRate = 8.0 * asbd.mSampleRate * asbd.mBytesPerPacket * asbd.mFramesPerPacket;
		return bitRate;
	}
	return 0;
}

    //
    // pause
    //

- (void)pause
{
	@synchronized(self)
	{
		if (state == AS_PLAYING)
		{
			err = AudioQueuePause(audioQueue);
			if (err)
			{
				[self failWithErrorCode:AS_AUDIO_QUEUE_PAUSE_FAILED];
				return;
			}
			self.state = AS_PAUSED;
		}
		else if (state == AS_PAUSED)
		{
			err = AudioQueueStart(audioQueue, NULL);
			if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) {
				if (bgTaskId != UIBackgroundTaskInvalid) {
					bgTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:NULL];
				}
			}
			if (err)
			{
				[self failWithErrorCode:AS_AUDIO_QUEUE_START_FAILED];
				return;
			}
			self.state = AS_PLAYING;
		}
	}
}

    //
    // stop
    //
    // This method can be called to stop downloading/playback before it completes.
    // It is automatically called when an error occurs.
    //
- (void)stop
{
	@synchronized(self)
	{
		if (state == AS_WAITING_FOR_DATA || state == AS_STARTING_FILE_THREAD)
			return;
		if (audioQueue &&
			(state == AS_PLAYING || state == AS_PAUSED ||
             state == AS_BUFFERING || state == AS_WAITING_FOR_QUEUE_TO_START))
		{
			self.state = AS_STOPPING;
			stopReason = AS_STOPPING_USER_ACTION;
			err = AudioQueueStop(audioQueue, true);
			if (err)
			{
				[self failWithErrorCode:AS_AUDIO_QUEUE_STOP_FAILED];
				return;
			}
		}
		else if (state != AS_INITIALIZED)
		{
			self.state = AS_STOPPED;
			stopReason = AS_STOPPING_USER_ACTION;
		}
		seekWasRequested = NO;
	}
	
	while (state != AS_INITIALIZED)
	{
		[NSThread sleepForTimeInterval:0.1];
	}
}
- (void)handleReadFromStream:(CFReadStreamRef)aStream
                   eventType:(CFStreamEventType)eventType
{
	if (aStream != stream)
	{
		return;
	}
	
	if (eventType == kCFStreamEventErrorOccurred)
	{
		[self failWithErrorCode:AS_AUDIO_DATA_NOT_FOUND];
	}
	else if (eventType == kCFStreamEventEndEncountered)
	{
		@synchronized(self)
		{
			if ([self isFinishing])
			{
				return;
			}
		}
        
		if (bytesFilled)
		{
			if (self.state == AS_WAITING_FOR_DATA)
			{
                
				self.state = AS_FLUSHING_EOF;
			}
			[self enqueueBuffer];
		}
        
		@synchronized(self)
		{
			if (state == AS_WAITING_FOR_DATA)
			{
				[self failWithErrorCode:AS_AUDIO_DATA_NOT_FOUND];
			}
            
			else if (![self isFinishing])
			{
				if (audioQueue)
				{
					err = AudioQueueFlush(audioQueue);
					if (err)
					{
						[self failWithErrorCode:AS_AUDIO_QUEUE_FLUSH_FAILED];
						return;
					}
                    
					self.state = AS_STOPPING;
					stopReason = AS_STOPPING_EOF;
					err = AudioQueueStop(audioQueue, false);
					if (err)
					{
						[self failWithErrorCode:AS_AUDIO_QUEUE_FLUSH_FAILED];
						return;
					}
				}
				else
				{
					self.state = AS_STOPPED;
					stopReason = AS_STOPPING_EOF;
				}
			}
		}
	}
	else if (eventType == kCFStreamEventHasBytesAvailable)
	{
		if (!httpHeaders)
		{
			CFTypeRef message =
            CFReadStreamCopyProperty(stream, kCFStreamPropertyHTTPResponseHeader);
			httpHeaders =
            (__bridge NSDictionary *)CFHTTPMessageCopyAllHeaderFields((CFHTTPMessageRef)message);
			CFRelease(message);
            
			if (seekByteOffset == 0)
			{
				fileLength = [[httpHeaders objectForKey:@"Content-Length"] integerValue];
			}
		}
        
		if (!audioFileStream)
		{
            
			AudioFileTypeID fileTypeHint =
            [AudioStreamer hintForMIMEType:[httpHeaders objectForKey:@"Content-Type"]];
			err = AudioFileStreamOpen((__bridge void *)(self), MyPropertyListenerProc, MyPacketsProc,
                                      fileTypeHint, &audioFileStream);
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_OPEN_FAILED];
				return;
			}
		}
		
        
		UInt8 bytes[kAQDefaultBufSize];
		CFIndex length;
        
		
		@synchronized(self)
		{
			if ([self isFinishing] || !CFReadStreamHasBytesAvailable(stream))
			{
				return;
			}
            
			length = CFReadStreamRead(stream, bytes, kAQDefaultBufSize);
			
			if (length == -1)
			{
				[self failWithErrorCode:AS_AUDIO_DATA_NOT_FOUND];
				return;
			}
			
			if (length == 0)
			{
				return;
			}
            
		}
		if (discontinuous)
		{
			err = AudioFileStreamParseBytes(audioFileStream, length, bytes, kAudioFileStreamParseFlag_Discontinuity);
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_PARSE_BYTES_FAILED];
				return;
			}
		}
		else
		{
			err = AudioFileStreamParseBytes(audioFileStream, length, bytes, 0);
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_PARSE_BYTES_FAILED];
				return;
			}
		}
	}
}

    //
    // enqueueBuffer
    //
    // This function is adapted from Apple's example in AudioFileStreamExample with
    // CBR functionality added.
    //
- (void)enqueueBuffer
{
	@synchronized(self)
	{
		if ([self isFinishing] || stream == 0)
		{
			return;
		}
		
		inuse[fillBufferIndex] = true;		// set in use flag
		buffersUsed++;
        
            // enqueue buffer
		AudioQueueBufferRef fillBuf = audioQueueBuffer[fillBufferIndex];
		fillBuf->mAudioDataByteSize = bytesFilled;
		
		if (packetsFilled)
		{
			err = AudioQueueEnqueueBuffer(audioQueue, fillBuf, packetsFilled, packetDescs);
		}
		else
		{
			err = AudioQueueEnqueueBuffer(audioQueue, fillBuf, 0, NULL);
		}
		
		if (err)
		{
			[self failWithErrorCode:AS_AUDIO_QUEUE_ENQUEUE_FAILED];
			return;
		}
        
		
		if (state == AS_BUFFERING ||
			state == AS_WAITING_FOR_DATA ||
			state == AS_FLUSHING_EOF ||
			(state == AS_STOPPED && stopReason == AS_STOPPING_TEMPORARILY))
		{
                //
                // Fill all the buffers before starting. This ensures that the
                // AudioFileStream stays a small amount ahead of the AudioQueue to
                // avoid an audio glitch playing streaming files on iPhone SDKs < 3.0
                //
			if (state == AS_FLUSHING_EOF || buffersUsed == kNumAQBufs - 1)
			{
				if (self.state == AS_BUFFERING)
				{
					err = AudioQueueStart(audioQueue, NULL);
					if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) {
						bgTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:NULL];
					}
					if (err)
					{
						[self failWithErrorCode:AS_AUDIO_QUEUE_START_FAILED];
						return;
					}
					self.state = AS_PLAYING;
				}
				else
				{
					self.state = AS_WAITING_FOR_QUEUE_TO_START;
                    
					err = AudioQueueStart(audioQueue, NULL);
					if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) {
						bgTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:NULL];
					}
					if (err)
					{
						[self failWithErrorCode:AS_AUDIO_QUEUE_START_FAILED];
						return;
					}
				}
			}
		}
        
            // go to next buffer
		if (++fillBufferIndex >= kNumAQBufs) fillBufferIndex = 0;
		bytesFilled = 0;		// reset bytes filled
		packetsFilled = 0;		// reset packets filled
	}
    
        // wait until next buffer is not in use
	pthread_mutex_lock(&queueBuffersMutex);
	while (inuse[fillBufferIndex])
	{
		pthread_cond_wait(&queueBufferReadyCondition, &queueBuffersMutex);
	}
	pthread_mutex_unlock(&queueBuffersMutex);
}

    //
    // createQueue
    //

- (void)createQueue
{
	sampleRate = asbd.mSampleRate;
	packetDuration = asbd.mFramesPerPacket / sampleRate;
    
        // create the audio queue
	err = AudioQueueNewOutput(&asbd, MyAudioQueueOutputCallback, (__bridge void *)(self), NULL, NULL, 0, &audioQueue);
	if (err)
	{
		[self failWithErrorCode:AS_AUDIO_QUEUE_CREATION_FAILED];
		return;
	}
    
	err = AudioQueueAddPropertyListener(audioQueue, kAudioQueueProperty_IsRunning, MyAudioQueueIsRunningCallback, (__bridge void *)(self));
	if (err)
	{
		[self failWithErrorCode:AS_AUDIO_QUEUE_ADD_LISTENER_FAILED];
		return;
	}
	
        // get the packet size if it is available
	if (vbr)
	{
		UInt32 sizeOfUInt32 = sizeof(UInt32);
		err = AudioFileStreamGetProperty(audioFileStream, kAudioFileStreamProperty_PacketSizeUpperBound, &sizeOfUInt32, &packetBufferSize);
		if (err || packetBufferSize == 0)
		{
			err = AudioFileStreamGetProperty(audioFileStream, kAudioFileStreamProperty_MaximumPacketSize, &sizeOfUInt32, &packetBufferSize);
			if (err || packetBufferSize == 0)
			{
                    // No packet size available, just use the default
				packetBufferSize = kAQDefaultBufSize;
			}
		}
	}
	else
	{
		packetBufferSize = kAQDefaultBufSize;
	}
	for (unsigned int i = 0; i < kNumAQBufs; ++i)
	{
		err = AudioQueueAllocateBuffer(audioQueue, packetBufferSize, &audioQueueBuffer[i]);
		if (err)
		{
			[self failWithErrorCode:AS_AUDIO_QUEUE_BUFFER_ALLOCATION_FAILED];
			return;
		}
	}
    
        // get the cookie size
	UInt32 cookieSize;
	Boolean writable;
	OSStatus ignorableError;
	ignorableError = AudioFileStreamGetPropertyInfo(audioFileStream, kAudioFileStreamProperty_MagicCookieData, &cookieSize, &writable);
	if (ignorableError)
	{
		return;
	}
    
        // get the cookie data
	void* cookieData = calloc(1, cookieSize);
	ignorableError = AudioFileStreamGetProperty(audioFileStream, kAudioFileStreamProperty_MagicCookieData, &cookieSize, cookieData);
	if (ignorableError)
	{
		return;
	}
    
        // set the cookie on the queue.
	ignorableError = AudioQueueSetProperty(audioQueue, kAudioQueueProperty_MagicCookie, cookieData, cookieSize);
	free(cookieData);
	if (ignorableError)
	{
		return;
	}
}

    //
    // handlePropertyChangeForFileStream:fileStreamPropertyID:ioFlags:
    //
- (void)handlePropertyChangeForFileStream:(AudioFileStreamID)inAudioFileStream
                     fileStreamPropertyID:(AudioFileStreamPropertyID)inPropertyID
                                  ioFlags:(UInt32 *)ioFlags
{
	@synchronized(self)
	{
		if ([self isFinishing])
		{
			return;
		}
		
		if (inPropertyID == kAudioFileStreamProperty_ReadyToProducePackets)
		{
			discontinuous = true;
		}
		else if (inPropertyID == kAudioFileStreamProperty_DataOffset)
		{
			SInt64 offset;
			UInt32 offsetSize = sizeof(offset);
			err = AudioFileStreamGetProperty(inAudioFileStream, kAudioFileStreamProperty_DataOffset, &offsetSize, &offset);
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_GET_PROPERTY_FAILED];
				return;
			}
			dataOffset = offset;
			
			if (audioDataByteCount)
			{
				fileLength = dataOffset + audioDataByteCount;
			}
		}
		else if (inPropertyID == kAudioFileStreamProperty_AudioDataByteCount)
		{
			UInt32 byteCountSize = sizeof(UInt64);
			err = AudioFileStreamGetProperty(inAudioFileStream, kAudioFileStreamProperty_AudioDataByteCount, &byteCountSize, &audioDataByteCount);
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_GET_PROPERTY_FAILED];
				return;
			}
			fileLength = dataOffset + audioDataByteCount;
		}
		else if (inPropertyID == kAudioFileStreamProperty_DataFormat)
		{
			if (asbd.mSampleRate == 0)
			{
				UInt32 asbdSize = sizeof(asbd);
				
                    // get the stream format.
				err = AudioFileStreamGetProperty(inAudioFileStream, kAudioFileStreamProperty_DataFormat, &asbdSize, &asbd);
				if (err)
				{
					[self failWithErrorCode:AS_FILE_STREAM_GET_PROPERTY_FAILED];
					return;
				}
			}
		}
		else if (inPropertyID == kAudioFileStreamProperty_FormatList)
		{
			Boolean outWriteable;
			UInt32 formatListSize;
			err = AudioFileStreamGetPropertyInfo(inAudioFileStream, kAudioFileStreamProperty_FormatList, &formatListSize, &outWriteable);
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_GET_PROPERTY_FAILED];
				return;
			}
			
			AudioFormatListItem *formatList = malloc(formatListSize);
	        err = AudioFileStreamGetProperty(inAudioFileStream, kAudioFileStreamProperty_FormatList, &formatListSize, formatList);
			if (err)
			{
				[self failWithErrorCode:AS_FILE_STREAM_GET_PROPERTY_FAILED];
				return;
			}
            
			for (int i = 0; i * sizeof(AudioFormatListItem) < formatListSize; i += sizeof(AudioFormatListItem))
			{
				AudioStreamBasicDescription pasbd = formatList[i].mASBD;
                
				if(pasbd.mFormatID == kAudioFormatMPEG4AAC_HE_V2) //&&
				//   [[UIDevice currentDevice] platformHasCapability:(UIDeviceSupportsARMV7)] &&
				//   kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_MIN)
				{
                        // We found HE-AAC v2 (SBR+PS), but before trying to play it
                        // we need to make sure that both the hardware and software are
                        // capable of doing so...
                        //#if !TARGET_IPHONE_SIMULATOR
					asbd = pasbd;
					break;
				} else if (pasbd.mFormatID == kAudioFormatMPEG4AAC_HE)
				{
                        //
                        // We've found HE-AAC, remember this to tell the audio queue
                        // when we construct it.
                        //
#if !TARGET_IPHONE_SIMULATOR
					asbd = pasbd;
#endif
					break;
				}
			}
			free(formatList);
		}
        
	}
}

    //
    // handleAudioPackets:numberBytes:numberPackets:packetDescriptions:
    //
- (void)handleAudioPackets:(const void *)inInputData
               numberBytes:(UInt32)inNumberBytes
             numberPackets:(UInt32)inNumberPackets
        packetDescriptions:(AudioStreamPacketDescription *)inPacketDescriptions;
{
	@synchronized(self)
	{
		if ([self isFinishing])
		{
			return;
		}
		
		if (bitRate == 0)
		{
			bitRate = ~0;
		}
        
		if (discontinuous)
		{
			discontinuous = false;
		}
		
		if (!audioQueue)
		{
			vbr = (inPacketDescriptions != nil);
			[self createQueue];
		}
	}
    
        // the following code assumes we're streaming VBR data. for CBR data, the second branch is used.
	if (inPacketDescriptions)
	{
		for (int i = 0; i < inNumberPackets; ++i)
		{
			SInt64 packetOffset = inPacketDescriptions[i].mStartOffset;
			SInt64 packetSize   = inPacketDescriptions[i].mDataByteSize;
			size_t bufSpaceRemaining;
			
			if (processedPacketsCount < BitRateEstimationMaxPackets)
			{
				processedPacketsSizeTotal += packetSize;
				processedPacketsCount += 1;
			}
			
			@synchronized(self)
			{
                    // If the audio was terminated before this point, then
                    // exit.
				if ([self isFinishing])
				{
					return;
				}
				
				if (packetSize > packetBufferSize)
				{
					[self failWithErrorCode:AS_AUDIO_BUFFER_TOO_SMALL];
				}
                
				bufSpaceRemaining = packetBufferSize - bytesFilled;
			}
            
                // if the space remaining in the buffer is not enough for this packet, then enqueue the buffer.
			if (bufSpaceRemaining < packetSize)
			{
				[self enqueueBuffer];
			}
			
			@synchronized(self)
			{
                    // If the audio was terminated while waiting for a buffer, then
                    // exit.
				if ([self isFinishing])
				{
					return;
				}
				if (bytesFilled + packetSize > packetBufferSize)
				{
					return;
				}
				
				AudioQueueBufferRef fillBuf = audioQueueBuffer[fillBufferIndex];
				memcpy((char*)fillBuf->mAudioData + bytesFilled, (const char*)inInputData + packetOffset, packetSize);
                
				packetDescs[packetsFilled] = inPacketDescriptions[i];
				packetDescs[packetsFilled].mStartOffset = bytesFilled;
				bytesFilled += packetSize;
				packetsFilled += 1;
			}
            size_t packetsDescsRemaining = kAQMaxPacketDescs - packetsFilled;
			if (packetsDescsRemaining == 0) {
				[self enqueueBuffer];
			}
		}
	}
	else
	{
		size_t offset = 0;
		while (inNumberBytes)
		{
			size_t bufSpaceRemaining = kAQDefaultBufSize - bytesFilled;
			if (bufSpaceRemaining < inNumberBytes)
			{
				[self enqueueBuffer];
			}
			
			@synchronized(self)
			{
				if ([self isFinishing])
				{
					return;
				}
				
				bufSpaceRemaining = kAQDefaultBufSize - bytesFilled;
				size_t copySize;
				if (bufSpaceRemaining < inNumberBytes)
				{
					copySize = bufSpaceRemaining;
				}
				else
				{
					copySize = inNumberBytes;
				}
                
				if (bytesFilled >= packetBufferSize)
				{
					return;
				}
				
                    // copy data to the audio queue buffer
				AudioQueueBufferRef fillBuf = audioQueueBuffer[fillBufferIndex];
				memcpy((char*)fillBuf->mAudioData + bytesFilled, (const char*)(inInputData + offset), copySize);
                
                
                    // keep track of bytes filled and packets filled
				bytesFilled += copySize;
				packetsFilled = 0;
				inNumberBytes -= copySize;
				offset += copySize;
			}
		}
	}
}

    //
    // handleBufferCompleteForQueue:buffer:
    //
- (void)handleBufferCompleteForQueue:(AudioQueueRef)inAQ
                              buffer:(AudioQueueBufferRef)inBuffer
{
	unsigned int bufIndex = -1;
	for (unsigned int i = 0; i < kNumAQBufs; ++i)
	{
		if (inBuffer == audioQueueBuffer[i])
		{
			bufIndex = i;
			break;
		}
	}
	
	if (bufIndex == -1)
	{
		[self failWithErrorCode:AS_AUDIO_QUEUE_BUFFER_MISMATCH];
		pthread_mutex_lock(&queueBuffersMutex);
		pthread_cond_signal(&queueBufferReadyCondition);
		pthread_mutex_unlock(&queueBuffersMutex);
		return;
	}
	
        // signal waiting thread that the buffer is free.
	pthread_mutex_lock(&queueBuffersMutex);
	inuse[bufIndex] = false;
	buffersUsed--;
    
        //
        //  Enable this logging to measure how many buffers are queued at any time.
        //
#if LOG_QUEUED_BUFFERS
	NSLog(@"Queued buffers: %ld", buffersUsed);
#endif
	
	pthread_cond_signal(&queueBufferReadyCondition);
	pthread_mutex_unlock(&queueBuffersMutex);
}

    //
    // handlePropertyChangeForQueue:propertyID:
    //
- (void)handlePropertyChangeForQueue:(AudioQueueRef)inAQ
                          propertyID:(AudioQueuePropertyID)inID
{
	@synchronized(self)
	{
		if (inID == kAudioQueueProperty_IsRunning)
		{
			if (state == AS_STOPPING)
			{
				self.state = AS_STOPPED;
			}
			else if (state == AS_WAITING_FOR_QUEUE_TO_START)
			{
				[NSRunLoop currentRunLoop];
				self.state = AS_PLAYING;
				if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) {
					if (bgTaskId != UIBackgroundTaskInvalid) {
						[[UIApplication sharedApplication] endBackgroundTask: bgTaskId];
					}
					bgTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:NULL];
				}
			}
			else
			{
				NSLog(@"AudioQueue changed state in unexpected way.");
			}
		}
	}
	
}

    //
    // handleInterruptionChangeForQueue:propertyID:
    //
    // Implementation for MyAudioQueueInterruptionListener
    //
- (void)handleInterruptionChangeToState:(AudioQueuePropertyID)inInterruptionState
{
	if (inInterruptionState == kAudioSessionBeginInterruption)
	{
		[self pause];
	}
	else if (inInterruptionState == kAudioSessionEndInterruption)
	{
		AudioSessionSetActive( true );
		[self pause];
	}
}

@end


