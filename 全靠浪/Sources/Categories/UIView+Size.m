//
//  UIView+Size.m
//  QQingCommon
//
//  Created by 郭晓倩 on 16/9/5.
//  Copyright © 2016年 QQingiOSTeam. All rights reserved.
//

#import "UIView+Size.h"

@implementation UIView (Size)

-(CGFloat)heightByAutoLayoutWithWidth:(CGFloat)width{
    NSMutableArray* oldFrameConstraintArray = [NSMutableArray new];
    for (NSLayoutConstraint* constraint in self.constraints) {
        if (constraint.firstItem == self && (constraint.firstAttribute == NSLayoutAttributeWidth || constraint.firstAttribute == NSLayoutAttributeHeight)) {
            [oldFrameConstraintArray addObject:constraint];
        }
    }
   
    for (NSLayoutConstraint* constraint in oldFrameConstraintArray) {
        [self removeConstraint:constraint];
    }
    
    NSLayoutConstraint *newWidthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:newWidthConstraint];
    
    
    // Auto layout engine does its math
    CGFloat height = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    
    [self removeConstraint:newWidthConstraint];
    
    for (NSLayoutConstraint* constraint in oldFrameConstraintArray) {
        [self addConstraint:constraint];
    }
    
    return height;
}

-(void)adjustSizeByAutoLayoutWithWidth:(CGFloat)width{
    CGFloat realHeight = [self heightByAutoLayoutWithWidth:width];
    self.size = CGSizeMake(width, realHeight);
    
    for (NSLayoutConstraint* constraint in self.constraints) {
        if (constraint.firstItem == self && (constraint.firstAttribute == NSLayoutAttributeWidth)) {
            constraint.constant = width;
        }
        
        if (constraint.firstItem == self && (constraint.firstAttribute == NSLayoutAttributeHeight)) {
            constraint.constant = realHeight;
        }
    }
}

@end
