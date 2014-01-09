//
//  LearnToMarkWordsViewController.m
//  AccentMark
//
//  Created by Robert Millar on 6/21/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "LearnToMarkWordsViewController.h"
#import "ChooseWordViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];

   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChooseWordViewController *catResults = [self.storyboard instantiateViewControllerWithIdentifier:@"catResults"];
    catResults->cat = indexPath.row +1;
//    if (cat == 1) {
//        catResults->urlString = [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=1"];
//    }
    [self.navigationController pushViewController:catResults animated:NO];
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    ChooseWordViewController *catResults = [self.storyboard instantiateViewControllerWithIdentifier:@"catResults"];
//    catResults->urlString = [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=%d ", cat];
//    NSLog(@"urlString = %@", urlString);}
@end
