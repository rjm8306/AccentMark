//
//  LessonsViewController.m
//  AccentMark
//
//  Created by Robert Millar on 1/9/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//

#import "LessonsViewController.h"
#import "HelpScreenOneViewController.h"
#import "HelpScreenTwoViewController.h"
#import "HelpScreenThreeViewController.h"
#import "HelpScreenFourViewController.h"


@interface LessonsViewController ()

@end

@implementation LessonsViewController

@synthesize arrItems;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{    self.navigationController.navigationBar.hidden = YES;
    [super viewDidLoad];
    //list contains table view items
    arrItems = [[NSArray alloc] initWithObjects:@"Hiatus",@"Unique Hiatus",@"Diphthong",@"More Diphthong", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 return [arrItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [arrItems objectAtIndex:indexPath.row];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.navigationController.navigationBar.hidden = NO;
    if (indexPath.row ==0) {
        HelpScreenOneViewController *HelpScreenOne = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenOne"];
        
        [self.navigationController pushViewController:HelpScreenOne animated:NO];
    } else if (indexPath.row ==1) {
        HelpScreenTwoViewController *HelpScreenTwo = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenTwo"];
        
        [self.navigationController pushViewController:HelpScreenTwo animated:NO];
    } else if (indexPath.row ==2) {
        HelpScreenOneViewController *HelpScreenThree = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenThree"];
        
        [self.navigationController pushViewController:HelpScreenThree animated:NO];
    } else if (indexPath.row ==3) {
    HelpScreenOneViewController *HelpScreenFour = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenFour"];
    
    [self.navigationController pushViewController:HelpScreenFour animated:NO];
}}

- (IBAction)backButtonAction:(UIBarButtonItem *)sender {
    [[self navigationController] popToRootViewControllerAnimated:YES];

}
@end
