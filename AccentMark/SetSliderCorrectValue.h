//
//  SetSliderCorrectValue.h
//  AccentMark
//
//  Created by Robert Millar on 1/25/14.
//  Copyright (c) 2014 Robert Millar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetSliderCorrectValue : NSObject
{
    float sliderCorrectValue;
    NSString *temp;
    NSString *sylabifiedWord;
    int i;
    int j;
}
+(float)SetSliderMinValue :(NSString *)sylibifiedWord;
+(float)SetSliderMaxValue :(NSString *)sylibifiedWord;@end
