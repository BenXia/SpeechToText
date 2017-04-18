//
//  UIImage+Utility.m
//  QQing
//
//  Created by 李杰 on 4/20/15.
//
//

#import "UIImage+Utility.h"

static CGFloat const degreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

static CGFloat const radiansToDegrees(CGFloat radians) {
    return radians * 180/M_PI;
}

@implementation UIImage (Utility)

- (UIImage *)resizeImageToWidth:(CGFloat)resizedWidth height:(CGFloat)resizedHeight {
    CGImageRef imageRef = [self CGImage];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef bitmap = CGBitmapContextCreate(NULL, resizedWidth, resizedHeight, 8, 4 * resizedWidth, colorSpace, (CGBitmapInfo)(kCGImageAlphaPremultipliedFirst));
    CGContextDrawImage(bitmap, CGRectMake(0, 0, resizedWidth, resizedHeight), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(ref);
    
    return result;
}

- (UIImage *)compressImageWithJPGCompression:(CGFloat)compressValue {
    /*压缩图片*/
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width, self.size.height));
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    UIImage *pressImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImageJPEGRepresentation(pressImage, compressValue);
    
    return [UIImage imageWithData:imageData];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)circleImageWithColor:(UIColor *)color andSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillEllipseInRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color andCornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rect.size.width, rect.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)circularImageWithCornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(UIGraphicsGetCurrentContext(), path.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
}

+ (UIImage *)imageWithBorderColor:(UIColor *)color andCornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    CGContextAddPath(context, path.CGPath);
    
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    CGContextSetLineWidth(context, 1);
    CGContextStrokePath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)gradientImageWithTopColor:(UIColor *)topColor andBottomColor:(UIColor *)bottomColor andSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    CGPoint endPoint = CGPointMake(0.0, size.height);
    NSArray *colorsArray = [NSArray arrayWithObjects:topColor, bottomColor, nil];
    CGGradientRef gradientRef = [UIImage createCGGradientWithColors:colorsArray];
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation);
    CGGradientRelease(gradientRef);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (UIImage *)gradientImageWithTopColor:(UIColor *)topColor
                        andMiddleColor:(UIColor *)middleColor
                        andBottomColor:(UIColor *)bottomColor
                               andSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    CGPoint endPoint = CGPointMake(0.0, size.height);
    NSArray *colorsArray = [NSArray arrayWithObjects:topColor, middleColor, bottomColor, nil];
    CGGradientRef gradientRef = [UIImage createCGGradientWithColors:colorsArray];
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation);
    CGGradientRelease(gradientRef);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)gradientImageWithTopToBottomColorArray:(NSArray <UIColor *> *)colorsArray
                                            andSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    CGPoint endPoint = CGPointMake(0.0, size.height);
    CGGradientRef gradientRef = [UIImage createCGGradientWithColors:colorsArray];
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation);
    CGGradientRelease(gradientRef);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

// 调用者负责CGGradientRelease(返回对象)
+ (CGGradientRef)createCGGradientWithColors:(NSArray *)colorsArray {
    CGFloat colorComponents[colorsArray.count * 4];
    
    for (int i = 0; i < colorsArray.count; i++) {
        UIColor *color = [colorsArray objectAtIndex:i];
        
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        for (int j = 0; j < 4; j++) {
            colorComponents[i * 4 + j] = components[j];
        }
    }
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colorComponents, NULL, colorsArray.count);
    CGColorSpaceRelease(rgb);
    return gradient;
}

+ (UIImage*)imageWithUIView:(UIView*)view {
    CGFloat oldAlpha = view.alpha;
    BOOL oldHidden = view.hidden;
    view.alpha = 1;
    view.hidden = NO;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:currentContext];
    // 从当前context中创建一个改变大小后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    view.alpha = oldAlpha;
    view.hidden = oldHidden;
    
    return image;
}

- (UIImage *)imageRotatedByRadians:(CGFloat)radians {
    return [self imageRotatedByDegrees:radiansToDegrees(radians)];
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees {
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(degreesToRadians(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    // Rotate the image context
    CGContextRotateCTM(bitmap, degreesToRadians(degrees));
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end


