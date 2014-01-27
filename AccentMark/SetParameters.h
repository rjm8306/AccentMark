//
//  SetParameters.h
//  AccentMark
//
//  Created by Robert Millar on 1/25/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetParameters : NSObject
{
    NSString *inputCat;
    NSString *cat;
    NSString *wordGroup;
}
+(NSString *)SetWordGroup :(NSString *)cat;
+(NSURL*)SetURL:(int) cata;


@end
