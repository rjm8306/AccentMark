//
//  Word.m
//  AccentMark
//
//  Created by Robert Millar on 6/29/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "Word.h"

@implementation Word
- (void)viewDidLoad
{
    NSLog(@"wordType: %@" ,wordType);
   
    jsonDict = [[NSDictionary alloc] init];
    wordArray = [[NSMutableArray alloc] init];
        // NSString *apiKey= 0694ca6ec483864e11d4e8867d0ca4db;
    urlString= [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=%@ ", wordType];
        //urlString = 5;
    url = [NSURL URLWithString:urlString];
 
    NSLog(@"id: %@", url ); //TEST CODE
    [self parseJSONWithURL:url];
    
}
- (void) parseJSONWithURL:(NSURL *) jsonURL
{
        // Set the queue to the background queue.
        // Runs on a background thread to keep the UI Responsive.
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        // Run request on background queue (thread).
    dispatch_async(queue, ^{
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
            
                // Parsing success.
            if (error == nil)
            {
                    // Go back to the main thread and update the table with the json data.
                    // Keeps the user interface responsive.
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    
                        //MOVE ARRAY FILL TO HERE
                        //  [jsonTable reloadData];
                        //NSLog(@"A Affiliates Array: %@", affiliatesArray); //TEST CODE
                    
                    _wordLabel.text  = wordArray.lastObject [@"word"];
                    wordSet=wordArray.lastObject[@"word_group"];
                    NSLog(@"wordSet: %@", wordSet);
                    return wordSet;
                });
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
    });
}@end
