//
//  WordViewController.m
//  AccentMark
//
//  Created by Robert Millar on 6/24/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//
#import "alertView.h"
#import "WordViewController.h"
#import <CoreText/CoreText.h>
#import "EnterWordViewController.h"
#import "LearnToMarkWordsViewController.h"
#import "Sylibifier.h"

@interface WordViewController ()


@end

@implementation WordViewController

@synthesize word;
@synthesize wordType;
#define int i = 0
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{    [super viewDidLoad];
       urlString= [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=%@ ", wordType];
    url = [NSURL URLWithString:urlString];
    
    
        // Setup the URL with the JSON URL.
    
    //NSLog(@"id: %@", url ); //TEST CODE
   
    [self parseJSONWithURL:url];
    NSLog(@"parsing 1st");
   
    //NSLog(@"%@", wordArray);
    firstquestion=TRUE;
    secondquestion = TRUE;
    

    
    //set text for last button
    if ([wordType isEqual: @"1"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"3"]) {
    [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"4"]) {
    [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"7"]) {
    [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"9"]) {
    [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"10"]) {
    [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"13"]) {
    [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"14"]) {
    [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"17"]) {
    [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"19"]) {
    [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"23"]) {
    [_markOutlet setTitle:@"Place Mark Over 2nd UpperVowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"6"]) {
    [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"12"]) {
    [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else if ([wordType isEqual: @"20"]) {
    [_markOutlet setTitle:@"Place Mark Over Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
} else {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    }
    _markOutlet.titleLabel.textAlignment= NSTextAlignmentCenter;
    audioUrl = [wordArray lastObject][@"audioURL"];
    
    
    }


- (void) parseJSONWithURL:(NSURL *) jsonURL
{
    jsonDict = [[NSDictionary alloc] init];
    wordArray = [[NSMutableArray alloc] init];
        // Set the queue to the background queue.
        // Runs on a background thread to keep the UI Responsive.
  //  dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        // Run request on background queue (thread).
   // dispatch_async(queue, ^{
        NSError *error = nil;
        
            // Request the data and store in a string.
        NSString *json = [NSString stringWithContentsOfURL:jsonURL encoding:NSASCIIStringEncoding error:&error];
        NSLog(@"A json: %@", json); //TEST CODE
        
        if (error == nil){
                // Convert the String into an NSData object.
            NSData *jsonData = [json dataUsingEncoding:NSASCIIStringEncoding];
            
                // Fills the dictionary and Array.
                // Parse that data object using NSJSONSerialization without options.
            jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            wordArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            if ([wordArray isKindOfClass:[NSNull class]])
            {    NSLog(@"check internet");                // Parsing success.
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"This app requires internet connection.  Please check your connection and try again later." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                
                [alertView show];            }
            
            if (error == nil)
            {
                    // Go back to the main thread and update the table with the json data.
                    // Keeps the user interface responsive.
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    
                        //MOVE ARRAY FILL TO HERE
                //    [jsonTable reloadData];
                    
                });
                word = [wordArray lastObject] [@"word"];
                NSString *sylibifiedWord= [Sylibifier sylibify:word];
                NSLog(@"sylibifiedWord  %@", sylibifiedWord);
               // _wordLabel.text = word;
                _wordLabel.text =  sylibifiedWord;
                wordGroup=[wordArray lastObject][@"word_group"];
                NSLog(@"wordGroup: %@", wordGroup);
                modifiedWord = [word mutableCopy];
                NSLog(@"wordVC Array %@", wordArray);
                title =  [NSString stringWithFormat:@"Word type %@ ", wordType];
                self.navigationItem.title = title;
                if ([[wordArray lastObject] [@"audioURL"] hasPrefix:@"http"]) {
                    _speakerOutlet.hidden = NO;
                   
             
                    
                    
                    
                }

            }
            
                // Parsing failed, display error as alert.
            else
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Uh Oh, Parsing Failed." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                
                [alertView show];
            }
        }
        
            // Request Failed, display error as alert.
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Request Error! Check that you are connected to wifi or 3G/4G with internet access." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            
            [alertView show];
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)wordConstantYesButton:(UIButton *)sender{
    if (firstquestion==TRUE) {

    if ([wordGroup characterAtIndex:0] == 'C')
    {
        [self incorrectAlert];
          }
    else if ([wordGroup characterAtIndex:0] == 'D')
    {
       [self incorrectAlert];
    }
    else
    {
        [_stressLabel setTextColor:[UIColor blackColor]];
        
        _stressLabel.text=@"Is the stess on the second to the last syllable?";
        _stressLabel.hidden = NO;
        _stressYesOutlet.hidden = NO;
        _stressNoOutlet.hidden = NO;
        _wordConstantNoOutlet.hidden = YES;
       _wordConstantYesOutlet.enabled=NO;
        _wordConstantYesOutlet.alpha = 1.0;
        _arrow1Image.hidden=NO;
        firstquestion = FALSE;
        
    }
}
}

- (IBAction)constantNoButton:(UIButton *)sender {
    if (firstquestion==TRUE) {
        if ([wordGroup characterAtIndex:0] == 'C')
        {
            _stressLabel.hidden = NO;
            _stressYesOutlet.hidden = NO;
            _stressNoOutlet.hidden = NO;
            _wordConstantYesOutlet.hidden= YES;
            firstquestion = FALSE;
            _wordConstantNoOutlet.alpha = 1.0;
        }
        else if ([wordGroup characterAtIndex:0] == 'D')
        {
            
            _stressLabel.hidden = NO;
            _stressYesOutlet.hidden = NO;
            _stressNoOutlet.hidden = NO;
            _wordConstantYesOutlet.hidden= YES;
            _wordConstantNoOutlet.alpha = 1.0;
            firstquestion = FALSE;
            
        }
        else
        {
            [self incorrectAlert];
        }
        
    }
}
   



- (IBAction)stressYesButton:(UIButton *)sender {
    if (secondquestion == TRUE) {
        if ([wordGroup characterAtIndex:0] == 'A')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _stressYesOutlet.alpha=1.0;
            _arrow2mage.hidden = NO;
            secondquestion = FALSE;
            
            
        }
        else if ([wordGroup characterAtIndex:0] == 'C')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _stressYesOutlet.alpha=1.0;
            _arrow2mage.hidden=NO;
            secondquestion = FALSE;
        }
        else
            [self incorrectAlert];
    }

    }
 - (IBAction)stressNoButton:(UIButton *)sender {
     if (secondquestion == TRUE) {
         if ([wordGroup characterAtIndex:0] == 'B')
         {
             _noMarkOutlet.hidden = NO;
             _markOutlet.hidden = NO;
             _accentMarkOutlet.hidden = NO;
             _stressYesOutlet.hidden = YES;
             _stressNoOutlet.hidden = YES;
             secondquestion = FALSE;
             _arrow2mage.hidden=NO;
         }
         else if ([wordGroup characterAtIndex:0] == 'D')
         {
             _noMarkOutlet.hidden = NO;
             _markOutlet.hidden = NO;
             _accentMarkOutlet.hidden = NO;
             _stressYesOutlet.hidden = YES;
             _stressNoOutlet.hidden = YES;
             secondquestion = FALSE;
             _arrow2mage.hidden=NO;
         }
         else
             [self incorrectAlert];

     }
     
}

