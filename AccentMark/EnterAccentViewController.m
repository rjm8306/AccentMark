//
//  EnterAccentViewController.m
//  AccentMark
//
//  Created by Robert Millar on 7/6/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "EnterAccentViewController.h"
#import "alertView.h"
#import "EnterWordViewController.h"
#import "LearnToMarkWordsViewController.h"
#import "Sylibifier.h"
#import "Catagory.h"
#import "ChooseWordViewController.h"

@interface EnterAccentViewController ()

@end

@implementation EnterAccentViewController
@synthesize cata;
@synthesize cat;

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
{   // [super viewDidLoad];
   sylibifiedWord = [Sylibifier sylibify:word];
  //  NSLog(@"in view controller");
    cata = [cat intValue];
   // NSLog(@"audio = %@", audioUrl);
   //NSLog(@"mWord = %@", modifiedWord);

    [self selectedChar];
    _wordLabel.text = modifiedWord;
   // _subViewWordLabel.text = modifiedWord;
    
    [self addSelectedCharAttributes:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}];
    
    
    [super viewDidLoad];
    firstquestion=TRUE;
    secondquestion = TRUE;
    
        //set text for last button
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
    } else if ([cat isEqual: @"6"]) {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([cat isEqual: @"12"]) {
        [_markOutlet setTitle:@"Place Mark Over Lower Vowel of Stressed Syllable" forState:UIControlStateNormal];
    } else if ([cat isEqual: @"20"]) {
        [_markOutlet setTitle:@"Place Mark Over Upper Vowel of Stressed Syllable" forState:UIControlStateNormal];
        _subViewLabel.text = @"Place Mark Over Single Upper Vowel of Stressed Syllable";
    } else {
        [_markOutlet setTitle:@"Place Mark Over Vowel of Stressed Syllable" forState:UIControlStateNormal];
    }
    _markOutlet.titleLabel.textAlignment= NSTextAlignmentCenter;
    
    
    if ([audioUrl hasPrefix:@"http"]) {
        _speakerOutlet.hidden = NO;
    }
    
    //NSLog(@"1wordGroup %@",wordGroup);
    if ([wordGroup isEqual:@"null"])
    {
        if ([cat isEqual: @"1"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"2"]) {
            wordGroup = @"A";
        } else if ([cat isEqual: @"3"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"4"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"5"]) {
            wordGroup = @"C";
        } else if ([cat isEqual: @"6"]) {
            wordGroup = @"D";
        } else if ([cat isEqual: @"7"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"8"]) {
            wordGroup = @"A";
        } else if ([cat isEqual: @"9"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"10"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"11"]) {
            wordGroup = @"11";
        } else if ([cat isEqual: @"12"]) {
            wordGroup = @"D";
        } else if ([cat isEqual: @"13"]) {
            wordGroup = @"E";
        } else if ([cat isEqual: @"14"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"15"]) {
            wordGroup = @"A";        
        } else if ([cat isEqual: @"16"]) {
            wordGroup = @"A";
        } else if ([cat isEqual: @"17"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"18"]) {
            wordGroup = @"A";    
        } else if ([cat isEqual: @"19"]) {
            wordGroup = @"B";
        } else if ([cat isEqual: @"20"]) {
            wordGroup = @"E";
        } else if ([cat isEqual: @"21"]) {
            wordGroup = @"C";
        } else if ([cat isEqual: @"22"]) {
            wordGroup = @"A";
        } else if ([cat isEqual: @"23"]) {
            wordGroup = @"B";
        } else {
            NSLog(@"unable to set wordGroup");
        }
    }
    if ([wordGroup isEqual: @"C"]) {
        _wordEndOutlet.text = @"Does the word end in a consonant?";
    } else if ([wordGroup isEqual: @"D"]) {
        _wordEndOutlet.text = @"Does the word end in a consonant?";
    } else if ([cat isEqual: @"20"]) {
        _wordEndOutlet.text = @"Does the word end in a consonant?";
    }
    //currentValue = 50;
	//self.subViewSlider.value = currentValue;
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
        

        
    }
    
        for ( i=0; i < [charList count]-1; i++){
            if ([[charList objectAtIndex:i] isEqualToString:@"·"] ||
                [[charList objectAtIndex:i] isEqualToString:@"á"] ){
                [charList replaceObjectAtIndex:i withObject:@"a"];
                accentMarkLocation = i;
            }
            if ([[charList objectAtIndex:i] isEqualToString:@"È"] ||
                [[charList objectAtIndex:i] isEqualToString:@"é"]){
                [charList replaceObjectAtIndex:i withObject:@"e"];
                accentMarkLocation = i;
            }
            if ([[charList objectAtIndex:i] isEqualToString:@"Ì"] ||
                [[charList objectAtIndex:i] isEqualToString:@"í"]){
                [charList replaceObjectAtIndex:i withObject:@"i"];
                accentMarkLocation = i;
            }
            if ([[charList objectAtIndex:i] isEqualToString:@"Û"] ||
                [[charList objectAtIndex:i] isEqualToString:@"ó"]){
                [charList replaceObjectAtIndex:i withObject:@"o"];
                accentMarkLocation = i;
            }
            if ([[charList objectAtIndex:i] isEqualToString:@"˙"] ||
                [[charList objectAtIndex:i] isEqualToString:@"ú"]){
                [charList replaceObjectAtIndex:i withObject:@"u"];
                accentMarkLocation = i;
            }
        }
               
              modifiedWord = [[NSMutableString alloc] init];
   // NSLog(@"charList = %@", charList);
    for (i=0; i<[charList count]; i++) {
        temp = [charList objectAtIndex:i];
   //     NSLog(@"%@", temp);
     //may possibly need to do this for the other letters
        //testing is showing correct so far
        NSLog(@"charList = %@", [charList objectAtIndex:i]);
        if([temp isEqual:@"·"]||[temp isEqual:@"á"]){
            temp = @"a";
            accentMarkLocation = i;
        }
        if([temp isEqual:@"È"]||[temp isEqual:@"é"]){
            temp = @"e";
            accentMarkLocation = i;
        }
        if([temp isEqual:@"Ì"] ||[temp isEqual:@"í"]) {
            temp = @"i";
            accentMarkLocation = i;
        }
        if([temp isEqual:@"Û"]||[temp isEqual:@"ó"]){
            temp = @"o";
            accentMarkLocation = i;
        }
        if([temp isEqual:@"˙"]||[temp isEqual:@"ú"]){
            temp = @"u";
            accentMarkLocation = i;
        }
        if([temp isEqual:@"Ò"]  ){
            temp = @"ñ";
           
        }
        modifiedWord = [modifiedWord stringByAppendingString:temp];
      //  NSLog(@"modifiedWord after charList = %@", modifiedWord);
    //    NSLog(@"mWord = %@", modifiedWord);
    }

    if ([charList count]) {
       // NSLog(@"returning");
        return charList;
    } else {
        return @[@""];
    }
}


