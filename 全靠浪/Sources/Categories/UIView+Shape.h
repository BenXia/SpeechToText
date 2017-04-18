//
//  UIView+Shape.h
//  QQing
//
//  Created by Ben on 5/5/16.
//
//

#import <Foundation/Foundation.h>

@interface UIView (Shape)

// 加边框
- (void)setBorderWidth:(CGFloat)width;
- (void)setBorderColor:(UIColor *)color;
- (void)setBorderWidth:(CGFloat)width withColor:(UIColor *)color;

// 加圆角
- (void)circular:(CGFloat)dist;
- (void)circularShape; // 圆形
- (void)circularCorner;

- (void)circularWithoutMask:(CGFloat)dist;
- (void)circularShapeWithoutMask; // 圆形
- (void)circularCornerWithoutMask;

// 只加部分圆角
- (void)circularSomeCorner:(UIRectCorner)someCorner withRadius:(CGFloat)radius;
- (void)circularSomeCorner:(UIRectCorner)someCorner withSize:(CGSize)size withRadius:(CGFloat)radius;

@end


