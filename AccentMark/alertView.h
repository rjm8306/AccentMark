//
//  alertView.h
//  AccentMark
//
//  Created by Robert Millar on 6/30/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    alertViewStyleNone,
    alertStyleAlert,
    alertStyleCorrect,

} alertViewStyle;


@interface alertView : UIAlertView

@property (assign) alertViewStyle style;

- (void)setTopColor:(UIColor*)tc middleColor:(UIColor*)mc bottomColor:(UIColor*)bc lineColor:(UIColor*)lc;
- (void)setFontName:(NSString*)fn fontColor:(UIColor*)fc fontShadowColor:(UIColor*)fsc;
- (void)setImage:(NSString*)imageName;

@end
