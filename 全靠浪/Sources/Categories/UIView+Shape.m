//
//  UIView+Shape.m
//  QQing
//
//  Created by Ben on 5/5/16.
//
//

#import "UIView+Shape.h"

@implementation UIView (Shape)

#pragma mark - 加边框

- (void)setBorderWidth:(CGFloat)width {
    if (width) {
        self.layer.borderWidth  = width;
    }
}

- (void)setBorderColor:(UIColor *)color {
    if (color) {
        self.layer.borderColor = [color CGColor];
    }
}

- (void)setBorderWidth:(CGFloat)width withColor:(UIColor *)color {
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
}

#pragma mark - 加圆角

- (void)circular:(CGFloat)dist {
//    [self layoutIfNeeded];
    [[self layer] setCornerRadius:dist];
    [[self layer] setMasksToBounds:YES];
}

// 圆形
- (void)circularShape {
    [self circular:MIN(self.width, self.height) / 2];
}

- (void)circularCorner {
    [self circular:3.0f];
}

- (void)circularWithoutMask:(CGFloat)dist {
//    [self layoutIfNeeded];
    self.layer.cornerRadius = dist;
    self.layer.masksToBounds = NO;
}

// 圆形
- (void)circularShapeWithoutMask {
    [self circularWithoutMask:MIN(self.width, self.height) / 2];
}

- (void)circularCornerWithoutMask {
    [self circularWithoutMask:3.0f];
}

- (void)circularSomeCorner:(UIRectCorner)someCorner withRadius:(CGFloat)radius{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:someCorner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)circularSomeCorner:(UIRectCorner)someCorner withSize:(CGSize)size withRadius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) byRoundingCorners:someCorner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, size.width, size.height);
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
