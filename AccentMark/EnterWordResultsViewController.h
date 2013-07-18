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
   @public NSString *word;
    NSString *urlString;
    NSURL *url;
    NSArray *wordArray;
    NSDictionary *jsonDict;
    NSString *selectedWord;
    
    NSString *selectedType;
    int selectedcat;
    
    
    
}
@end
