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
#import "SetParameters.h"
#import "SetSliderCorrectValue.h"


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
{
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
            NSLog(@"181charLIST");
            if ([[charList objectAtIndex:i] isEqualToString:@"·"] ||
                [[charList objectAtIndex:i] isEqualToString:@"á"] ){
                [charList replaceObjectAtIndex:i withObject:@"a"];
                accentMarkLocation = i;
                NSLog(@"1");
                
            }
            if ([[charList objectAtIndex:i] isEqualToString:@"È"] ||
                [[charList objectAtIndex:i] isEqualToString:@"é"]){
                [charList replaceObjectAtIndex:i withObject:@"e"];
                accentMarkLocation = i;
                NSLog(@"2");
            }
            if ([[charList objectAtIndex:i] isEqualToString:@"Ì"] ||
                [[charList objectAtIndex:i] isEqualToString:@"í"]){
                [charList replaceObjectAtIndex:i withObject:@"i"];
                accentMarkLocation = i;
                NSLog(@"3");

            }
            if ([[charList objectAtIndex:i] isEqualToString:@"Û"] ||
                [[charList objectAtIndex:i] isEqualToString:@"ó"]){
                [charList replaceObjectAtIndex:i withObject:@"o"];
                accentMarkLocation = i;
                NSLog(@"3");
            }
            if ([[charList objectAtIndex:i] isEqualToString:@"˙"] ||
                [[charList objectAtIndex:i] isEqualToString:@"ú"]){
                [charList replaceObjectAtIndex:i withObject:@"u"];
                accentMarkLocation = i;
                NSLog(@"4");
            }
               //01/26 modifiedWord = [modifiedWord stringByAppendingString:temp];
            
        }
     NSLog(@"217modifiedWord = %@", modifiedWord);
    NSLog(@"charlist2 = %@", charList);
    
    //          modifiedWord = [[NSMutableString alloc] init];
   // NSLog(@"charList = %@", charList);
