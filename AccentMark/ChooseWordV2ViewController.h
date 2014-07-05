//
//  ChooseWordV2ViewController.h
//  AccentMark
//
//  Created by Robert Millar on 6/24/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseWordV2ViewController : UIViewController
{
@public NSURL *url;
    NSArray *wordArray;
    NSMutableArray *removedAccentMarkArray;
    NSDictionary *jsonDict;
        //NSString *selectedWord;
        //NSString *aUrl;
@public NSString *urlString;
        //NSString *selectedType;
@public NSString *word;
    int cat;
    NSString *title;
    int i;
    
}
- (IBAction)backButtonAction:(UIBarButtonItem *)sender;

@property (strong, nonatomic) NSString *urlString;
@end
