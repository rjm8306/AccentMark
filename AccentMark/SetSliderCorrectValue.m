//
//  SetSliderCorrectValue.m
//  AccentMark
//
//  Created by Robert Millar on 1/25/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//
#import "EnterAccentViewController.h"
#import "SetSliderCorrectValue.h"

@implementation SetSliderCorrectValue

+(float)SetSliderMinValue :(NSString *)sylibifiedWord
{
    float sliderMinValue=0;
    NSString *temp;
    //NSString *sylabifiedWord;
    int i;
    int j;
    
    sylibifiedWord = sylibifiedWord;
    
    for (i=0; i<sylibifiedWord.length; i++) {
        temp  = [NSString stringWithFormat:@"%c", [sylibifiedWord characterAtIndex:i]];
        if ([temp isEqual:@"á"] ||
            [temp isEqual:@"é"] ||
            [temp isEqual:@"í"] ||
            [temp isEqual:@"ó"] ||
            [temp isEqual:@"ú"]) {
            j=i;
        }
    }
    
    
    for (i=0; i<j; i++) {
        temp  = [NSString stringWithFormat:@"%c", [sylibifiedWord characterAtIndex:i]];
        if ([temp isEqual:@"m"]) {
            sliderMinValue=  sliderMinValue + 6;
        } else if ([temp isEqual:@"w"]){
            sliderMinValue =  sliderMinValue + 5;
        } else if ([temp isEqual:@"f"]  || [temp isEqual:@"r"]){
            sliderMinValue =  sliderMinValue + 2;
        } else if ([temp isEqual:@"j"] ||  [temp isEqual:@"t"]){
            sliderMinValue =  sliderMinValue + 2;
        } else if ([temp isEqual:@"i"] ||  [temp isEqual:@"l"]){
            sliderMinValue =  sliderMinValue + 1.5;
        } else if ([temp isEqual:@"i"] ||  [temp isEqual:@" "]){
            sliderMinValue =  sliderMinValue + 2;
        } else {
            sliderMinValue =  sliderMinValue + 4;
        }
    }
    sliderMinValue = sliderMinValue - 1;
    NSLog(@"sliderMinValue == %f", sliderMinValue);
    
    return sliderMinValue;
}


+(float)SetSliderMaxValue :(NSString *)sylibifiedWord
{
    float sliderCorrectValue=0;
    NSString *temp;
        //NSString *sylabifiedWord;
    int i;
    int j;
    
    sylibifiedWord = sylibifiedWord;
    
    for (i=0; i<sylibifiedWord.length; i++) {
        temp  = [NSString stringWithFormat:@"%c", [sylibifiedWord characterAtIndex:i]];
        if ([temp isEqual:@"á"] ||
            [temp isEqual:@"é"] ||
            [temp isEqual:@"í"] ||
            [temp isEqual:@"ó"] ||
            [temp isEqual:@"ú"]) {
            j=i;
        }
    }
    
    
    for (i=0; i<=j; i++) {
        temp  = [NSString stringWithFormat:@"%c", [sylibifiedWord characterAtIndex:i]];
        if ([temp isEqual:@"m"]) {
            sliderCorrectValue=  sliderCorrectValue + 6;
        } else if ([temp isEqual:@"w"]){
            sliderCorrectValue =  sliderCorrectValue + 5;
        } else if ([temp isEqual:@"f"]  || [temp isEqual:@"r"]){
            sliderCorrectValue =  sliderCorrectValue + 2;
        } else if ([temp isEqual:@"j"] ||  [temp isEqual:@"t"]){
            sliderCorrectValue =  sliderCorrectValue + 2;
        } else if ([temp isEqual:@"i"] ||  [temp isEqual:@"l"]){
            sliderCorrectValue =  sliderCorrectValue + 1.5;
        } else if ([temp isEqual:@"i"] ||  [temp isEqual:@" "]){
            sliderCorrectValue =  sliderCorrectValue + 2;
        } else {
            sliderCorrectValue =  sliderCorrectValue + 4;
        }
        
    }
    sliderCorrectValue = sliderCorrectValue+1;
    NSLog(@"sliderCorrectValue == %f", sliderCorrectValue);
    
    return sliderCorrectValue;
}




@end
