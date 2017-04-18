//
//  UILabel+Size.h
//  QQing
//
//  Created by 郭晓倩 on 15/9/16.
//
//

#import <Foundation/Foundation.h>

@interface UILabel (Size)

-(CGFloat)heightWithLimitWidth:(CGFloat)width;

-(CGSize)sizeWithLimitWidth:(CGFloat)width;

-(int)lineNumWithLimitWidth:(CGFloat)width;

-(void)ajustHeightWithLimitWidth:(CGFloat)width;

-(void)ajustSizeWithLimitWidth:(CGFloat)width;


@end