- (IBAction)noMarkButton:(UIButton *)sender {
    if ([wordGroup characterAtIndex:0] == 'A')
    {
        _noMarkOutlet.alpha = 1;
        _markOutlet.hidden = YES;
    
[self correctAlert];
    } else if ([wordGroup characterAtIndex:0] == 'C'){
        _noMarkOutlet.alpha = 1;
        _markOutlet.hidden = YES;
        [self correctAlert];
    }
    else
        [self incorrectAlert];
}

- (IBAction)markButton:(UIButton *)sender {
    if (([wordGroup characterAtIndex:0] == 'B') || ([wordGroup characterAtIndex:0] == 'D')) {
        _markOutlet.alpha = 1;
        _noMarkOutlet.hidden = YES;
        [self correctAlert];
    }
 //  else if ([wordSet characterAtIndex:0] == 'C')
   //     [self correctAlert];
    else
        [self incorrectAlert];
}
- (void)incorrectAlert {
    alertView *alert;
    
    
        ////// Alert
    alert = [[alertView alloc] initWithTitle:word
                                     message:@"Incorrect Please try again!"
                                    delegate:self
                           cancelButtonTitle:nil
                           otherButtonTitles:@"Try Again", nil];
    alert.style = alertStyleAlert;
    [alert setImage:@"alert.png"];
      [alert show];    
    
    
}
- (void)correctAlert {
    alertView *alert;
    alert = [[alertView alloc] initWithTitle:word
                                     message:@"Congratulations, you marked the word correct!           "
                                    delegate:self
                           cancelButtonTitle:nil
                           otherButtonTitles:[NSString stringWithFormat:@"Mark More words in Group %@", wordType],@"Word Groups",@"Enter Any Word",nil];
    alert.style = alertStyleCorrect;
    [alert setImage:@"accept.png"];
     title=@"correct";
    
      [alert show];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"Buttonnnn pushed: %@, index %i", alertView.title, buttonIndex);
    if ([title characterAtIndex:0] == 'c'){
        NSLog(@"works");
        {
            if(buttonIndex == 0)
            {
            
                [self viewDidLoad];
                WordViewController *wordViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wordViewController"];
                wordViewController->wordType = wordType;
                [self.navigationController pushViewController:wordViewController animated:YES];
                
                
            }
            if (buttonIndex== 1) {
                //load view with word groups
               LearnToMarkWordsViewController *learnToMarkWords = [self.storyboard instantiateViewControllerWithIdentifier:@"learnToMarkWords"];
                [self.navigationController pushViewController:learnToMarkWords animated:YES];
            }
            if (buttonIndex ==2) {
                //load enter word view
               EnterWordViewController *enterWord = [self.storyboard instantiateViewControllerWithIdentifier:@"enterWord"];                [self.navigationController pushViewController:enterWord animated:YES];
            }
        }
    }
}
    
- (IBAction)speakerButton:(UIButton *)sender {
    
    url = [NSURL URLWithString:audioUrl];
    urlrequest = [NSURLRequest requestWithURL:url];
    [Webview loadRequest:urlrequest];
    Webview.hidden = YES;
}
@end