//
//  alertView.m
//  AccentMark
//
//  Created by Robert Millar on 6/30/13.
//  Copyright (c) 2013 Robert Millar. All rights reserved.
//

#import "alertView.h"
#import "QuartzCore/QuartzCore.h"

#define RGBA(r,g,b,a)       [UIColor colorWithRed:((r)/255.0) green:((g)/255.0) blue:((b)/255.0) alpha:(a)]
#define FONT                @"HelveticaNeue-Bold"

typedef enum {
    gold,
    blue,
    green,
    alpha,
}colorComponent;

@interface alertView () {
    int moveFactor;

}

@property (strong) UIColor *bottomColor;
@property (strong) UIColor *middleColor;
@property (strong) UIColor *topColor;
@property (strong) UIColor *lineColor;

@property (assign) NSString *fontName;
@property (strong) UIColor *fontColor;
@property (strong) UIColor *fontShadowColor;

@property (assign) NSString *imageName;

@end

@implementation alertView

- (void)layoutSubviews
{
    if (_style || _topColor || _fontName)
    {
        
        switch (_style)
        {
            case alertStyleAlert:
                [self setTopColor:RGBA(224, 176, 40, 1) middleColor:RGBA(222, 167, 40, 1) bottomColor:RGBA(222, 167, 40, 1) lineColor:RGBA(224, 176, 40, 1)];
                break;
                
            case alertStyleCorrect:
                [self setTopColor:RGBA(104, 187, 60, 1) middleColor:RGBA(97, 184, 50, 1) bottomColor:RGBA(97, 184, 50, 1) lineColor:RGBA(104, 187, 60, 1)];
                break;
                
            default:
                break;
        }
        
        for (UIView *subview in self.subviews)
        {
            
            if ([subview isMemberOfClass:[UIImageView class]] && _topColor)
            {
                subview.hidden = YES;
            }
            
            if ([subview isMemberOfClass:[UILabel class]])
            {
                UILabel *label = (UILabel*)subview;
                label.textColor = _fontColor?_fontColor:[UIColor whiteColor];
                label.shadowColor = _fontShadowColor?_fontShadowColor:[UIColor darkGrayColor];
                label.shadowOffset = CGSizeMake(0.0f, 1.0f);
                label.font = [UIFont fontWithName:_fontName?_fontName:FONT size:label.font.pointSize];
            }
            
            if ([subview isKindOfClass:[UIButton class]])
            {
                UIButton *button = (UIButton *)subview;
                button.titleLabel.font = [UIFont fontWithName:_fontName?_fontName:FONT size:button.titleLabel.font.pointSize];
                button.titleLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
                [button setTitleShadowColor:_fontShadowColor?_fontShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                [button setTitleColor:_fontColor?_fontColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            }
        }
    }

           UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(-5, -25, 64, 64)];
        [self.layer addSublayer:iv.layer];
           iv.image = [UIImage imageNamed:_imageName];
  }


- (void)drawRect:(CGRect)rect
{
    if (!_style && !_topColor) return;
    
	CGContextRef context = UIGraphicsGetCurrentContext();
    
	CGRect activeBounds = self.bounds;
	CGFloat cornerRadius = 10.0f;
	CGFloat inset = 5.5f;
	CGFloat originX = activeBounds.origin.x + inset;
	CGFloat originY = activeBounds.origin.y + inset;
	CGFloat width = activeBounds.size.width - inset * 2.0f;
	CGFloat height = activeBounds.size.height - (inset + 2.0) * 2.0f;
    
	CGRect bPathFrame = CGRectMake(originX, originY, width, height - (self.numberOfButtons?0:50));
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:bPathFrame cornerRadius:cornerRadius].CGPath;
	
    CGContextSaveGState(context);
	CGContextAddPath(context, path);
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 6.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
	
	CGContextSaveGState(context);
	CGContextAddPath(context, path);
	CGContextClip(context);
    
        // Gradient
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	size_t count = 3;
	CGFloat locations[3] = {0.0f, 0.57f, 1.0f};
	CGFloat components[12] =
	{	getColor(_topColor, gold), getColor(_topColor, green), getColor(_topColor, blue), getColor(_topColor, alpha),
		getColor(_middleColor, gold), getColor(_middleColor, green), getColor(_middleColor, blue), getColor(_middleColor, alpha),
        getColor(_bottomColor, gold), getColor(_bottomColor, green), getColor(_bottomColor, blue), getColor(_bottomColor, alpha)};
	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
    
	CGPoint startPoint = CGPointMake(activeBounds.size.width * 0.5f, 0.0f);
	CGPoint endPoint = CGPointMake(activeBounds.size.width * 0.5f, activeBounds.size.height);
    
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	CGColorSpaceRelease(colorSpace);
	CGGradientRelease(gradient);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, CGRectGetMinX(activeBounds) + cornerRadius + 0.5, CGRectGetMinY(activeBounds) + 0.5);
    CGContextAddArc(context, CGRectGetMaxX(activeBounds) - cornerRadius + 0.5, CGRectGetMinY(activeBounds) + cornerRadius + 0.5, cornerRadius, 3 * M_PI / 2, 0, 0);
    CGContextAddArc(context, CGRectGetMaxX(activeBounds) - cornerRadius + 0.5, CGRectGetMaxY(activeBounds) - cornerRadius + 0.5, cornerRadius, 0, M_PI / 2, 0);
    CGContextAddArc(context, CGRectGetMinX(activeBounds) + cornerRadius + 0.5, CGRectGetMaxY(activeBounds) - cornerRadius + 0.5, cornerRadius, M_PI / 2, M_PI, 0);
    CGContextAddArc(context, CGRectGetMinX(activeBounds) + cornerRadius + 0.5, CGRectGetMinY(activeBounds) + cornerRadius + 0.5, cornerRadius, M_PI, 3 * M_PI / 2, 0);
    CGContextClosePath(context);
	CGContextClip(context);
	
	CGFloat glossRadius = 1100.0f;
	CGPoint glossCenterPoint = CGPointMake(CGRectGetMidX(activeBounds), 35.0 - glossRadius);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, glossCenterPoint.x, glossCenterPoint.y);
	CGContextAddArc(context, glossCenterPoint.x, glossCenterPoint.y, glossRadius, 0.0, M_PI, 0
					);
	CGContextClosePath(context);
	CGContextClip(context);
    
    CGGradientRef glossGradient;
    CGFloat locations2[2] = { 0.0, 1.0 };
    CGFloat components2[8] = { 1.0, 1.0, 1.0, 0.65,
		1.0, 1.0, 1.0, 0.06 };
    glossGradient = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), components2, locations2, 2);
	CGPoint topCenter = CGPointMake(CGRectGetMidX(activeBounds), 0.0f);
    CGPoint midCenter = CGPointMake(CGRectGetMidX(activeBounds), 35.0f);
    CGContextDrawLinearGradient(context, glossGradient, topCenter, midCenter, 0);
    CGGradientRelease(glossGradient);
    
    CGContextRestoreGState(context);
	CGContextAddPath(context, path);
    CGContextSetStrokeColorWithColor(context, _fontColor?_fontColor.CGColor:[UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
    
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)setTopColor:(UIColor*)tc middleColor:(UIColor*)mc bottomColor:(UIColor*)bc lineColor:(UIColor*)lc {
    _topColor = tc;
    _middleColor = mc;
    _bottomColor = bc;
    _lineColor = lc;
}

- (void)setFontName:(NSString*)fn fontColor:(UIColor*)fc fontShadowColor:(UIColor*)fsc {
    _fontName = fn;
    _fontColor = fc;
    _fontShadowColor = fsc;
}

- (void)setImage:(NSString *)imageName {
    _imageName = imageName;
}

float getColor(UIColor *color, colorComponent comp) {
    CGFloat goldColor = 0.0, greenColor = 0.0, blueColor = 0.0, alphaValue = 0.0;
    if ([color respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [color getRed:&goldColor green:&greenColor blue:&blueColor alpha:&alphaValue];
        switch (comp) {
            case gold:
                return goldColor;
                break;
            case green:
                return greenColor;
                break;
            case blue:
                return blueColor;
                break;
            case alpha:
                return alphaValue;
                break;
        }
    }
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return components[comp];
}

@end
