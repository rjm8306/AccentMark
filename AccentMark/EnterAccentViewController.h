//
//  EnterAccentViewController.h
//  AccentMark
//
//  Created by Robert Millar on 7/6/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterAccentViewController : UIViewController
{
  @public  NSArray *wordArray;
    NSDictionary *jsonDict;
    
    
    NSString *wordSet;
    NSString *wordCatagory;
    NSString *urlString;
    NSString *sylibifiedWord;
    NSString *word;
    NSString *title;
    NSString *audioUrl;
    NSMutableAttributedString *lastDigit;
    NSMutableAttributedString *modifiedWord;
    @public __strong NSString *wordType;
    int i;
    NSRange range;
    NSData *request;
    BOOL firstquestion;
    BOOL secondquestion;
    IBOutlet UIWebView *Webview;
}

@property (weak, nonatomic) id cat;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
- (IBAction)wordConstantYesButton:(UIButton *)sender;
- (IBAction)constantNoButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *wordConstantYesOutlet;
@property (weak, nonatomic) IBOutlet UIButton *wordConstantNoOutlet;
@property (weak, nonatomic) IBOutlet UIButton *speakerOutlet;

@property (weak, nonatomic) IBOutlet UILabel *stressLabel;
@property (weak, nonatomic) IBOutlet UIButton *stressYesOutlet;
@property (weak, nonatomic) IBOutlet UIButton *stressNoOutlet;
- (IBAction)stressYesButton:(UIButton *)sender;
- (IBAction)stressNoButton:(UIButton *)sender;
@property (strong, nonatomic) NSString *wordType;


- (IBAction)speakerButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *accentMarkOutlet;
@property (weak, nonatomic) IBOutlet UIButton *markOutlet;
@property (weak, nonatomic) IBOutlet UIButton *noMarkOutlet;
- (IBAction)noMarkButton:(UIButton *)sender;
- (IBAction)markButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1Image;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2mage;

@property (weak, nonatomic) UIActionSheet *actionSheet;
@end

