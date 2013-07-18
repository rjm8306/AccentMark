//
//  JSON.h
//  AccentMark
//
//  Created by Robert Millar on 7/5/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSON : NSObject
{
    NSDictionary *jsonDict;
    NSArray *jsonArray;
    NSData *jsonData;
}
- (NSData *) parseJSONWithURL:(NSURL *) jsonURL;

@end
