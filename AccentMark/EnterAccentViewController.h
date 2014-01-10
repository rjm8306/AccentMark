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
    
    
    NSString *wordGroup;//A,B,C,D
    NSString *cat;//1-23
    //NSString *urlString;
    NSString *sylibifiedWord;//return from sylibifier method
    NSMutableString *word;//word from database  NEVER TO BE CHANGED
    NSString *modifiedWord;
    NSString *title;//USED TO DISPLAY TITLE
    NSString *audioUrl;//url of audio file if it exists
    NSMutableAttributedString *lastDigit;//used to underline last char
    //NSMutableAttributedString *modifiedWord;
   // @public __strong NSString *cat;
    int i;//iterator for 4 loop
    int l;//iterator for 4 loop
    //NSRange range;
    //NSData *request;
    BOOL firstquestion;
    BOOL secondquestion;
    IBOutlet UIWebView *Webview;
    NSString *wordCat;
    int wordLength;
    int cata;
    int lastChar;
    int spaceOne;
    int spaceTwo;
    int count;
    int accentMarkLocation;
    int currentValue;
    //NSMutableAttributedString *attributedString;
    //NSString *string;
    NSArray *wordList;
    NSMutableArray *charList;
     NSString *temp;
   // NSString temp;
    int wordMark;// Show what array index has the accent mark  so I can underline it.
    NSMutableString *sylibifiedWord1;//mutable copy of sylibifiedWord
}

- (IBAction)helpButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *helpButton;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UILabel *subViewWordLabel;
- (IBAction)subViewSliderAction:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *subViewLabel;
@property (weak, nonatomic) IBOutlet UISlider *subViewSlider;


@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *wordEndOutlet;
- (IBAction)subViewButton:(UIButton *)sender;

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
@property (strong, nonatomic) NSString *cat;
@property int cata;

- (IBAction)speakerButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *accentMarkOutlet;
@property (weak, nonatomic) IBOutlet UIButton *markOutlet;
@property (weak, nonatomic) IBOutlet UIButton *noMarkOutlet;
- (IBAction)noMarkButton:(UIButton *)sender;
- (IBAction)markButton:(UIButton *)sender;
//@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1Image;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2mage;

@property (weak, nonatomic) UIActionSheet *actionSheet;
@end

