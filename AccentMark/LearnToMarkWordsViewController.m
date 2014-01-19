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
    if (indexPath.row == 0) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=1"];
    } else if (indexPath.row == 1) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=2"];
    } else if (indexPath.row == 2) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=3"];
    } else if (indexPath.row == 3) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=4"];
    } else if (indexPath.row == 4) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=5"];
    } else if (indexPath.row == 5) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=6"];
    } else if (indexPath.row == 6) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=7"];
    } else if (indexPath.row == 7) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=8"];
    } else if (indexPath.row == 8) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=9"];
    } else if (indexPath.row == 9) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=10"];
    } else if (indexPath.row == 10) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=11"];
    } else if (indexPath.row == 11) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=12"];
    } else if (indexPath.row == 12) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=13"];
    } else if (indexPath.row == 13) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=14"];
    } else if (indexPath.row == 14) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=15"];
    } else if (indexPath.row == 15) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=16"];
    } else if (indexPath.row == 16) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=17"];
    } else if (indexPath.row == 17) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=18"];
    } else if (indexPath.row == 18) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=19"];
    } else if (indexPath.row == 19) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=20"];
    } else if (indexPath.row == 20) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=21"];
    } else if (indexPath.row == 21) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=22"];
    } else if (indexPath.row == 22) {
        catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=23"];
    } else{
        NSLog(@"error");
    }
    [self.navigationController pushViewController:catResults animated:NO];
}
@end
