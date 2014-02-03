//
//  SpecialHiatusEnterAccentMarkViewController.h
//  AccentMark
//
//  Created by Robert Millar on 1/31/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialHiatusEnterAccentMarkViewController : UIViewController
{
@public  NSArray *wordArray;
    NSDictionary *jsonDict;
    
    
    NSString *wordGroup;//A,B,C,D
    //02/03  NSString *cat;//1-23
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
    int k;
    int j;
        //NSMutableAttributedString *attributedString;
        //NSString *string;
    NSArray *wordList;
    NSMutableArray *charList;
    NSString *temp;
    NSMutableString *temp1;
    int wordMark;// Show what array index has the accent mark  so I can underline it.
    NSMutableString *sylibifiedWord1;//mutable copy of sylibifiedWord
                                     //variables for slider view
    NSString *charString; //for slider
    int endOfTheStressedSylable;
    int beginingOfTheStressedSylable;
    int tempFlag;
    int temp1Flag;
    float fontSize;
    NSMutableString *sliderWord;
    NSMutableString *sliderWordWithAccentMark;
    NSMutableArray *sliderArraywithoutAccentMark;
    NSMutableArray *sliderArrayWithAccentMark;
    int accentFound;
    float sliderMinValue;
    float sliderMaxValue;
    NSMutableAttributedString *attributedStringWithAccentMark;
}

@property(weak, nonatomic) NSString *cat;
@property int cata;


@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIButton *helpButton;
- (IBAction)helpButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *speakerOutlet;
- (IBAction)speakerButton:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property (weak, nonatomic) IBOutlet UIImageView *arrow3;

@property (weak, nonatomic) IBOutlet UILabel *wordEndingOutlet;
@property (weak, nonatomic) IBOutlet UIButton *wordConstantYesOutlet;
- (IBAction)wordConstantYesButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *wordConstantNoOutlet;
- (IBAction)wordConstantNoButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *stressLabel;
@property (weak, nonatomic) IBOutlet UIButton *stressYesOutlet;
- (IBAction)stressYesButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *stressNoOutlet;
- (IBAction)stressNoButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *hiatusLabel;
@property (weak, nonatomic) IBOutlet UIButton *hiatusYesOutlet;
- (IBAction)hiatusYesButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *hiatusNoOutlet;
- (IBAction)hiatusNoButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *accentMarkLabel;
@property (weak, nonatomic) IBOutlet UIButton *accentMarkYesOutlet;
- (IBAction)accentMarkYesButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *accentMarkNoOutlet;
- (IBAction)accentMarkNoButton:(UIButton *)sender;



@end

