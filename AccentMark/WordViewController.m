//
//  WordViewController.m
//  AccentMark
//
//  Created by Robert Millar on 6/24/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "WordViewController.h"
@interface WordViewController ()


@end

@implementation WordViewController

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
    
    NSLog(@"wordType: %@" ,wordType);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
    jsonDict = [[NSDictionary alloc] init];
    wordArray = [[NSMutableArray alloc] init];
   // NSString *apiKey= 0694ca6ec483864e11d4e8867d0ca4db;
    urlString= [NSString stringWithFormat:@"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=%@ ", wordType];
    //urlString = 5;
    url = [NSURL URLWithString:urlString];
    
    
        // Setup the URL with the JSON URL.
    
    NSLog(@"id: %@", url ); //TEST CODE
    [self parseJSONWithURL:url];
   
    
}
- (void) parseJSONWithURL:(NSURL *) jsonURL
{
        // Set the queue to the background queue.
        // Runs on a background thread to keep the UI Responsive.
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        // Run request on background queue (thread).
    dispatch_async(queue, ^{
        NSError *error = nil;
        
            // Request the data and store in a string.
        NSString *json = [NSString stringWithContentsOfURL:jsonURL encoding:NSASCIIStringEncoding error:&error];
            NSLog(@"A json: %@", json); //TEST CODE
        
        if (error == nil){
                // Convert the String into an NSData object.
            NSData *jsonData = [json dataUsingEncoding:NSASCIIStringEncoding];
            
                // Fills the dictionary and Array.
                // Parse that data object using NSJSONSerialization without options.
            jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            wordArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            
                // Parsing success.
            if (error == nil)
            {
                    // Go back to the main thread and update the table with the json data.
                    // Keeps the user interface responsive.
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    
                        //MOVE ARRAY FILL TO HERE
                        //  [jsonTable reloadData];
                        //NSLog(@"A Affiliates Array: %@", affiliatesArray); //TEST CODE
                 
                    _wordLabel.text  = wordArray.lastObject [@"word"];
                    wordSet=wordArray.lastObject[@"word_group"];
                    NSLog(@"wordSet: %@", wordSet);
                });
            }
            
                // Parsing failed, display error as alert.
            else
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Uh Oh, Parsing Failed." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                
                [alertView show];
            }
        }
        
            // Request Failed, display error as alert.
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Request Error! Check that you are connected to wifi or 3G/4G with internet access." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            
            [alertView show];
        }
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)wordConstantYesButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'C')
    {
        [self createAlert];
          }
    else if ([wordSet characterAtIndex:0] == 'D')
    {
       [self createAlert];
    }
    else
    {
        [_stressLabel setTextColor:[UIColor redColor]];
        
        _stressLabel.text=@"Is the stess on the second to the last syllable?";
        _stressLabel.hidden = NO;
        _stressYesOutlet.hidden = NO;
        _stressNoOutlet.hidden = NO;
      _wordConstantNoOutlet.hidden = YES;
        _wordConstantYesOutlet.enabled=NO;
    }
}

- (IBAction)stressYesButton:(UIButton *)sender {
  if ([wordSet characterAtIndex:0] == 'A')
  {
  _noMarkOutlet.hidden = NO;
    _markOutlet.hidden = NO;
    _accentMarkOutlet.hidden = NO;
    _stressNoOutlet.hidden = YES;
      
      
}
   else if ([wordSet characterAtIndex:0] == 'C')
    {
        _noMarkOutlet.hidden = NO;
        _markOutlet.hidden = NO;
        _accentMarkOutlet.hidden = NO;
        _stressNoOutlet.hidden = YES;
    }
    else
      [self createAlert];  
}
- (IBAction)stressNoButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'B')
    {
        _noMarkOutlet.hidden = NO;
        _markOutlet.hidden = NO;
        _accentMarkOutlet.hidden = NO;
        _stressYesOutlet.hidden = YES;
    }
    else
     [self createAlert];      
    
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
[self createAlert];
    }

}
- (IBAction)noMarkButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'B')
[self correctAlert];
    else if ([wordSet characterAtIndex:0] == 'D')
        [self correctAlert];
    else
        [self createAlert];
   
    
}

- (IBAction)markButton:(UIButton *)sender {
    if ([wordSet characterAtIndex:0] == 'A') 
        [self correctAlert];
    else if ([wordSet characterAtIndex:0] == 'C')
        [self correctAlert];
    else
        [self createAlert];
}
- (void)createAlert {
   // UIImage *ActionSheetBg = [UIImage imageNamed:@"redButton.png"];
  //  UIImageView *BgImgView = [[UIImageView alloc] initWithImage:ActionSheetBg];
  
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Accent Mark" message:@"Incorrect" delegate:self cancelButtonTitle:@"Try Again"  otherButtonTitles:nil];
                    [alert show];

}
- (void)correctAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:(@"@%", wordArray.lastObject [@"word"]) message:@"Congradulations, You are correct!!!"delegate:self cancelButtonTitle:@"Practice with anouther word?"  otherButtonTitles:nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        NSLog(@"test");
            //cancel clicked ...do your action
       // remove(wordArray.lastObject);
      // NSNumber *index = wordArray.lastObject;
      //  [wordArray removeObjectAtIndex:0];

    }
}
    -(void) remove
    {
        
    }

//    UILabel *theTitle = [alert valueForKey:@"_titleLabel"];
//    [theTitle setTextColor:[UIColor redColor]];
//UILabel *theBody = [alert valueForKey:@"_bodyTextLabel"];
//[theBody setTextColor:[UIColor redColor]];
//
//UIImage *theImage = [UIImage imageNamed:@"Background.png"];
//theImage = [theImage stretchableImageWithLeftCapWidth:16 topCapHeight:16];
//CGSize theSize = [alert frame].size;
//
//UIGraphicsBeginImageContext(theSize);
//[theImage drawInRect:CGRectMake(0, 0, theSize.width, theSize.height)];
//theImage = UIGraphicsGetImageFromCurrentImageContext();
//UIGraphicsEndImageContext();

//[[alert layer] setContents:[theImage CGImage]];
 
@end
