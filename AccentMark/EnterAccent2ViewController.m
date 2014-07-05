//
//  EnterAccent2ViewController.m
//  AccentMark
//
//  Created by Robert Millar on 7/2/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//

#import "EnterAccent2ViewController.h"
#import "alertView.h"
#import "EnterWordViewController.h"
#import "LearnToMarkWordsViewController.h"
#import "Sylibifier.h"
#import "Catagory.h"
#import "ChooseWordViewController.h"
#import "SetParameters.h"
#import "SetSliderCorrectValue.h"

@interface EnterAccent2ViewController ()

@end




@interface EnterAccentViewController ()

@end

@implementation EnterAccentViewController
    //@synthesize sylibifiedWord;
@synthesize cata;
@synthesize cat;

#define int i = 0
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _wordLabel.text = modifiedWord;
            // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    
}


- (void)viewDidLoad
{
        //self.navigationController.navigationBar.hidden = YES;
    
    NSLog(@"%@",self.navigationController.viewControllers);
        // count = [self.navigationController.viewControllers count];
        //[self.navigationController popToViewController:  [self.navigationController.viewControllers objectAtIndex:count-3]animated:YES];
    
    fontSize = 20.0;
    
    sylibifiedWord = [Sylibifier sylibify:word];
    cata = [cat intValue];
    
    [self selectedChar];
    _wordLabel.text = modifiedWord;
    NSLog(@"47 wordlabel = %@", _wordLabel.text);
    [self addSelectedCharAttributes:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}];
    [super viewDidLoad];
    firstquestion=TRUE;
    secondquestion = TRUE;
    
    if ([cat isEqual: @"1"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"3"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"4"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"6"]) {
        
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"7"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
        _subViewLabel.text = @"Place Mark Over Lower Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"8"]) {
        _helpButton.hidden = NO;
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([cat isEqual: @"9"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
        _subViewLabel.text = @"Place Mark Over Lower Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"10"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
        _subViewLabel.text = @"Place Mark Over Lower Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"11"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"12"]) {
        _helpButton.hidden = NO;
        _subViewLabel.text = @"Place Mark Over Lower Vowel of Stressed Syllable";
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([cat isEqual: @"13"]) {
        [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
        _subViewLabel.text = @"Place Mark Over Single Upper Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"14"]) {
        [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Single Upper Vowel of Stressed Syllable";
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"15"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"16"]) {
        _helpButton.hidden = NO;
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([cat isEqual: @"17"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
        _subViewLabel.text = @"Place Mark Over Vowel of Stressed Syllable";
    } else if ([cat isEqual: @"18"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"19"]) {
        [_markOutlet setTitle:@"Place Mark Over Single Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Single Upper Vowel of Stressed Syllable";
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"20"]) {
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"21"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"22"]) {
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"23"]) {
        [_markOutlet setTitle:@"Place Mark Over 2nd UpperVowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Single Upper Vowel of Stressed Syllable";
        _helpButton.hidden = NO;
    } else if ([cat isEqual: @"6"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([cat isEqual: @"12"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([cat isEqual: @"20"]) {
        [_markOutlet setTitle:@"Place Mark Over Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Single Upper Vowel of Stressed Syllable";
            //    } else if ([cat isEqual: @"13"] || [cat isEqual: @"19"] ||[cat isEqual: @"20"] ) {
            //        [_markOutlet setTitle:@"" forState:UIControlStateNormal];
        
        
    } else {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    }
    _wordLabel.text = modifiedWord;
    _markOutlet.titleLabel.textAlignment= NSTextAlignmentCenter;
    
    if ([audioUrl hasPrefix:@"http"]) {
        _speakerOutlet.hidden = NO;
    }
    
        //
        //Set WordGroup
        //
    
        //NSLog(@"1wordGroup %@",wordGroup);
    if ([wordGroup isEqual:@"null"])
    {
        wordGroup = [SetParameters SetWordGroup:cat];
    }
    
        //
        //Set wordEndOutlet
        //
    
    if ([wordGroup isEqual: @"C"]) {
        _wordEndOutlet.text = @"Does the word end in a consonant?";
    } else if ([wordGroup isEqual: @"D"]) {
        _wordEndOutlet.text = @"Does the word end in a consonant?";
    } else if ([cat isEqual: @"20"]) {
        _wordEndOutlet.text = @"Does the word end in a consonant?";
    }
        //currentValue = 50;
        //self.subViewSlider.value = currentValue;
        //_view.reloadInputViews;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    
}

- (NSArray *)charList
{
    charList = [[NSMutableArray alloc] initWithCapacity:[word length]-1];
    for (i=0; i < [word length]; i++){//put into array
        temp  = [NSString stringWithFormat:@"%c", [word characterAtIndex:i]];
            // NSLog(@"temp = %@", temp);
        [charList addObject:temp];
        NSLog(@"175charlist1 = %@", charList);
        
        NSLog(@"177modifiedWord = %@", modifiedWord);
    }
    
    for ( i=0; i < [charList count]-1; i++){
            //   NSLog(@"181charLIST");
        if ([[charList objectAtIndex:i] isEqualToString:@"·"] ||
            [[charList objectAtIndex:i] isEqualToString:@"á"] ){
            [charList replaceObjectAtIndex:i withObject:@"a"];
            accentMarkLocation = i;
                //     NSLog(@"1");
            
        }
        if ([[charList objectAtIndex:i] isEqualToString:@"È"] ||
            [[charList objectAtIndex:i] isEqualToString:@"é"]){
            [charList replaceObjectAtIndex:i withObject:@"e"];
            accentMarkLocation = i;
                //   NSLog(@"2");
        }
        if ([[charList objectAtIndex:i] isEqualToString:@"Ì"] ||
            [[charList objectAtIndex:i] isEqualToString:@"í"]){
            [charList replaceObjectAtIndex:i withObject:@"i"];
            accentMarkLocation = i;
                // NSLog(@"3");
            
        }
        if ([[charList objectAtIndex:i] isEqualToString:@"Û"] ||
            [[charList objectAtIndex:i] isEqualToString:@"ó"]){
            [charList replaceObjectAtIndex:i withObject:@"o"];
            accentMarkLocation = i;
                //  NSLog(@"3");
        }
        if ([[charList objectAtIndex:i] isEqualToString:@"˙"] ||
            [[charList objectAtIndex:i] isEqualToString:@"ú"]){
            [charList replaceObjectAtIndex:i withObject:@"u"];
            accentMarkLocation = i;
                // NSLog(@"4");
        }
            //01/26 modifiedWord = [modifiedWord stringByAppendingString:temp];
        
    }
        // NSLog(@"217modifiedWord = %@", modifiedWord);
        //NSLog(@"charlist2 = %@", charList);
    
    
    if ([charList count]) {
        return charList;
    } else {
        return @[@""];
    }
}

    ///
    ///
    ///Start Attributes and underlined part of words
    ///
    ///

- (NSArray *)wordList
{
    wordList = [sylibifiedWord componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //NSLog(@"278 wordList = %@", wordList);
    for (i=0; i<[wordList count]; i++) {
            //  NSMutableString * temp1;
        temp = [wordList objectAtIndex:i];
            //    NSLog(@"test %d", i);
            //   NSLog(@"temp for wordList  %@", temp);
        NSUInteger position = [temp rangeOfString:@"á"].location;
        if(position !=NSNotFound){
            wordMark = i;
                //      NSLog(@"position = %d",wordMark);
        }
        position = [temp rangeOfString:@"é"].location;
        if(position !=NSNotFound){
            wordMark = i;
                //    NSLog(@"position = %d",wordMark);
        }
        position = [temp rangeOfString:@"í"].location;
        if(position !=NSNotFound){
            wordMark = i;
                //     NSLog(@"position = %d",wordMark);
        }
        position = [temp rangeOfString:@"ó"].location;
        if(position !=NSNotFound){
            wordMark = i;
        }
        position = [temp rangeOfString:@"ú"].location;
        if(position !=NSNotFound){
            wordMark = i;
        }
        
            //    NSLog(@"wordMark == %d", wordMark);
    }
        //sylibifiedWord will be text field
    NSUInteger position;
    sylibifiedWord1= [sylibifiedWord mutableCopy];
        //NSLog(@"316 sylword = %@", sylibifiedWord1);
    if((position = NSNotFound)) {
        position = [sylibifiedWord1 rangeOfString:@"á"].location;
        if(position !=NSNotFound){
            NSRange range1;
            range1.location= position;
            range1.length = 1;
            [sylibifiedWord1 replaceCharactersInRange:range1 withString:@"a"];
                //      NSLog(@"316 sylword = %@", sylibifiedWord1);
        }
    }//end  if((position = NSNotFound)) for a
    if((position = NSNotFound)) {
        position = [sylibifiedWord1 rangeOfString:@"é"].location;
        if(position !=NSNotFound){
            NSRange range1;
            range1.location= position;
            range1.length = 1;
            [sylibifiedWord1 replaceCharactersInRange:range1 withString:@"e"];
        }
    }//end  if((position = NSNotFound)) for e
    if((position = NSNotFound)) {
        position = [sylibifiedWord1 rangeOfString:@"í"].location;
        if(position !=NSNotFound){
            NSRange range1;
            range1.location= position;
            range1.length = 1;
            [sylibifiedWord1 replaceCharactersInRange:range1 withString:@"i"];
        }
    }//end  if((position = NSNotFound)) for i
    if((position = NSNotFound)) {
        position = [sylibifiedWord1 rangeOfString:@"ó"].location;
        if(position !=NSNotFound){
            NSRange range1;
            range1.location= position;
            range1.length = 1;
            [sylibifiedWord1 replaceCharactersInRange:range1 withString:@"o"];
        }
    }//end  if((position = NSNotFound)) for o
    if((position = NSNotFound)) {
        position = [sylibifiedWord1 rangeOfString:@"ú"].location;
        if(position !=NSNotFound){
            NSRange range1;
            range1.location= position;
            range1.length = 1;
            [sylibifiedWord1 replaceCharactersInRange:range1 withString:@"u"];
        }
    }//end  if((position = NSNotFound)) for u
     //  NSLog(@"358 sylbifiedWord1 = %@", sylibifiedWord1);
    
    wordList = [sylibifiedWord1 componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        // _wordLabel = sylibifiedWord1;
    if ([wordList count]) {
            //     NSLog(@"wordList = %@", wordList);
        return wordList;
    } else {
        return @[@""];
    }
}

- (NSString *)selectedChar
{
    return [self charList][[charList count]-1];
}

- (NSString *)selectedWord
{
    if ([wordGroup characterAtIndex:0] == 'C') {
        return [self wordList][[wordList count]-1];
    } else if ([wordGroup characterAtIndex:0] == 'A'){
        return [self wordList][[wordList count]-2];
    } else {
        sliderMinValue = [SetSliderCorrectValue SetSliderMinValue:sylibifiedWord];
        sliderMaxValue = [SetSliderCorrectValue SetSliderMaxValue:sylibifiedWord];
            //    NSLog(@"386 sliderMinValue = %f", sliderMinValue);
            //    NSLog(@"387 sliderMaxValue = %f", sliderMaxValue);
        return [self wordList][wordMark];
    }
}

#pragma mark

    // add attributes to the given range in self.label
- (void)addLabelAttributes:(NSDictionary *)attributes range:(NSRange)range
{
    if (range.location != NSNotFound) {
            //  NSLog(@"397 inside addLabelAttributes");
            // NSLog(@"%@ = self.wordLabel.attributedText", self.wordLabel.attributedText);
        
        NSMutableAttributedString *attributedString = [self.wordLabel.attributedText mutableCopy];
            //NSRange range2 = range;
        [attributedString addAttributes:attributes
                                  range:range];
        self.wordLabel.attributedText = attributedString;
        self.subViewWordLabel.attributedText = attributedString;
        
        
            // NSLog(@"test1");
        attributedStringWithAccentMark = [sylibifiedWord mutableCopy];
            // NSLog(@"test2");
            // [attributedStringWithAccentMark addAttributes:attributes range:range2];
        
            // NSLog(@"test3");
        
        
    }
}
- (void)addSelectedCharAttributes:(NSDictionary *)attributes
{
    NSRange range;
    range.location = [modifiedWord length]-1;
    range.length = 1;
        //NSLog(@"Range is: %@", NSStringFromRange(range));
    [self addLabelAttributes:attributes range:range];
    
    _wordLabel.text = modifiedWord;
}

    // add attributes to the selected word in self.label
- (void)addSelectedWordAttributes:(NSDictionary *)attributes
{
    NSRange range = [[self.wordLabel.attributedText string] rangeOfString:[self selectedWord]];
    [self addLabelAttributes:attributes range:range];
}

    ///
    ///Attributes ends here
    ///




    ///
    ///
    ///Button Action Listoners start here
    ///
    ///

- (IBAction)wordConstantYesButton:(UIButton *)sender {
    if (firstquestion==TRUE) {
        _wordConstantYesOutlet.alpha = 1.0;
        
        if ([wordGroup characterAtIndex:0] == 'E') {
            _stressLabel.text=@"Does the word have a stressed upper vowel?";
        }
        
        if ([wordGroup characterAtIndex:0] == 'A')
        {
            _stressLabel.text=@"Is the stress on the second to the last syllable?";
        }
        if ([wordGroup characterAtIndex:0] == 'B')
        {
            _stressLabel.text=@"Is the stress on the second to the last syllable?";
        }
        [_stressLabel setTextColor:[UIColor blackColor]];
        
        [self selectedWord];
        _wordLabel.text =sylibifiedWord1;
        [self addSelectedWordAttributes:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}];
        [super viewDidLoad];
        _wordConstantYesOutlet.alpha = 1.0;
        _stressLabel.hidden = NO;
        _stressYesOutlet.hidden = NO;
        _stressNoOutlet.hidden = NO;
        _wordConstantNoOutlet.hidden = YES;
        _wordConstantYesOutlet.enabled=NO;
        _arrow1Image.hidden=NO;
        _wordConstantYesOutlet.alpha = 1.0;
        firstquestion = FALSE;
        _wordConstantYesOutlet.alpha = 1.0;
    }
}

- (IBAction)constantNoButton:(UIButton *)sender {
    [self incorrectAlert];
}

- (IBAction)stressYesButton:(UIButton *)sender {
        // NSLog(@"495cat ====%@",cat);
        // NSLog(@"wt ====%@",wordGroup);
    if (secondquestion == TRUE) {
        if ([wordGroup characterAtIndex:0] == 'A' || [wordGroup characterAtIndex:0] == 'C')
        {
            NSLog(@"1");
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _stressYesOutlet.alpha=1.0;
            _arrow2mage.hidden = NO;
            secondquestion = FALSE;
            _stressYesOutlet.alpha=1.0;
            
            
            
        } else if ([wordGroup characterAtIndex:0] == 'E') {
            NSLog(@"2");
            _accentMarkOutlet.text=@"Does the word have Hiatus on either side of stressed upper vowel?";
            _noMarkOutlet.enabled=NO;
            _markOutlet.enabled = NO;
            _accentMarkOutlet.hidden = NO;
            
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _arrow2mage.hidden=NO;
            secondquestion = FALSE;
            _stressYesOutlet.alpha=1.0;
                //add buttons
            _wtEYesOutlet.hidden = NO;
            _wtNoOutlet.hidden = NO;
        }
        else//if wordtype is B or D
        {
                //    NSLog(@"3");
            
            [self incorrectAlert];
        }
            // NSLog(@"4");
        
    }
        //    NSLog(@"5");
    
}

    //stress

- (IBAction)stressNoButton:(UIButton *)sender {
    if (secondquestion == TRUE) {
        if ([wordGroup characterAtIndex:0] == 'B' || [wordGroup characterAtIndex:0] == 'D')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressYesOutlet.hidden = YES;
            _stressNoOutlet.hidden = NO;
            secondquestion = FALSE;
            _arrow2mage.hidden=NO;
            _stressNoOutlet.alpha=1.0;
        } else {//if word type is A or C or E
            [self incorrectAlert];
        }
    }
}

- (IBAction)noMarkButton:(UIButton *)sender {
    if ([wordGroup characterAtIndex:0] == 'A'  || [wordGroup characterAtIndex:0] == 'C')
    {
        _noMarkOutlet.alpha = 1;
        _markOutlet.hidden = YES;
        _noMarkSubView.hidden = NO;
            // _wordLabel.text = word;
            //[self correctAlert];
    }  else {
        [self incorrectAlert];
    }
}

- (IBAction)markButton:(UIButton *)sender {
    
    
        //add logic here for place mark
    
    if (([wordGroup characterAtIndex:0] == 'B') || ([wordGroup characterAtIndex:0] == 'D')) {
        [self findAccentMarkLocation:sylibifiedWord];
        _markOutlet.alpha = 1;
        _noMarkOutlet.hidden = YES;
        
        UIImage *thumbImage = [UIImage imageNamed:@"sliderArrow30x19.png"];
        [_subViewSlider setThumbImage:thumbImage forState:UIControlStateNormal];
        [_subViewSlider setThumbImage:thumbImage forState:UIControlStateHighlighted];
        _instructionLabel.hidden=NO;
        _subView.hidden = NO;
        
        
    }
        //     [self correctAlert];
    else
    {
        [self incorrectAlert];
    }
}
- (void)incorrectAlert {
    alertView *alert;
    
    
        ////// Alert
    alert = [[alertView alloc] initWithTitle:@"Incorrect"
                                     message:@"Please try again!"
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
                                     message:@"Congratulations, you marked the word correct!"
                                    delegate:self
                           cancelButtonTitle:nil
                           otherButtonTitles:[NSString stringWithFormat:@"Mark More words in Group %@", cat],@"Word Groups",@"Enter Any Word",nil];
    
    alert.style = alertStyleCorrect;
    [alert setImage:@"accept.png"];
    title=@"correct";
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.navigationController.navigationBar.hidden = NO;
        //  NSLog(@"Buttonnnn pushed: %@, index %i", alertView.title, buttonIndex);
    if ([title characterAtIndex:0] == 'c'){
        NSLog(@"works");
        {
            if(buttonIndex == 0)
            {
                    // [self.navigationController popViewControllerAnimated:YES];
                    //  ChooseWordViewController *catResults = [self.storyboard instantiateViewControllerWithIdentifier:@"catResults"];
                    // catResults->cat = cata;
                    // catResults->url =[SetParameters SetURL:cata];
                    // [self.navigationController pushViewController:catResults animated:NO];
                NSArray *viewControllers = [[self navigationController] viewControllers];
                for(i=0;i<3;i++){
                    id obj=[viewControllers objectAtIndex:i];
                    if([obj isKindOfClass:[ ChooseWordViewController class]]){
                        [[self navigationController] popToViewController:obj animated:YES];
                        return;
                    }
                    else{
                        ChooseWordViewController *catResults= [self.storyboard instantiateViewControllerWithIdentifier:@"catResults"];
                        catResults->cat = cata;
                        catResults->url = [SetParameters SetURL:cata];
                        [self.navigationController pushViewController:catResults animated:NO];
                        
                    }
                }
            }
            
            if (buttonIndex== 1) {
                    //load view with word groups
                    //LearnToMarkWordsViewController *learnToMarkWords = [self.storyboard instantiateViewControllerWithIdentifier:@"learnToMarkWords"];
                    //[self.navigationController pushViewController:learnToMarkWords animated:YES];
                NSArray *viewControllers = [[self navigationController] viewControllers];
                for(i=0;i<[viewControllers count];i++){
                    id obj=[viewControllers objectAtIndex:i];
                    if([obj isKindOfClass:[ LearnToMarkWordsViewController class]]){
                        [[self navigationController] popToViewController:obj animated:YES];
                        return;
                    }
                    else{
                        LearnToMarkWordsViewController *wordType= [self.storyboard instantiateViewControllerWithIdentifier:@"word"];
                        [self.navigationController pushViewController:wordType animated:NO];
                    }
                }
            }
            if (buttonIndex ==2) {
                    //load enter word view
                EnterWordViewController *enterWord = [self.storyboard instantiateViewControllerWithIdentifier:@"enterWord"];
                [self.navigationController pushViewController:enterWord animated:YES];
            }
        }
    }
}


- (IBAction)BackButton:(UIBarButtonItem *)sender {
}

- (IBAction)speakerButton:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:audioUrl];
    NSURLRequest *urlrequest = [NSURLRequest requestWithURL:url];
        //added 01/08/14 to hide the webView
    Webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 1024,768)];
    [Webview loadRequest:urlrequest];
    Webview.hidden=YES;
    
}


- (IBAction)helpButton:(UIButton *)sender {
    if (cata ==  13 ||cata ==  14 || cata == 19  || cata == 20 )
    {
        EnterAccentViewController *HelpScreenOne = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenOne"];
        [self.navigationController pushViewController:HelpScreenOne animated:NO];
    }
    else if(cata == 15 || cata == 16 || cata == 17)
    {
        EnterAccentViewController *HelpScreenTwo = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenTwo"];
        [self.navigationController pushViewController:HelpScreenTwo animated:NO];
    }
    else if (cata ==  22 || cata== 23)
    {
        EnterAccentViewController *HelpScreenThree = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenThree"];
        [self.navigationController pushViewController:HelpScreenThree animated:NO];
    }
    else if (cata ==  7 || cata == 8 || cata ==  9 || cata == 10 || cata == 11 || cata == 12 || cata == 21)
    {
        EnterAccentViewController *HelpScreenFour = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenFour"];
        [self.navigationController pushViewController:HelpScreenFour animated:NO];
    }
}
- (IBAction)subViewButton:(UIButton *)sender {
        // [self findAccentMarkLocation:sylibifiedWord];
        //currentValue =  _subViewSlider.value;
    
    
        // NSLog(@"Accent letter value %d",accentMarkLocation);
        // NSLog(@"current value = %d", currentValue);
        // NSLog(@"correctSliderValue = %d", sliderCorrectValue);
        // NSLog(@"wordMark = %d", wordMark);
        // NSLog(@"sylibifiedWord = %@", sylibifiedWord);
    if (_subViewSlider.value > sliderMinValue && _subViewSlider.value < sliderMaxValue) {
            //    if (currentValue == accentMarkLocation) {
            //NSLog(@"909 SliderValue %f",_subViewSlider.value);//float
            // NSLog(@"slidermin = %f", sliderMinValue);
            // NSLog(@"slidermax = %f", sliderMaxValue);
            // _wordLabel.text = modifiedWord;
            // _subViewWordLabel.text= _wordLabel.text;
            //  self.subViewWordLabel.attributedText = attributedStringWithAccentMark;
        _wordLabel.text = sylibifiedWord;
        _subViewWordLabel.text = _wordLabel.text;
        _subViewWordLabel.attributedText=_wordLabel.attributedText;
            //  NSLog(@"%@", sylibifiedWord);
        [_checkAnswerButton setTitle:@"Checking Answer" forState:UIControlStateNormal];        [self performSelector:@selector(correctAlert) withObject:@"" afterDelay:1];
        
    } else {
        [self incorrectAlert];
    }
}

    //sliderWord contains word with no accent mark and - for spaces

- (void)findAccentMarkLocation:(NSString *)sylibifiedWord;
{
    sliderWord = [sylibifiedWord1 mutableCopy];
        // NSLog(@"in find accent mark");
        // NSLog(@"sliderWord = %@", sliderWord);
        // NSLog(@"sylibifiedWord in findAccentMark = %@", sylibifiedWord1);
        // NSLog(@"modifiedWord in findAccentMark = %@", modifiedWord);
        // NSLog(@"1038 accentMarkLocation = %d", accentMarkLocation);
    for (i=0; i < sliderWord.length; i++){
        temp  = [NSString stringWithFormat:@"%c", [sliderWord characterAtIndex:i]];
            //   NSLog(@"temp = %@", temp);
        if([temp isEqual:@"·"]||[temp isEqual:@"á"]){
            accentMarkLocation = i;
                //add change char in sliderWord
                //  NSLog(@"1accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"È"]||[temp isEqual:@"é"]){
            accentMarkLocation = i;
                // NSLog(@"2accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"Ì"] ||[temp isEqual:@"í"]){
            accentMarkLocation = i;
                //NSLog(@"3accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"Û"]||[temp isEqual:@"ó"]){
                //temp = @"o";
            accentMarkLocation = i;
                //NSLog(@"4accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"˙"]||[temp isEqual:@"ú"]){
            accentMarkLocation = i;
                //NSLog(@"5accentMarkLocation = %d", accentMarkLocation);
        }
    }
        //NSLog(@"accentMarkLocation = %d", accentMarkLocation);
    
    
    temp = nil;
    temp1 = nil;
    i = accentMarkLocation;
    j = accentMarkLocation;
    
    while (tempFlag == 0) {
        
        
            //for (i=accentMarkLocation; i<sylibifiedWord.length; i++) {
        temp  = [NSString stringWithFormat:@"%c", [sliderWord characterAtIndex:i]];
            // NSLog(@"temp = %@", temp);
        if (i+1 == sliderWord.length) {
            endOfTheStressedSylable = i;
                //NSLog(@"endOfTheStressedSylable = %d", endOfTheStressedSylable);
            tempFlag =1;
        } else if ([temp isEqual:@" "]){
            endOfTheStressedSylable = i;
                //  NSLog(@"1086 endOfTheStressedSylable = %d", endOfTheStressedSylable);
            tempFlag =1;
        }
        i++;
    }
    
        //for (j=accentMarkLocation; j<sylibifiedWord.length; j--) {
    while (temp1Flag == 0) {
        temp1  = [[NSString stringWithFormat:@"%c", [sliderWord characterAtIndex:j]] mutableCopy];
            //NSLog(@"temp1 = %@", temp1);
        if (j==0) {
            beginingOfTheStressedSylable = -1;
                //  NSLog(@"beginingOfTheStressedSylable = %d and should be -1", beginingOfTheStressedSylable);
            temp1Flag =1;        }
        else if ([temp1 isEqual:@" "]){
            beginingOfTheStressedSylable = j;
                //NSLog(@"beginingOfTheStressedSylable = %d", beginingOfTheStressedSylable);
            temp1Flag =1;
        }
        j--;
            // NSLog(@"end find accent mark");
    }
}




- (IBAction)noMarkSubViewYesButton:(UIButton *)sender {
    _wordLabel.text = word;
    [self correctAlert];
}

- (IBAction)noMarkSUbViewNoButton:(UIButton *)sender {
    [self incorrectAlert];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    _checkAnswerButton.hidden=NO;
}

- (IBAction)wtEYesButton:(UIButton *)sender {
    _eNoOutlet.hidden = NO;
    _eYesOutlet.hidden = NO;
    _wtNoOutlet.hidden = YES;
    _wtEYesOutlet.alpha=1.0;
    _arrow3Image.hidden = NO;
    _EOutlet.hidden = NO;
    
}
- (IBAction)wtENoButton:(UIButton *)sender {
    [self incorrectAlert];
}
- (IBAction)eYesButton:(UIButton *)sender {
    [self findAccentMarkLocation:sylibifiedWord];
        //_eYesOutlet.alpha = 1;
    _eNoOutlet.hidden = YES;
    _eYesOutlet.hidden = YES;
    UIImage *thumbImage = [UIImage imageNamed:@"sliderArrow30x19.png"];
    [_subViewSlider setThumbImage:thumbImage forState:UIControlStateNormal];
    [_subViewSlider setThumbImage:thumbImage forState:UIControlStateHighlighted];
    _instructionLabel.hidden=NO;
    _subView.hidden = NO;
    
}
- (IBAction)eNoButton:(UIButton *)sender {
    [self incorrectAlert];
    
    
}

- (IBAction)backButtonAction:(UIBarButtonItem *)sender {
    NSLog(@"back button pressed");
    _backButtonOutlet.enabled=NO;
        //    ChooseWordViewController *catResults= [self.storyboard instantiateViewControllerWithIdentifier:@"catResults"];
        //       catResults->cat = cata;
        //    catResults->url = [SetParameters SetURL:cata];
        //    self.navigationController.navigationBar.hidden = NO;
        //       [self.navigationController pushViewController:catResults animated:NO];
        //[self.navigationController popToRootViewControllerAnimated:NO];  //ViewControllerAnimated:NO];//  pushViewController:catResults animated:NO];
        // [self.navigationController popToViewController:  [self.navigationController.viewControllers objectAtIndex:count-1 ]animated:YES];
        //  [[self.navigationController popToViewController:[[UINavigationController.navigationController objectAtIndex:2] animated:YES];//  ToViewController:2]Animated:NO];
    NSArray *viewControllers = [[self navigationController] viewControllers];
    self.navigationController.navigationBar.hidden = NO;
    NSLog(@"%lu", (unsigned long)[viewControllers count]);
        //for(i=[viewControllers count];i>0;i--){
        //  id obj=[viewControllers objectAtIndex:i];
        // if([obj isKindOfClass:[ LearnToMarkWordsViewController class]])//{
        //   [[self navigationController] popToViewController:obj animated:YES];
        // return;
    [[self navigationController] popViewControllerAnimated:NO];
        //        }
        //        if([obj isKindOfClass:[ EnterWordViewController class]]){
        //            [[self navigationController] popToViewController:obj animated:YES];
        //            return;
        //        }
        //    
        //     }
}
@end





