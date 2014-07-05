//
//  EnterWordViewController.h
//  AccentMark
//
//  Created by Robert Millar on 6/21/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterWordViewController : UIViewController
{
    NSMutableString *input;
    NSMutableString *answer;
    int catagory;
    
}
@property int catagory;
@property (weak, nonatomic) IBOutlet UITextField *userInput;
- (IBAction)submitButton:(UIButton *)sender;
- (IBAction)backButtonAction:(UIBarButtonItem *)sender;

@end
