//
//  EnterWordResultsViewController.m
//  AccentMark
//
//  Created by Robert Millar on 7/6/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "EnterWordResultsViewController.h"
#import "EnterAccentViewController.h"
#import "SpecialHiatusEnterAccentMarkViewController.h"
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


- (void)viewDidLoad {
    if (word != nil) {
        urlString = [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=searchWord&word=%@", word];
    }
    [super viewDidLoad];
    
    
    url = [NSURL URLWithString:urlString];
        // Setup the URL with the JSON URL.
        //NSLog(@"urlString = %@", urlString);
    //NSLog(@"url = %@", url);
    [self parseJSONWithURL:url];
    while (wordArray == nil) {
            //waiting for array to load
    }

   
    
}



- (void) parseJSONWithURL:(NSURL *) jsonURL
{
    jsonDict = [[NSDictionary alloc] init];
    wordArray = [[NSMutableArray alloc] init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSError *error = nil;
    
        // Request the data and store in a string.
    NSString *json = [NSString stringWithContentsOfURL:jsonURL encoding:NSASCIIStringEncoding error:&error];
    while (json ==nil) {
            //  NSLog(@"json = nil");
    }
        // NSLog(@"json =%@", json);
        // NSLog(@"error = %@", error);
    if (error == nil || error != nil){
            // Convert the String into an NSData object.
        NSData *jsonData = [json dataUsingEncoding:NSASCIIStringEncoding];
            // NSLog(@"data = %@", jsonData);
        jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        wordArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        while (wordArray == NULL) {
            
        }
        if ([wordArray isKindOfClass:[NSNull class]])
        {  //  NSLog(@"check internet");                // Parsing success.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"This app requires internet connection.  Please check your connection and try again later." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            
            [alertView show];
        }
        
        if (error == nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            });
            
        }
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
    
    NSUInteger position;
    NSMutableString *wordWithoutAccentMark;
    
    removedAccentMarkArray = [[NSMutableArray alloc] init];
    for (i=0; i<[wordArray count]; i++) {
        
        NSMutableString *temp = wordArray[i][@"word"];
        wordWithoutAccentMark= [temp mutableCopy];
        if((position = NSNotFound)) {
            position = [wordWithoutAccentMark rangeOfString:@"á"].location;
            if(position !=NSNotFound){
                NSRange range1;
                range1.location= position;
                range1.length = 1;
                [wordWithoutAccentMark replaceCharactersInRange:range1 withString:@"a"];
            }
        }//end  if((position = NSNotFound)) for a
        
        if((position = NSNotFound)) {
            position = [wordWithoutAccentMark rangeOfString:@"é"].location;
            if(position !=NSNotFound){
                NSRange range1;
                range1.location= position;
                range1.length = 1;
                [wordWithoutAccentMark replaceCharactersInRange:range1 withString:@"e"];
            }
        }//end  if((position = NSNotFound)) for e
        if((position = NSNotFound)) {
            position = [wordWithoutAccentMark rangeOfString:@"í"].location;
            if(position !=NSNotFound){
                NSRange range;
                range.location= position;
                range.length = 1;
                [wordWithoutAccentMark replaceCharactersInRange:range withString:@"i"];
            }
        }//end  if((position = NSNotFound)) for i
        if((position = NSNotFound)) {
            position = [wordWithoutAccentMark rangeOfString:@"ó"].location;
            if(position !=NSNotFound){
                NSRange range1;
                range1.location= position;
                range1.length = 1;
                [wordWithoutAccentMark replaceCharactersInRange:range1 withString:@"o"];
            }
        }//end  if((position = NSNotFound)) for o
        if((position = NSNotFound)) {
            position = [wordWithoutAccentMark rangeOfString:@"ú"].location;
            if(position !=NSNotFound){
                NSRange range1;
                range1.location= position;
                range1.length = 1;
                [wordWithoutAccentMark replaceCharactersInRange:range1 withString:@"u"];
            }
        }//end  if((position = NSNotFound)) for u
        
        [removedAccentMarkArray addObject: wordWithoutAccentMark];
    }//end for loop
    //NSLog(@"removedAccentMarkArray = %@", removedAccentMarkArray);
    //NSLog(@"Test");
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [removedAccentMarkArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MainCell"];
    }
    cell.textLabel.text = removedAccentMarkArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( ([wordArray[indexPath.row][@"category"] isEqualToString: @"13"]) || ([wordArray[indexPath.row][@"category"] isEqualToString: @"19"]) || ([wordArray[indexPath.row][@"category"] isEqualToString: @"20"]) ) {
        SpecialHiatusEnterAccentMarkViewController  *wordResults = [self.storyboard instantiateViewControllerWithIdentifier:@"wordResults"];
        wordResults->audioUrl = wordArray[indexPath.row][@"audioURL"];
        wordResults.cat = wordArray[indexPath.row][@"category"];
        wordResults->word = wordArray[indexPath.row][@"word"];
        wordResults->wordGroup = wordArray[indexPath.row][@"word_group"];
                                                                        
        [self.navigationController pushViewController:wordResults animated:NO];
    } else {
        EnterAccentViewController *wordResults = [self.storyboard instantiateViewControllerWithIdentifier:@"wordResults"];
        wordResults->audioUrl = wordArray[indexPath.row][@"audioURL"];
        wordResults.cat = wordArray[indexPath.row][@"category"];
        wordResults->word = wordArray[indexPath.row][@"word"];
        wordResults->wordGroup = wordArray[indexPath.row][@"word_group"];
        [self.navigationController pushViewController:wordResults animated:NO];
    }
}
 
    
    
    @end