//    for (i=0; i<[charList count]; i++) {
//        temp = [charList objectAtIndex:i];
//        
//   //     NSLog(@"%@", temp);
//     //may possibly need to do this for the other letters
//        //testing is showing correct so far
//        NSLog(@"charList3 = %@", [charList objectAtIndex:i]);
//        if([temp isEqual:@"·"]||[temp isEqual:@"á"]){
//            temp = @"a";
//            accentMarkLocation = i;
//            NSLog(@"aposition = %d",accentMarkLocation);
//        }
//        if([temp isEqual:@"È"]||[temp isEqual:@"é"]){
//            temp = @"e";
//            accentMarkLocation = i;
//            NSLog(@"eposition = %d",accentMarkLocation);
//        }
//        if([temp isEqual:@"Ì"] ||[temp isEqual:@"í"]) {
//            temp = @"i";
//            accentMarkLocation = i;
//            NSLog(@"iposition = %d",accentMarkLocation);
//        }
//        if([temp isEqual:@"Û"]||[temp isEqual:@"ó"]){
//            temp = @"o";
//            accentMarkLocation = i;
//            NSLog(@"oposition = %d",accentMarkLocation);
//        }
//        if([temp isEqual:@"˙"]||[temp isEqual:@"ú"]){
//            temp = @"u";
//            accentMarkLocation = i;
//            NSLog(@"uposition = %d",accentMarkLocation);
//        }
//        if([temp isEqual:@"Ò"]){
//            temp = @"ñ";
//           // NSLog(@"position = %d",accentMarkLocation);
//           
//        }
//        NSLog(@"charList4 = %@", [charList objectAtIndex:i]);
//        modifiedWord = [modifiedWord stringByAppendingString:temp];
//        NSLog(@"modifiedWord after charList = %@", modifiedWord);
    //    NSLog(@"mWord = %@", modifiedWord);
  //  }

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
    NSLog(@"278 wordList = %@", wordList);
    for (i=0; i<[wordList count]; i++) {
      //  NSMutableString * temp1;
        temp = [wordList objectAtIndex:i];
    //    NSLog(@"test %d", i);
        NSLog(@"temp for wordList  %@", temp);
        NSUInteger position = [temp rangeOfString:@"á"].location;
        if(position !=NSNotFound){
                wordMark = i;
            NSLog(@"position = %d",wordMark);
        }
        position = [temp rangeOfString:@"é"].location;
        if(position !=NSNotFound){
            wordMark = i;
            NSLog(@"position = %d",wordMark);
        }
        position = [temp rangeOfString:@"í"].location;
        if(position !=NSNotFound){
            wordMark = i;
            NSLog(@"position = %d",wordMark);
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
    NSLog(@"316 sylword = %@", sylibifiedWord1);
    if((position = NSNotFound)) {
        position = [sylibifiedWord1 rangeOfString:@"á"].location;
        if(position !=NSNotFound){
            NSRange range1;
            range1.location= position;
            range1.length = 1;
            [sylibifiedWord1 replaceCharactersInRange:range1 withString:@"a"];
            NSLog(@"316 sylword = %@", sylibifiedWord1);
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
    NSLog(@"358 sylbifiedWord1 = %@", sylibifiedWord1);
    
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
        NSLog(@"386 sliderMinValue = %f", sliderMinValue);
        NSLog(@"387 sliderMaxValue = %f", sliderMaxValue);
        return [self wordList][wordMark];
    }
}

#pragma mark

    // add attributes to the given range in self.label
- (void)addLabelAttributes:(NSDictionary *)attributes range:(NSRange)range
{
    if (range.location != NSNotFound) {
        NSLog(@"397 inside addLabelAttributes");
       // NSLog(@"%@ = self.wordLabel.attributedText", self.wordLabel.attributedText);
        
        NSMutableAttributedString *attributedString = [self.wordLabel.attributedText mutableCopy];
        NSRange range2 = range;
        [attributedString addAttributes:attributes
                     range:range];
          self.wordLabel.attributedText = attributedString;
        self.subViewWordLabel.attributedText = attributedString;
        
        
        NSLog(@"test1");
         attributedStringWithAccentMark = [sylibifiedWord mutableCopy];
        NSLog(@"test2");
       // [attributedStringWithAccentMark addAttributes:attributes range:range2];
    
        NSLog(@"test3");
    
    
    }
}
- (void)addSelectedCharAttributes:(NSDictionary *)attributes
{
    NSRange range;
    range.location = [modifiedWord length]-1;
    range.length = 1;
    NSLog(@"Range is: %@", NSStringFromRange(range));
    [self addLabelAttributes:attributes range:range];
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
        _noMarkSubView.hidden = NO;
       // _wordLabel.text = word;
        //[self correctAlert];
    } else if ([wordGroup characterAtIndex:0] == 'C'){
      //  _wordLabel.text = word;
        _noMarkOutlet.alpha = 1;
        _markOutlet.hidden = YES;
        _noMarkSubView.hidden = NO;
       // [self correctAlert];
    }
    else {
        [self incorrectAlert];
    }
}

- (IBAction)markButton:(UIButton *)sender {
    
    
//add logic here for place mark
    
    
    
    if (([wordGroup characterAtIndex:0] == 'B') || ([wordGroup characterAtIndex:0] == 'D')|| ([wordGroup characterAtIndex:0] == 'E')) {
        [self findAccentMarkLocation:sylibifiedWord];
//        [self findAccentMarkLocation:modifiedWord];
       // self.subViewWordLabel =
        _markOutlet.alpha = 1;
        _noMarkOutlet.hidden = YES;
       // [self correctAlert];
//        for (k=0; k<sylibifiedWord.length; k++) {
//            char character = [sylibifiedWord characterAtIndex:k];
//            charString = [NSString stringWithFormat:@"%c" , character];
//            NSLog(@"590 sylibifiedWord == %@", sylibifiedWord);
//            
//            if (k==0) {
//                UILabel *character0 = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 300, 45)];
//                //character0.textColor = [UIColor orangeColor];
//                character0.font = [UIFont systemFontOfSize:fontSize];
//                character0.text = charString;
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character0.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character0];
//            } else if (k==1){
//                UILabel *character1 = [[UILabel alloc] initWithFrame:CGRectMake(25, 180, 300, 45)];
//                character1.text = charString;
//                //character1.textColor = [UIColor orangeColor];
//                character1.font = [UIFont systemFontOfSize:fontSize];
//                character1.text = charString;
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character1.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character1];
//            } else if (k==2){
//                UILabel *character2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 180, 300, 45)];
//                character2.text = charString;
//                //character2.textColor = [UIColor orangeColor];
//                character2.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character2.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character2];
//            }else if (k==3){
//                UILabel *character3 = [[UILabel alloc] initWithFrame:CGRectMake(55, 180, 300, 45)];
//                character3.text = charString;
//                //character3.textColor = [UIColor orangeColor];
//                character3.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character3.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character3];
//            }else if (k==4){
//                UILabel *character4 = [[UILabel alloc] initWithFrame:CGRectMake(70, 205, 300, 45)];
//                character4.text = charString;
//                //character4.textColor = [UIColor orangeColor];
//                character4.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character4.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character4];
//            } else if (k==5){
//                UILabel *character5 = [[UILabel alloc] initWithFrame:CGRectMake(85, 205, 300, 45)];
//                character5.text = charString;
//                //character5.textColor = [UIColor orangeColor];
//                character5.font = [UIFont systemFontOfSize:22.0];
//                character5.text = charString;
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character5.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character5];
//            } else if (k==6){
//                UILabel *character6 = [[UILabel alloc] initWithFrame:CGRectMake(100, 205, 300, 45)];
//                character6.text = charString;
//                //character6.textColor = [UIColor orangeColor];
//                character6.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character6.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character6];
//            }else if (k==7){
//                UILabel *character7 = [[UILabel alloc] initWithFrame:CGRectMake(115, 205, 300, 45)];
//                character7.text = charString;
//                //character7.textColor = [UIColor orangeColor];
//                character7.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character7.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character7];
//            }else if (k==8){
//                UILabel *character8 = [[UILabel alloc] initWithFrame:CGRectMake(130, 205, 300, 45)];
//                character8.text = charString;
//                //character8.textColor = [UIColor orangeColor];
//                character8.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character8.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character8];
//            } else if (k==9){
//                UILabel *character9 = [[UILabel alloc] initWithFrame:CGRectMake(145, 205, 300, 45)];
//                character9.text = charString;
//                //character9.textColor = [UIColor orangeColor];
//                character9.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character9.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character9];
//            }else if (k==10){
//                UILabel *character10 = [[UILabel alloc] initWithFrame:CGRectMake(160, 205, 300, 45)];
//                character10.text = charString;
//                //character10.textColor = [UIColor orangeColor];
//                character10.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character10.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character10];
//            }else if (k==11){
//                UILabel *character11 = [[UILabel alloc] initWithFrame:CGRectMake(175, 205, 300, 45)];
//                character11.text = charString;
//                //character11.textColor = [UIColor orangeColor];
//                character11.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character11.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character11];
//            } else if (k==12){
//                UILabel *character12 = [[UILabel alloc] initWithFrame:CGRectMake(190, 205, 300, 45)];
//                character12.text = charString;
//                //character12.textColor = [UIColor orangeColor];
//                character12.font = [UIFont systemFontOfSize:fontSize];
//                character12.text = charString;
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character12.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character12];
//            } else if (k==13){
//                UILabel *character13 = [[UILabel alloc] initWithFrame:CGRectMake(205, 205, 300, 45)];
//                character13.text = charString;
//                //character13.textColor = [UIColor orangeColor];
//                character13.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character13.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character13];
//            }else if (k==14){
//                UILabel *character14 = [[UILabel alloc] initWithFrame:CGRectMake(220, 205, 300, 45)];
//                character14.text = charString;
//                //character14.textColor = [UIColor orangeColor];
//                character14.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character14.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character14];
//            }else if (k==15){
//                UILabel *character15 = [[UILabel alloc] initWithFrame:CGRectMake(235, 205, 300, 45)];
//                character15.text = charString;
//                //character15.textColor = [UIColor orangeColor];
//                character15.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character15.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character15];
//            }else if (k==16){
//                UILabel *character16 = [[UILabel alloc] initWithFrame:CGRectMake(250, 205, 300, 45)];
//                character16.text = charString;
//                    //character10.textColor = [UIColor orangeColor];
//                character16.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character16.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character16];
//            }else if (k==17){
//                UILabel *character17 = [[UILabel alloc] initWithFrame:CGRectMake(265, 205, 300, 45)];
//                character17.text = charString;
//                    //character11.textColor = [UIColor orangeColor];
//                character17.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character17.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character17];
//            } else if (k==18){
//                UILabel *character18 = [[UILabel alloc] initWithFrame:CGRectMake(280, 205, 300, 45)];
//                character18.text = charString;
//                    //character12.textColor = [UIColor orangeColor];
//                character18.font = [UIFont systemFontOfSize:fontSize];
//                character18.text = charString;
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character18.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character18];
//            } else if (k==19){
//                UILabel *character19 = [[UILabel alloc] initWithFrame:CGRectMake(295, 205, 300, 45)];
//                character19.text = charString;
//                    //character13.textColor = [UIColor orangeColor];
//                character19.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character19.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character19];
//            }else if (k==20){
//                UILabel *character20 = [[UILabel alloc] initWithFrame:CGRectMake(310, 205, 300, 45)];
//                character20.text = charString;
//                    //character14.textColor = [UIColor orangeColor];
//                character20.font = [UIFont systemFontOfSize:fontSize];
//                if (k>beginingOfTheStressedSylable && k<endOfTheStressedSylable) {
//                    character20.textColor = [UIColor greenColor];
//                }
//                [self.view addSubview:character20];
//                       } else {
//                
//                NSLog(@"787 error");
//            }
//        }//end k for loop
        
        UIImage *thumbImage = [UIImage imageNamed:@"sliderArrow30x19.png"];
        [_subViewSlider setThumbImage:thumbImage forState:UIControlStateNormal];
        [_subViewSlider setThumbImage:thumbImage forState:UIControlStateHighlighted];
        
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
        
            catResults->cat = cata;
                
            catResults->url =[SetParameters SetURL:cata];
                
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
   // [self findAccentMarkLocation:sylibifiedWord];
    //currentValue =  _subViewSlider.value;

   
   // NSLog(@"Accent letter value %d",accentMarkLocation);
   // NSLog(@"current value = %d", currentValue);
   // NSLog(@"correctSliderValue = %d", sliderCorrectValue);
   // NSLog(@"wordMark = %d", wordMark);
   // NSLog(@"sylibifiedWord = %@", sylibifiedWord);
    if (_subViewSlider.value > sliderMinValue && _subViewSlider.value < sliderMaxValue) {
            //    if (currentValue == accentMarkLocation) {
 NSLog(@"909 SliderValue %f",_subViewSlider.value);//float
        NSLog(@"slidermin = %f", sliderMinValue);
        NSLog(@"slidermax = %f", sliderMaxValue);
       // _wordLabel.text = modifiedWord;
       // _subViewWordLabel.text= _wordLabel.text;
      //  self.subViewWordLabel.attributedText = attributedStringWithAccentMark;
        _wordLabel.text = sylibifiedWord;
        _subViewWordLabel.text = _wordLabel.text;
        _subViewWordLabel.attributedText=_wordLabel.attributedText;
        NSLog(@"%@", sylibifiedWord);
        
        [self performSelector:@selector(correctAlert) withObject:@"" afterDelay:2];
      
    } else {
        [self incorrectAlert];
    }
}

