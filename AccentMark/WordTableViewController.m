//
//  WordTableViewController.m
//  AccentMark
//
//  Created by Robert Millar on 7/5/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "WordTableViewController.h"

@interface WordTableViewController ()

@end

@implementation WordTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"wordType: %@" ,wordType);
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
    jsonDict = [[NSDictionary alloc] init];
    wordArray = [[NSMutableArray alloc] init];
        // NSString *apiKey= 0694ca6ec483864e11d4e8867d0ca4db;
    urlString= [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=%@ ", wordType];
        //urlString = 5;
    url = [NSURL URLWithString:urlString];
    
    
        // Setup the URL with the JSON URL.
    
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
             //    wordArray = [[NSMutableArray alloc] initWithArray:wordArray];
            NSLog(@"%@", wordArray);
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
                    
                        // [WordViewController.word:(NSArray *)wordArray];
                    wordSet=wordArray[i][@"word_group"];
                    NSLog(@"wordSet: %@", wordSet);
                    word = wordArray[i] [@"word"];
                    
                    lastDigit = [word substringFromIndex: [word length] - 1];
                    NSInteger _stringLength=[lastDigit length];
                        //  range = 1;
                    NSRange range =NSMakeRange(0, 1);
                    UIColor *_red=[UIColor redColor];
                    UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:30.0f];
                        // [lastDigit addAttribute:NSFontAttributeName value:font range:range];
                        // [lastDigit addAttribute:NSForegroundColorAttributeName value:_red range:NSMakeRange(0, 1)];
                        // [lastDigit addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(0, 1)];
                    
                    
                    modifiedWord = [word mutableCopy];
                        // NSRange range ={0,1};
                    
                        // range.location = [modifiedWord length]-1;
                        //range.length = 1;
                    [modifiedWord deleteCharactersInRange:NSMakeRange([modifiedWord length]-1, 1)];
                    NSLog(@"%@",modifiedWord);
                    NSLog(@"%@%@", modifiedWord, lastDigit);
                        //[lastDigit addAttribute:NSUnderlineStyleAttributeName value:NSUnderlineStyleAttributeName range:NSMakeRange(1, 1)];
                        //NSMutableAttributedString *lastDigit2 = [lastDigit mutableCopy];
                        //  [lastDigit addAttribute:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)} range: range];
                        //   value:NSUnderlineStyleSingle range:NSMakeRange(0,1)];
                        // [modifiedWord addAttribute:NSUnderlineStyleAttributeName value:NSUnderlineStyleSingle range:[[modifiedWord length]-1]];
                        // lastDigit.
                        //  modifiedWord =
                    NSLog(@"%@", lastDigit);
                    
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
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [wordArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
cell.textLabel.text = wordArray[indexPath.row][@"word"];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
