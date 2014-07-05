//
//  EnterWordResultsViewController.h
//  AccentMark
//
//  Created by Robert Millar on 7/6/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterWordResultsViewController : UITableViewController
{
    
    NSURL *url;
    NSMutableArray *wordArray;
    NSMutableArray *removedAccentMarkArray;
    
    NSArray *wArray;
    NSDictionary *jsonDict;
    //NSString *selectedWord;
    //NSString *aUrl;
    NSMutableString *urlString;
    //NSString *selectedType;
@public NSMutableString *word;
    //int selectedcat;
  //  int catagory;
    int i;  
}
- (IBAction)BackButtonAction:(UIBarButtonItem *)sender;
@property (strong, atomic) NSString *back;
@end
