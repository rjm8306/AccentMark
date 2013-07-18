//
//  Word.h
//  AccentMark
//
//  Created by Robert Millar on 6/29/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject
{
    NSURL *url;
    NSArray *wordArray;
    NSDictionary *jsonDict;
    NSString *wordSet;
    NSString *wordCatagory;
@public  NSString *wordType;
    NSString *urlString;
    
}
@end
