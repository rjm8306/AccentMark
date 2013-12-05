//
//  ChooseWordViewController.h
//  AccentMark
//
//  Created by Robert Millar on 7/21/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseWordViewController : UITableViewController
{
    
    NSURL *url;
    NSArray *wordArray;
    NSMutableArray *removedAccentMarkArray;
    NSDictionary *jsonDict;
    //NSString *selectedWord;
    //NSString *aUrl;
    NSString *urlString;
    //NSString *selectedType;
    @public NSString *word;
    int cat;
    NSString *title;
    int i;
    
}
@end