- (NSArray *)wordList
{
    wordList = [sylibifiedWord componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    for (i=0; i<[wordList count]; i++) {
      //  NSMutableString * temp1;
        temp = [wordList objectAtIndex:i];
    //    NSLog(@"test %d", i);
    //    NSLog(@"tempp  %@", temp);
        NSUInteger position = [temp rangeOfString:@"á"].location;
        if(position !=NSNotFound){
                wordMark = i;
        }
        position = [temp rangeOfString:@"é"].location;
        if(position !=NSNotFound){
            wordMark = i;
        }
        position = [temp rangeOfString:@"í"].location;
        if(position !=NSNotFound){
            wordMark = i;
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
    if((position = NSNotFound)) {
        position = [sylibifiedWord1 rangeOfString:@"á"].location;
        if(position !=NSNotFound){
            NSRange range1;
            range1.location= position;
            range1.length = 1;
            [sylibifiedWord1 replaceCharactersInRange:range1 withString:@"a"];
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
        return [self wordList][wordMark];
    }
}

#pragma mark

    // add attributes to the given range in self.label
- (void)addLabelAttributes:(NSDictionary *)attributes range:(NSRange)range
{
    if (range.location != NSNotFound) {
       // NSLog(@"inside addLabelAttributes");
       // NSLog(@"%@ = self.wordLabel.attributedText", self.wordLabel.attributedText);
        
        NSMutableAttributedString *attributedString = [self.wordLabel.attributedText mutableCopy];
       // for (i=0;i<[mat length] ; i++) {}
        
        //NSMutableAttributedString *mat =sylibifiedWord1;
        
        [attributedString addAttributes:attributes
                     range:range];
        //NSLog(@"%@ mat", mat);
          self.wordLabel.attributedText = attributedString;
        self.subViewWordLabel.attributedText = attributedString;
       // NSLog(@"mat = %@", mat);
    }
}
- (void)addSelectedCharAttributes:(NSDictionary *)attributes
{
    NSRange range;
    range.location = [modifiedWord length]-1;
    range.length = 1;
    [self addLabelAttributes:attributes range:range];
}

    // add attributes to the selected word in self.label
- (void)addSelectedWordAttributes:(NSDictionary *)attributes
{
    NSRange range = [[self.wordLabel.attributedText string] rangeOfString:[self selectedWord]];
    [self addLabelAttributes:attributes range:range];
}



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
    if (secondquestion == TRUE) {
        if ([wordGroup characterAtIndex:0] == 'A')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _stressYesOutlet.alpha=1.0;
            _arrow2mage.hidden = NO;
            secondquestion = FALSE;
            _stressYesOutlet.alpha=1.0;
            
        }
        else if ([wordGroup characterAtIndex:0] == 'C')
        {
        
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _arrow2mage.hidden=NO;
            secondquestion = FALSE;
            _stressYesOutlet.alpha=1.0;
        }
        else if ([wordGroup characterAtIndex:0] == 'E')
        {
            
            _accentMarkOutlet.text=@"Does the word have Hiatus on either side of stressed upper vowel?";
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressNoOutlet.hidden = YES;
            _stressYesOutlet.enabled = NO;
            _arrow2mage.hidden=NO;
            secondquestion = FALSE;
            _stressYesOutlet.alpha=1.0;
            
        }
        else//if wordtype is B or D
        {
            [self incorrectAlert];
        }
    }
}
- (IBAction)stressNoButton:(UIButton *)sender {
    if (secondquestion == TRUE) {
        if ([wordGroup characterAtIndex:0] == 'B')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressYesOutlet.hidden = YES;
            _stressNoOutlet.hidden = NO;
            secondquestion = FALSE;
            _arrow2mage.hidden=NO;
            _stressNoOutlet.alpha=1.0;
        }
        else if ([wordGroup characterAtIndex:0] == 'D')
        {
            _noMarkOutlet.hidden = NO;
            _markOutlet.hidden = NO;
            _accentMarkOutlet.hidden = NO;
            _stressYesOutlet.hidden = YES;
            _stressNoOutlet.hidden = NO;
            secondquestion = FALSE;
            _arrow2mage.hidden=NO;
            _stressNoOutlet.alpha=1.0;
        }
        else{//if word type is A or C or E
            [self incorrectAlert];
        }
        
    }
    
}

- (IBAction)noMarkButton:(UIButton *)sender {
    if ([wordGroup characterAtIndex:0] == 'A')
    {
        _noMarkOutlet.alpha = 1;
        _markOutlet.hidden = YES;
        _wordLabel.text = word;
        [self correctAlert];
    } else if ([wordGroup characterAtIndex:0] == 'C'){
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
    
    
//add logic here for place mark
    
    
    
    if (([wordGroup characterAtIndex:0] == 'B') || ([wordGroup characterAtIndex:0] == 'D')|| ([wordGroup characterAtIndex:0] == 'E')) {
        [self findAccentMarkLocation:modifiedWord];
       // self.subViewWordLabel =
        _markOutlet.alpha = 1;
        _noMarkOutlet.hidden = YES;
       // [self correctAlert];
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
  //  NSLog(@"Buttonnnn pushed: %@, index %i", alertView.title, buttonIndex);
    if ([title characterAtIndex:0] == 'c'){
        NSLog(@"works");
        {
            if(buttonIndex == 0)
            {
                ChooseWordViewController *catResults = [self.storyboard instantiateViewControllerWithIdentifier:@"catResults"];
        //        NSLog(@"passing cat %@", cat);
        //        NSLog(@"passing cata %d", cata);
                if (cata == 1) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=1"];
                } else if (cata == 2) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=2"];
                } else if (cata == 3) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=3"];
                } else if (cata == 4) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=4"];
                } else if (cata == 5) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=5"];
                } else if (cata == 6) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=6"];
                } else if (cata == 7) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=7"];
                } else if (cata == 8) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=8"];
                } else if (cata == 9) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=9"];
                } else if (cata == 10) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=10"];
                } else if (cata == 11) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=11"];
                } else if (cata == 12) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=12"];
                } else if (cata == 13) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=13"];
                } else if (cata == 14) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=14"];
                } else if (cata == 15) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=15"];
                } else if (cata == 16) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=16"];
                } else if (cata == 17) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=17"];
                } else if (cata == 18) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=18"];
                } else if (cata == 19) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=19"];
                } else if (cata == 20) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=20"];
                } else if (cata == 21) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=21"];
                } else if (cata == 22) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=22"];
                } else if (cata == 23) {
                    catResults->url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=23"];
                } else{
                    NSLog(@"error");
                }
 
                catResults->cat = cata;
                
                [self.navigationController pushViewController:catResults animated:NO];
                
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
   //added 01/08/14 to hide the webView
    Webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 1024,768)];
    
    
    [Webview loadRequest:urlrequest];
     Webview.hidden=YES;
    
}


