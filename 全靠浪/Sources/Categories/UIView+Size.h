//
//  UIView+Size.h
//  QQingCommon
//
//  Created by 郭晓倩 on 16/9/5.
//  Copyright © 2016年 QQingiOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Size)

-(CGFloat)heightByAutoLayoutWithWidth:(CGFloat)width;

-(void)adjustSizeByAutoLayoutWithWidth:(CGFloat)width;

@end