//sliderWord contains word with no accent mark and - for spaces

- (void)findAccentMarkLocation:(NSString *)sylibifiedWord;
{
    
    
//    //broke so commenting out code  1/23/2014
    //array returning out of bounds
    
    
//    NSLog(@"sylWord = %@", sylibifiedWord);
//    sliderArraywithoutAccentMark = [[NSMutableArray alloc] initWithCapacity:[sylibifiedWord length]];
//    sliderArrayWithAccentMark = [[NSMutableArray alloc] initWithCapacity:[sylibifiedWord length]];
//    temp = [NSString stringWithFormat:@"%c", [sylibifiedWord characterAtIndex:i]];
//    if([temp isEqualToString:@" "])
//        temp = @"-";
//    [sliderArrayWithAccentMark addObject:temp];
//    [sliderArraywithoutAccentMark addObject:temp];
//    
//    NSLog(@"sliderArrayWithAccentMark = %@", sliderArrayWithAccentMark);
//    NSLog(@"sliderArrayWithoutAccentMark = %@", sliderArrayWithAccentMark);
//    if ([[sliderArraywithoutAccentMark objectAtIndex:i] isEqualToString:@"á"]){
//        [sliderArraywithoutAccentMark replaceObjectAtIndex:i withObject:@"a"];
//        accentFound = i;
//        NSLog(@"accentFound = %d", accentFound);
//    }
//    if ([[sliderArraywithoutAccentMark objectAtIndex:i] isEqualToString:@"é"])
//        [sliderArraywithoutAccentMark replaceObjectAtIndex:i withObject:@"e"];
//    
//    if ([[sliderArraywithoutAccentMark objectAtIndex:i] isEqualToString:@"í"])
//        [sliderArraywithoutAccentMark replaceObjectAtIndex:i withObject:@"i"];
//    
//    if ([[sliderArraywithoutAccentMark objectAtIndex:i] isEqualToString:@"ó"])
//        [sliderArraywithoutAccentMark replaceObjectAtIndex:i withObject:@"o"];
//    
//    if ([[sliderArraywithoutAccentMark objectAtIndex:i] isEqualToString:@"ú"])
//        [sliderArraywithoutAccentMark replaceObjectAtIndex:i withObject:@"u"];
//
////
//    //sliderWord = sylibifiedWord;
//    //replace " " with -
//    sliderWordWithAccentMark = sliderWord;
////    for (i=0; i < [sliderWord length]; i++){
////        temp  = [NSString stringWithFormat:@"%c", [sliderWord characterAtIndex:i]];
////        if ([temp isEqualToString:@" "]) {
////            sliderWordWithAccentMark = [sliderWord stringByReplacingOccurrencesOfString:@" " withString:@"-"];
////            
////        }
////        sliderWordWithAccentMark = sliderWord;
////        NSLog(@"sliderWordWithAccentMark  =%@", sliderWordWithAccentMark);
         //NSLog(@"sliderWord  =%@", sliderWord);
////    
////    }
//    
//    
    sliderWord = sylibifiedWord;
    NSLog(@"in find accent mark");
    NSLog(@"sliderWord = %@", sliderWord);
    NSLog(@"sylibifiedWord in findAccentMark = %@", sylibifiedWord);
    NSLog(@"modifiedWord in findAccentMark = %@", modifiedWord);
    NSLog(@"1038 accentMarkLocation = %d", accentMarkLocation);
    for (i=0; i < sliderWord.length; i++){
        temp  = [NSString stringWithFormat:@"%c", [sliderWord characterAtIndex:i]];
        NSLog(@"temp = %@", temp);
        if([temp isEqual:@"·"]||[temp isEqual:@"á"]){
            accentMarkLocation = i;
            //add change char in sliderWord
        NSLog(@"1accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"È"]||[temp isEqual:@"é"]){
            accentMarkLocation = i;
        NSLog(@"2accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"Ì"] ||[temp isEqual:@"í"]){
            accentMarkLocation = i;
        NSLog(@"3accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"Û"]||[temp isEqual:@"ó"]){
        //temp = @"o";
        accentMarkLocation = i;
        
        NSLog(@"4accentMarkLocation = %d", accentMarkLocation);
        }
        if([temp isEqual:@"˙"]||[temp isEqual:@"ú"]){
            accentMarkLocation = i;
        NSLog(@"5accentMarkLocation = %d", accentMarkLocation);
        }
    }
    NSLog(@"accentMarkLocation = %d", accentMarkLocation);
    
    
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
        NSLog(@"1086 endOfTheStressedSylable = %d", endOfTheStressedSylable);
            tempFlag =1;
        }
        i++;
    }

    //for (j=accentMarkLocation; j<sylibifiedWord.length; j--) {
    while (temp1Flag == 0) {
    temp1  = [NSString stringWithFormat:@"%c", [sliderWord characterAtIndex:j]];
        NSLog(@"temp1 = %@", temp1);
        if (j==0) {
            beginingOfTheStressedSylable = -1;
            NSLog(@"beginingOfTheStressedSylable = %d and should be -1", beginingOfTheStressedSylable);
            temp1Flag =1;        }
        else if ([temp1 isEqual:@" "]){
            beginingOfTheStressedSylable = j;
            NSLog(@"beginingOfTheStressedSylable = %d", beginingOfTheStressedSylable);
            temp1Flag =1;
        }
        j--;
    NSLog(@"end find accent mark");
    }
}




- (IBAction)noMarkSubViewYesButton:(UIButton *)sender {
         _wordLabel.text = word;
        [self correctAlert];
}

- (IBAction)noMarkSUbViewNoButton:(UIButton *)sender {
    [self incorrectAlert];
}
@end





