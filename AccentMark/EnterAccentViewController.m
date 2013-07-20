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
#import "EnterWordViewController.h"
#import "LearnToMarkWordsViewController.h"
#import "Sylibifier.h"

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
   
    
    NSLog(@"audioUrl  %@", audioUrl);
    NSLog(@"cat  %@", _cat);
    NSLog(@"word  %@", word);
    NSLog(@"wordSet  %@", wordSet);
    
    
    
    
        //word = [wordArray lastObject] [@"word"];
    NSLog(@"1word: %@" ,word);
    
    //wordSet=[wordArray lastObject][@"word_group"];
    NSLog(@"wordSet: %@", wordSet);
     sylibifiedWord= [Sylibifier sylibify:word];
    
    
    _wordLabel.text = word;
    firstquestion=TRUE;
    secondquestion = TRUE;
    
        //set text for last button
    if ([wordType isEqual: @"1"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"3"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"4"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"7"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"9"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"10"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"13"]) {
        [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"14"]) {
        [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"17"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"19"]) {
        [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"23"]) {
        [_markOutlet setTitle:@"Place Mark Over 2nd UpperVowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"6"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"12"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([wordType isEqual: @"20"]) {
        [_markOutlet setTitle:@"Place Mark Over Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    }
    _markOutlet.titleLabel.textAlignment= NSTextAlignmentCenter;
    
    
    if ([audioUrl hasPrefix:@"http"]) {
        _speakerOutlet.hidden = NO;
    }
    
    
    
    
}
    - (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}


- (IBAction)wordConstantYesButton:(UIButton *)sender {
    if (firstquestion==TRUE) {
        
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
            _wordLabel.text =sylibifiedWord;
            _stressLabel.text=@"Is the stess on the second to the last syllable?";
            _stressLabel.hidden = NO;
            _stressYesOutlet.hidden = NO;
            _stressNoOutlet.hidden = NO;
            _wordConstantNoOutlet.hidden = YES;
            _wordConstantYesOutlet.enabled=NO;
            _wordConstantYesOutlet.alpha = 1.0;
            _arrow1Image.hidden=NO;
            firstquestion = FALSE;
            
        }
    }
}

- (IBAction)stressYesButton:(UIButton *)sender {
    if (secondquestion == TRUE) {
        if ([wordSet characterAtIndex:0] == 'A')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _stressYesOutlet.alpha=1.0;
            _arrow2mage.hidden = NO;
            secondquestion = FALSE;
            
            
        }
        else if ([wordSet characterAtIndex:0] == 'C')
        {
        
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _stressYesOutlet.alpha=1.0;
            _arrow2mage.hidden=NO;
            secondquestion = FALSE;
        }
        else
        {
            [self incorrectAlert];
        }
    }
}
- (IBAction)stressNoButton:(UIButton *)sender {
    if (secondquestion == TRUE) {
        if ([wordSet characterAtIndex:0] == 'B')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressYesOutlet.hidden = YES;
            _stressNoOutlet.hidden = YES;
            secondquestion = FALSE;
            _arrow2mage.hidden=NO;
        }
        else if ([wordSet characterAtIndex:0] == 'D')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressYesOutlet.hidden = YES;
            _stressNoOutlet.hidden = YES;
            secondquestion = FALSE;
            _arrow2mage.hidden=NO;
        }
        else{
            [self incorrectAlert];
        }
        
    }
    
}

- (IBAction)constantNoButton:(UIButton *)sender {
    if (firstquestion==TRUE) {
        if ([wordSet characterAtIndex:0] == 'C')
        {
            _wordLabel.text =sylibifiedWord;
            _stressLabel.hidden = NO;
            _stressYesOutlet.hidden = NO;
            _stressNoOutlet.hidden = NO;
            _wordConstantYesOutlet.hidden= YES;
            firstquestion = FALSE;
            _wordConstantNoOutlet.alpha = 1.0;
        }
        else if ([wordSet characterAtIndex:0] == 'D')
        {
            _wordLabel.text =sylibifiedWord;
            _stressLabel.hidden = NO;
            _stressYesOutlet.hidden = NO;
            _stressNoOutlet.hidden = NO;
            _wordConstantYesOutlet.hidden= YES;
            _wordConstantNoOutlet.alpha = 1.0;
            firstquestion = FALSE;
            
        }
        else
        {
            [self incorrectAlert];
        }
        
    }
    
}
- (IBAction)noMarkButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'A')
    {
        _noMarkOutlet.alpha = 1;
        _markOutlet.hidden = YES;
        _wordLabel.text = word;
        [self correctAlert];
    } else if ([wordSet characterAtIndex:0] == 'C'){
        _wordLabel.text = word;
        _noMarkOutlet.alpha = 1;
        _markOutlet.hidden = YES;
        [self correctAlert];
    }
    else {
        [self incorrectAlert];
    }
}

- (IBAction)markButton:(UIButton *)sender {
    if (([wordSet characterAtIndex:0] == 'B') || ([wordSet characterAtIndex:0] == 'D')) {
        _markOutlet.alpha = 1;
        _noMarkOutlet.hidden = YES;
        [self correctAlert];
    }
        //  else if ([wordSet characterAtIndex:0] == 'C')
        //     [self correctAlert];
    else
    {
        [self incorrectAlert];
    }
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
    alert = [[alertView alloc] initWithTitle:word
                                     message:@"Congratulations, you marked the word correct!           "
                                    delegate:self
                           cancelButtonTitle:nil
                           otherButtonTitles:[NSString stringWithFormat:@"Mark More words in Group %@", wordType],@"Word Groups",@"Enter Any Word",nil];
    
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


- (IBAction)speakerButton:(UIButton *)sender {    
    NSURL *url = [NSURL URLWithString:audioUrl];
    NSURLRequest *urlrequest = [NSURLRequest requestWithURL:url];
    [Webview loadRequest:urlrequest];
     Webview.hidden=YES;
    
}
@end





