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
    NSArray *wordArray;
    NSArray *wArray;
    NSDictionary *jsonDict;
    NSString *selectedWord;
    NSString *aUrl;
    NSString *urlString;
    NSString *selectedType;
@public NSString *word;
    int selectedcat;
  
}
@end
