//
//  Sylibifier.h
//  AccentMark
//
//  Created by Robert Millar on 6/21/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sylibifier : NSObject
{
    
        NSString *sylibifyWord;  //original word
        NSString *word;
        NSMutableArray *characters;
        NSString *sylable;
        NSString *sylable1;
        NSString *sylable2;
        NSString *sylable3;
        NSString *temp;
        int count;
        int j;
        int k;
   // int firstVowel;
}
@end

@interface Sylibifier (WordViewController)
-(void)setWord:(NSString*)words;
+(NSString *) sylibify:(NSString *)words;

@end