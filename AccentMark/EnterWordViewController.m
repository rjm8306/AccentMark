//
//  EnterWordViewController.m
//  AccentMark
//
//  Created by Robert Millar on 6/21/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "EnterWordViewController.h"
#import "EnterWordResultsViewController.h"

@interface EnterWordViewController ()

@end

@implementation EnterWordViewController
@synthesize catagory;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButton:(UIButton *)sender {
    input = _userInput.text;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    input = _userInput.text;
    EnterWordResultsViewController *dest = (EnterWordResultsViewController *)[segue destinationViewController];
    dest->word = input;
    
}

@end
