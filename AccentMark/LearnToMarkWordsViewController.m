//
//  LearnToMarkWordsViewController.m
//  AccentMark
//
//  Created by Robert Millar on 6/21/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "LearnToMarkWordsViewController.h"
#import "ChooseWordViewController.h"
#import "SetParameters.h"
@interface LearnToMarkWordsViewController ()

@end

@implementation LearnToMarkWordsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
   // self.navigationController.navigationBar.hidden = YES;
   
    }

- (void)viewDidLoad
{
    //UINavigationController *navigationController = navigationController;
    
    [super viewDidLoad];
   // self.navigationController.navigationBar.hidden = YES;
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChooseWordViewController *catResults = [self.storyboard instantiateViewControllerWithIdentifier:@"catResults"];
    catResults->cat = (int)indexPath.row +1;
    catResults->url = [SetParameters SetURL:(int)indexPath.row+1];
    
       [self.navigationController  pushViewController:catResults animated:YES];
}
- (IBAction)backButtonAction:(UIBarButtonItem *)sender {
    [[self navigationController] popToRootViewControllerAnimated:YES];
   }

@end