- (IBAction)helpButton:(UIButton *)sender {
    if(cata == 15 || cata == 16 || cata == 17)
    {
        
    EnterAccentViewController *HelpScreenOne = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenOne"];
        [self.navigationController pushViewController:HelpScreenOne animated:NO];
    }
    else if (cata ==  13 || cata == 20)
    {
        
        EnterAccentViewController *HelpScreenOne = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenTwo"];
        [self.navigationController pushViewController:HelpScreenOne animated:NO];
    }
    else if (cata ==  22)
    {
        
        EnterAccentViewController *HelpScreenOne = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenThree"];
        [self.navigationController pushViewController:HelpScreenOne animated:NO];
    }
    else if (cata ==  7 || cata == 8 || cata ==  9 || cata == 10 || cata == 11 || cata == 12 || cata == 18 || cata == 21)
    {
        EnterAccentViewController *HelpScreenOne = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpScreenFour"];
        [self.navigationController pushViewController:HelpScreenOne animated:NO];
    }
    

}
- (IBAction)subViewButton:(UIButton *)sender {
  
    currentValue =  _subViewSlider.value;
    NSLog(@"SliderValue %f",_subViewSlider.value);//float
    NSLog(@"Accent letter value %d",accentMarkLocation);
    NSLog(@"current value = %d", currentValue);
    NSLog(@"wordMark = %d", wordMark);
    NSLog(@"sylibifiedWord = %@", sylibifiedWord);
    if (currentValue == 0) {
            //    if (currentValue == accentMarkLocation) {
        _subView.hidden = YES;
        [self correctAlert];
    } else {
        [self incorrectAlert];
    }
}

- (void)findAccentMarkLocation:(NSString *)sylibifiedWord;
{
    for (i=0; i < [modifiedWord length]; i++){
       // temp1 = modifiedWord;
        temp  = [NSString stringWithFormat:@"%c", [modifiedWord characterAtIndex:i]];
        if([temp isEqual:@"·"]||[temp isEqual:@"á"])
            accentMarkLocation = i;
        
        if([temp isEqual:@"È"]||[temp isEqual:@"é"])
            accentMarkLocation = i;
        
        if([temp isEqual:@"Ì"] ||[temp isEqual:@"í"])
            accentMarkLocation = i;
        
        if([temp isEqual:@"Û"]||[temp isEqual:@"ó"])
            temp = @"o";
            accentMarkLocation = i;
        
        if([temp isEqual:@"˙"]||[temp isEqual:@"ú"])
            accentMarkLocation = i;
     
    }
}


@end





