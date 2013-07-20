//
//  WordViewController.h
//  AccentMark
//
//  Created by Robert Millar on 6/24/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordViewController : UIViewController <UIActionSheetDelegate>
{
    NSMutableArray *wordArray;
    NSDictionary *jsonDict;
    NSString *wordGroup;
    NSString *wordCatagory;
    NSString *title;
    NSString *urlString;
    NSString *audioUrl;
    NSMutableAttributedString *modifiedWord;
    NSMutableAttributedString *lastDigit;
    @public __strong NSString *wordType;
    int i;
    NSRange range;
    NSData *request;
    BOOL firstquestion;
    BOOL secondquestion;
    IBOutlet UIWebView *Webview;
    NSURLRequest *urlrequest;
    __strong NSURL *url;
}
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
- (IBAction)wordConstantYesButton:(UIButton *)sender;
- (IBAction)constantNoButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *wordConstantYesOutlet;
@property (weak, nonatomic) IBOutlet UIButton *wordConstantNoOutlet;

@property (weak, nonatomic) IBOutlet UILabel *stressLabel;
@property (weak, nonatomic) IBOutlet UIButton *stressYesOutlet;
@property (weak, nonatomic) IBOutlet UIButton *stressNoOutlet;
- (IBAction)stressYesButton:(UIButton *)sender;
- (IBAction)stressNoButton:(UIButton *)sender;
@property (strong, nonatomic) NSString *wordType;

@property (weak, nonatomic) IBOutlet UIButton *speakerOutlet;
- (IBAction)speakerButton:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UILabel *accentMarkOutlet;
@property (strong, nonatomic) IBOutlet UIButton *markOutlet;
@property (weak, nonatomic) IBOutlet UIButton *noMarkOutlet;
- (IBAction)noMarkButton:(UIButton *)sender;
- (IBAction)markButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1Image;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2mage;
@property (weak, nonatomic) NSString *word;

@property (weak, nonatomic) UIActionSheet *actionSheet;
@end
