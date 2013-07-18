//
//  EnterAccentViewController.m
//  AccentMark
//
//  Created by Robert Millar on 7/6/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "EnterAccentViewController.h"
#import "alertView.h"
#import "WordViewController.h"
#import <CoreText/CoreText.h>
#import "JSON.h"
#import "EnterWordViewController.h"
#import "LearnToMarkWordsViewController.h"

@interface EnterAccentViewController ()

@end

@implementation EnterAccentViewController

@synthesize wordType;

#define int i = 0
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{    [super viewDidLoad];
    NSLog(@"word: %@" ,word);
    _wordLabel.text = word;
}
    - (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}


- (IBAction)wordConstantYesButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'C')
    {
        [self incorrectAlert];
    }
    else if ([wordSet characterAtIndex:0] == 'D')
    {
        [self incorrectAlert];
    }
    else
    {
        [_stressLabel setTextColor:[UIColor blackColor]];
        
        _stressLabel.text=@"Is the stess on the second to the last syllable?";
        _stressLabel.hidden = NO;
        _stressYesOutlet.hidden = NO;
        _stressNoOutlet.hidden = NO;
        _wordConstantNoOutlet.hidden = YES;
        _wordConstantYesOutlet.enabled=NO;
        _arrow1Image.hidden=NO;
    }
}

- (IBAction)stressYesButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'A')
    {
        _noMarkOutlet.hidden = NO;
        _markOutlet.hidden = NO;
        _accentMarkOutlet.hidden = NO;
        _stressNoOutlet.hidden = YES;
        _arrow2mage.hidden = NO;
        
        
    }
    else if ([wordSet characterAtIndex:0] == 'C')
    {
        _noMarkOutlet.hidden = NO;
        _markOutlet.hidden = NO;
        _accentMarkOutlet.hidden = NO;
        _stressNoOutlet.hidden = YES;
        _stressNoOutlet.hidden = YES;
        _arrow2mage.hidden=NO;
    }
    else
        [self incorrectAlert];
}
- (IBAction)stressNoButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'B')
    {
        _noMarkOutlet.hidden = NO;
        _markOutlet.hidden = NO;
        _accentMarkOutlet.hidden = NO;
        _stressYesOutlet.hidden = YES;
        _stressNoOutlet.hidden = YES;
            //   _arrow2Image.hidden=NO;
    }
    else
        [self incorrectAlert];
    
}

- (IBAction)constantNoButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'C')
    {
        _stressLabel.hidden = NO;
        _stressYesOutlet.hidden = NO;
        _stressNoOutlet.hidden = NO;
        _wordConstantYesOutlet.hidden= YES;
    }
    else if ([wordSet characterAtIndex:0] == 'D')
    {
        
        _stressLabel.hidden = NO;
        _stressYesOutlet.hidden = NO;
        _stressNoOutlet.hidden = NO;
        _wordConstantYesOutlet.hidden= YES;
    }
    else
    {
        [self incorrectAlert];
    }
    
}
- (IBAction)noMarkButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'B')
        [self correctAlert];
    else if ([wordSet characterAtIndex:0] == 'D')
        [self correctAlert];
    else
        [self incorrectAlert];
}

- (IBAction)markButton:(UIButton *)sender {
    if (([wordSet characterAtIndex:0] == 'A') || ([wordSet characterAtIndex:0] == 'C'))
        [self correctAlert];
        //  else if ([wordSet characterAtIndex:0] == 'C')
        //     [self correctAlert];
    else
        [self incorrectAlert];
}
- (void)incorrectAlert {
    alertView *alert;
    
    
        ////// Alert
    alert = [[alertView alloc] initWithTitle:word
                                     message:@"Incorrect Please try again!"
                                    delegate:self
                           cancelButtonTitle:nil
                           otherButtonTitles:@"Try Again", nil];
    alert.style = alertStyleAlert;
    [alert setImage:@"alert.png"];
    [alert show];
    
    
}
- (void)correctAlert {
    alertView *alert;
    alert = [[alertView alloc] initWithTitle:@"Correct"
                                     message:@"Congradulations, you marked the word correct!           "
                                    delegate:self
                           cancelButtonTitle:nil
                           otherButtonTitles:@"Practice with a different word?",@"Word Groups",@"Enter Any Word",nil];
    alert.style = alertStyleCorrect;
    [alert setImage:@"accept.png"];
    title=@"correct";
    [alert show];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"Buttonnnn pushed: %@, index %i", alertView.title, buttonIndex);
    if ([title characterAtIndex:0] == 'c'){
        NSLog(@"works");
        {
            if(buttonIndex == 0)
            {
                    //  [wordArray removeLastObject];
                    // [self newWord];
                [self viewDidLoad];
                WordViewController *wordViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wordViewController"];
                wordViewController->wordType = wordType;
                [self.navigationController pushViewController:wordViewController animated:YES];
                
                
            }
            if (buttonIndex== 1) {
                    //load view with word groups
                LearnToMarkWordsViewController *learnToMarkWords = [self.storyboard instantiateViewControllerWithIdentifier:@"learnToMarkWords"];
                [self.navigationController pushViewController:learnToMarkWords animated:YES];
            }
            if (buttonIndex ==2) {
                    //load enter word view
                EnterWordViewController *enterWord = [self.storyboard instantiateViewControllerWithIdentifier:@"enterWord"];
                [self.navigationController pushViewController:enterWord animated:YES];
            }
        }
    }
}


@end





