//
//  UIButton+Theme.h
//  QQing
//
//  Created by Ben on 5/5/16.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (Theme)

// 色块风格
- (void)thematized;
- (void)thematizedWithColor:(UIColor *)color;

// 线条风格
- (void)liningThematized:(UIColor *)color;
- (void)liningThematizedWithTextColor:(UIColor *)color borderColor:(UIColor *)bordercolor;
- (void)liningThematizedWithTextColor:(UIColor *)color borderColor:(UIColor *)bordercolor backgroundColor:(UIColor *)backgroundColor;
- (void)liningThematizedWithoutMask:(UIColor *)color;
- (void)liningThematizedWithoutMaskWithTextColor:(UIColor *)color borderColor:(UIColor *)bordercolor;

// 标题颜色（三种状态：默认态、高亮态、选中态）
- (void)setTitleColor:(UIColor *)color;

// 背景图片（使用单色image实现）
- (void)setNormalBackgroundColor:(UIColor *)color
          disableBackgroundColor:(UIColor *)color2;

- (void)setNormalBackgroundColor:(UIColor *)color
      highlightedBackgroundColor:(UIColor *)color2
          disableBackgroundColor:(UIColor *)color3;

// 家长端工具方法 (根据规范文档实现)
- (void)stSolidGreenThematized;
- (void)stSolidOrangeThematized;
- (void)stSolidYellowThematized;
- (void)stSolidGrayThematized;
- (void)stBorderGreenThematized;
- (void)stBorderOrangeThematized;
- (void)stBorderOrangeV2Thematized;
- (void)stBorderGrayThematized;

// 老师端工具方法 (根据规范文档实现)
- (void)teSolidBlueThematized;
- (void)teSolidOrangeThematized;
- (void)teSolidGrayThematized;
- (void)teBorderBlueThematized;
- (void)teBorderOrangeThematized;
- (void)teBorderGrayThematized;

// 助教端工具方法
- (void)taBrownBlueThematized;

@end


