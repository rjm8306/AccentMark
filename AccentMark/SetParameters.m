//
//  SetParameters.m
//  AccentMark
//
//  Created by Robert Millar on 1/25/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//

#import "SetParameters.h"

@implementation SetParameters
-(void)setCat:(NSString*)cat
{
    cat = inputCat;
    
}

+(NSString *)SetWordGroup :(NSString *)cat
{
    NSString *wordGroup = nil;
    
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
    return wordGroup;
    
}


+(NSURL*)SetURL:(int) cata;
{
    NSURL *url;
    if (cata == 1) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=1"];
    } else if (cata == 2) {
       url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=2"];
    } else if (cata == 3) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=3"];
    } else if (cata == 4) {
      url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=4"];
    } else if (cata == 5) {
     url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=5"];
    } else if (cata == 6) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=6"];
    } else if (cata == 7) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=7"];
    } else if (cata == 8) {
       url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=8"];
    } else if (cata == 9) {
      url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=9"];
    } else if (cata == 10) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=10"];
    } else if (cata == 11) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=11"];
    } else if (cata == 12) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=12"];
    } else if (cata == 13) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=13"];
    } else if (cata == 14) {
       url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=14"];
    } else if (cata == 15) {
       url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=15"];
    } else if (cata == 16) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=16"];
    } else if (cata == 17) {
      url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=17"];
    } else if (cata == 18) {
      url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=18"];
    } else if (cata == 19) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=19"];
    } else if (cata == 20) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=20"];
    } else if (cata == 21) {
       url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=21"];
    } else if (cata == 22) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=22"];
    } else if (cata == 23) {
        url = [NSURL URLWithString:  @"http://184.107.218.58/~lingapps/api/v1/?key=0694ca6ec483864e11d4e8867d0ca4db&method=getCategory&category=23"];
    } else{
        NSLog(@"SetParameters error");
    }
    
    return url;
    
}

@end
