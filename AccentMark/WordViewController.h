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
    NSURL *url;
    NSArray *wordArray;
    NSDictionary *jsonDict;
    NSString *wordSet;
    NSString *wordCatagory;
  @public  NSString *wordType;
    NSString *urlString;
    
    
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



@property (weak, nonatomic) IBOutlet UILabel *accentMarkOutlet;
@property (weak, nonatomic) IBOutlet UIButton *markOutlet;
@property (weak, nonatomic) IBOutlet UIButton *noMarkOutlet;
- (IBAction)noMarkButton:(UIButton *)sender;
- (IBAction)markButton:(UIButton *)sender;

@property (weak, nonatomic) UIActionSheet *actionSheet;
@end
