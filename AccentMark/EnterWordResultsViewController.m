//
//  EnterWordResultsViewController.m
//  AccentMark
//
//  Created by Robert Millar on 7/6/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "EnterWordResultsViewController.h"
#import "WordViewController.h"

@interface EnterWordResultsViewController ()

@end

@implementation EnterWordResultsViewController 

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
    NSLog(@"in new View");
    NSLog(@"%@",word);
// NSString *apiKey= 0694ca6ec483864e11d4e8867d0ca4db;
    urlString= [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=searchWord&word=%@", word];
        //urlString = 5;
    url = [NSURL URLWithString:urlString];
    
    
        // Setup the URL with the JSON URL.
    
    NSLog(@"id: %@", url );
        //TEST CODE
        // if ([wordArray isEqual:nil])
        // {
    [self parseJSONWithURL:url];
    
    NSLog(@"%@", wordArray);
    
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
                
                NSLog(@"reload");
                    //   [self.tableView reloadData];
            });
            
            
            NSLog(@"wordVC Array %@", wordArray);
            
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [wordArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MainCell"];
    }
    cell.textLabel.text = wordArray[indexPath.row][@"word"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    selectedWord=wordArray[indexPath.row][@"word"];
    selectedType=wordArray[indexPath.row][@"word_group"];
    selectedcat = wordArray[indexPath.row][@"category"];
    return cell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WordViewController *wordResults = [self.storyboard instantiateViewControllerWithIdentifier:@"wordResults"];
    wordResults->word = selectedWord;
        //diyDetail->title = wordArray[indexPath.row][@"title"];
        [self.navigationController pushViewController:wordResults animated:YES];

}

@end
