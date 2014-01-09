//
//  WordTableViewController.h
//  AccentMark
//
//  Created by Robert Millar on 7/5/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordTableViewController : UITableViewController
{
    NSURL *url;
    NSMutableArray *wordArray;
    NSMutableArray *wordArray2;
    NSDictionary *jsonDict;
    NSString *wordSet;
    NSString *wordCatagory;
@public  NSString *wordType;
    NSString *urlString;
    int i;
    NSMutableAttributedString *modifiedWord;
    NSString *word;
    NSMutableAttributedString *lastDigit;
    NSRange range;
   
    
    
}
@end
