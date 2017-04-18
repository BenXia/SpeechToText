//
//  UIImage+Utility.h
//  QQing
//
//  Created by 李杰 on 4/20/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

- (UIImage *)resizeImageToWidth:(CGFloat)resizedWidth height:(CGFloat)resizedHeight;

- (UIImage *)compressImageWithJPGCompression:(CGFloat)compressValue;    //return image as JPEG. May return nil if image has no CGImageRef or invalid bitmap format. compression is 0(most)..1(least)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

+ (UIImage *)circleImageWithColor:(UIColor *)color andSize:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color andCornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size;

- (UIImage *)circularImageWithCornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size;

+ (UIImage *)imageWithBorderColor:(UIColor *)color andCornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size;

+ (UIImage *)gradientImageWithTopColor:(UIColor *)topColor andBottomColor:(UIColor *)bottomColor andSize:(CGSize)size;

+ (UIImage *)gradientImageWithTopColor:(UIColor *)topColor
                        andMiddleColor:(UIColor *)middleColor
                        andBottomColor:(UIColor *)bottomColor
                               andSize:(CGSize)size;

+ (UIImage *)gradientImageWithTopToBottomColorArray:(NSArray <UIColor *> *)colorsArray
                                            andSize:(CGSize)size;

+ (UIImage*)imageWithUIView:(UIView*)view;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end


