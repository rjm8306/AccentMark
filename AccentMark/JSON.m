//
//  JSON.m
//  AccentMark
//
//  Created by Robert Millar on 7/5/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "JSON.h"

@implementation JSON
- (NSArray *) parseJSONWithURL:(NSURL *) jsonURL
{
    NSLog(@"in json method");
        // Set the queue to the background queue.
        // Runs on a background thread to keep the UI Responsive.
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        // Run request on background queue (thread).
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSLog(@"in json method2");
            // Request the data and store in a string.
        NSString *json = [NSString stringWithContentsOfURL:jsonURL encoding:NSASCIIStringEncoding error:&error];
        //NSLog(@"A json: %@", json); //TEST CODE
        NSLog(@"in json method3");
        if (error == nil){
                // Convert the String into an NSData object.
            NSLog(@"in json method4");
           jsonData = [json dataUsingEncoding:NSASCIIStringEncoding];
            NSLog(@"in json method5");
            jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            NSLog(@"%@", jsonArray);
                // Fills the dictionary and Array.
                // Parse that data object using NSJSONSerialization without options.
                           // Parsing success.
            if (error == nil)
            {
                    // Go back to the main thread and update the table with the json data.
                    // Keeps the user interface responsive.
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    NSLog(@"jason data %@", jsonData);
                        //MOVE ARRAY FILL TO HERE
                        //  [jsonTable reloadData];
                        //NSLog(@"A Affiliates Array: %@", affiliatesArray); //TEST CODE
                    
                        // [WordViewController.word:(NSArray *)wordArray];
                    
                    
                    //commented out to clear red marks
                    
//                    wordSet=wordArray[i][@"word_group"];
//                    NSLog(@"wordSet: %@", wordSet);
//                    word = wordArray[i] [@"word"];
//                    
//                    lastDigit = [word substringFromIndex: [word length] - 1];
//                    NSInteger _stringLength=[lastDigit length];
                        //  range = 1;
//                    NSRange range =NSMakeRange(0, 1);
//                    UIColor *_red=[UIColor redColor];
//                    UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:30.0f];
                        // [lastDigit addAttribute:NSFontAttributeName value:font range:range];
                        // [lastDigit addAttribute:NSForegroundColorAttributeName value:_red range:NSMakeRange(0, 1)];
                        // [lastDigit addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(0, 1)];
                    
                    
//                   
//                        // NSRange range ={0,1};
//                    
//                        // range.location = [modifiedWord length]-1;
//                        //range.length = 1;
//                    [modifiedWord deleteCharactersInRange:NSMakeRange([modifiedWord length]-1, 1)];
//                    NSLog(@"%@",modifiedWord);
//                    NSLog(@"%@%@", modifiedWord, lastDigit);
                        //[lastDigit addAttribute:NSUnderlineStyleAttributeName value:NSUnderlineStyleAttributeName range:NSMakeRange(1, 1)];
                        //NSMutableAttributedString *lastDigit2 = [lastDigit mutableCopy];
                        //  [lastDigit addAttribute:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)} range: range];
                        //   value:NSUnderlineStyleSingle range:NSMakeRange(0,1)];
                        // [modifiedWord addAttribute:NSUnderlineStyleAttributeName value:NSUnderlineStyleSingle range:[[modifiedWord length]-1]];
                        // lastDigit.
                        //  modifiedWord =
                                       
                        // _wordLabel.text  = wordArray[i] [@"word"];
                        // _wordLabel.text  = @"%@%@",modifiedWord, lastDigit;
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
    
    return jsonArray;
}
@end
