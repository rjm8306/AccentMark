//
//  LearnToMarkWordsViewController.h
//  AccentMark
//
//  Created by Robert Millar on 6/21/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearnToMarkWordsViewController : UITableViewController
{
    NSURL *url;
    NSMutableArray *wordArray;
    NSMutableArray *wordArray2;
    NSDictionary *jsonDict;
    NSString *urlString;
    NSString *var;
    NSString *wordSet;
    NSString *wordCatagory;
    NSString *word;
    NSMutableAttributedString *modifiedWord;
    NSMutableAttributedString *lastDigit;
@public NSString *wordTypes;
@public NSString *wordType;
    int i;
    NSRange range;
    //NSInteger *cat;
    int cat;
}

- (IBAction)backButtonAction:(UIBarButtonItem *)sender;

@end
