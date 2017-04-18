//
//  UILabel+Size.m
//  QQing
//
//  Created by 郭晓倩 on 15/9/16.
//
//

#import "UILabel+Size.h"

@implementation UILabel (Size)


-(CGFloat)heightWithLimitWidth:(CGFloat)width{
    return ceil([self sizeWithLimitWidth:width].height);
}

-(CGSize)sizeWithLimitWidth:(CGFloat)width{
    return [self.text textSizeWithFont:self.font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
}

-(int)lineNumWithLimitWidth:(CGFloat)width{
    int lineNum = [self.text textLineNumWithFont:self.font constrainedToSize:CGSizeMake(width, MAXFLOAT)];
    return lineNum;
}

-(void)ajustHeightWithLimitWidth:(CGFloat)width{
    self.height = [self heightWithLimitWidth:width];
}

-(void)ajustSizeWithLimitWidth:(CGFloat)width{
    self.size = [self sizeWithLimitWidth:width];
}

@end
