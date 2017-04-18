//
//  UIButton+Theme.m
//  QQing
//
//  Created by Ben on 5/5/16.
//
//

#import "UIButton+Theme.h"

@implementation UIButton (Theme)

#pragma mark - 色块风格

- (void)thematized {
    [self setNormalBackgroundColor:[UIColor stGreenColor]
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor whiteColor]];
    
    [self circularCorner];
}

- (void)thematizedWithColor:(UIColor *)color {
    self.backgroundColor = color;
    
    [self setNormalBackgroundColor:color
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor whiteColor]];
    
    [self circularCorner];
}

#pragma mark - 线条风格

- (void)liningThematized:(UIColor *)color {
    [self setBorderWidth:1.f withColor:color];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTitleColor:color];
    
    [self circularCorner];
}

- (void)liningThematizedWithTextColor:(UIColor *)color borderColor:(UIColor *)bordercolor {
    [self setBorderWidth:1.f withColor:bordercolor];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTitleColor:color];
    [self circularCorner];
}

- (void)liningThematizedWithTextColor:(UIColor *)color borderColor:(UIColor *)bordercolor backgroundColor:(UIColor *)backgroundColor {
    [self setBorderWidth:1.f withColor:bordercolor];
    [self setBackgroundColor:backgroundColor];
    [self setTitleColor:color];
    [self circularCorner];
}

- (void)liningThematizedWithoutMask:(UIColor *)color {
    [self setBorderWidth:1.f withColor:color];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTitleColor:color];
    
    [self circularCornerWithoutMask];
}

- (void)liningThematizedWithoutMaskWithTextColor:(UIColor *)color borderColor:(UIColor *)bordercolor {
    [self setBorderWidth:1.f withColor:bordercolor];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTitleColor:color];
    [self circularCornerWithoutMask];
}

#pragma mark - 标题颜色

- (void)setTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateSelected];
}

#pragma mark - 背景图片

- (void)setNormalBackgroundColor:(UIColor *)color disableBackgroundColor:(UIColor *)color2 {
    [self setBackgroundImage:[UIImage imageWithColor:color] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:color2] forState:UIControlStateDisabled];
}

- (void)setNormalBackgroundColor:(UIColor *)color
      highlightedBackgroundColor:(UIColor *)color2
          disableBackgroundColor:(UIColor *)color3 {
    [self setBackgroundImage:[UIImage imageWithColor:color] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:color2] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage imageWithColor:color3] forState:UIControlStateDisabled];
}

#pragma mark - 家长端工具方法 (根据规范文档实现)

- (void)stSolidGreenThematized {
    [self setBackgroundColor:[UIColor stGreenColor]];

    [self setNormalBackgroundColor:[UIColor stGreenColor]
        highlightedBackgroundColor:[UIColor stHighlightedGreenColor]
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor whiteColor]];
    
    [self circularCorner];
}

- (void)stSolidOrangeThematized {
    [self setBackgroundColor:[UIColor stOrangeColor]];

    [self setNormalBackgroundColor:[UIColor stOrangeColor]
        highlightedBackgroundColor:[UIColor stHighlightedOrangeColor]
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor whiteColor]];
    
    [self circularCorner];
}

- (void)stSolidYellowThematized {
    [self setBackgroundColor:[UIColor stYellowColor]];
    
    [self setNormalBackgroundColor:[UIColor stYellowColor]
        highlightedBackgroundColor:[UIColor stYellowColor]
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor whiteColor]];
    
    [self circularCorner];
}

- (void)stSolidGrayThematized {
    [self setBackgroundColor:RGB(224, 224, 224)];

    [self setNormalBackgroundColor:RGB(224, 224, 224)
        highlightedBackgroundColor:RGB(192, 192, 192)
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor gray006Color]];
    
    [self circularCorner];
}

- (void)stBorderGreenThematized {
    [self setBorderWidth:1.f withColor:[UIColor stGreenColor]];
    
    [self setTitleColor:[UIColor stGreenColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor gray006Color] forState:UIControlStateDisabled];
    
    @weakify(self);
    [[[RACSignal combineLatest:@[RACObserve(self, enabled), RACObserve(self, highlighted)]] onMainThread] subscribeNext:^(id x) {
        @strongify(self);
        if (!self.enabled) {
            self.backgroundColor = [UIColor buttonDisableStateColor];
            [self setBorderWidth:1.f withColor:[UIColor clearColor]];
        } else if (self.highlighted) {
            self.backgroundColor = [UIColor stGreenColor] ;
            [self setBorderWidth:1.f withColor:[UIColor stGreenColor]];
        } else {
            self.backgroundColor = [UIColor clearColor];
            [self setBorderWidth:1.f withColor:[UIColor stGreenColor]];
        }
    }];
    
    [self circularCorner];
}

- (void)stBorderOrangeThematized {
    [self setBorderWidth:1.f withColor:[UIColor stOrangeColor]];
    
    [self setTitleColor:[UIColor stOrangeColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    @weakify(self);
    [[RACObserve(self, highlighted) onMainThread]subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.backgroundColor = x.boolValue ? [UIColor stOrangeColor] : [UIColor clearColor];
    }];
    
    [self circularCorner];
}

- (void)stBorderOrangeV2Thematized {
    [self setTitleColor:[UIColor gray006Color] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor stOrangeColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor stOrangeColor] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor buttonDisableStateColor] forState:UIControlStateDisabled];
    
    @weakify(self);
    [[[RACSignal combineLatest:@[RACObserve(self, enabled), RACObserve(self, selected), RACObserve(self, highlighted)]] onMainThread] subscribeNext:^(id x) {
        @strongify(self);
        if (!self.enabled) {
            self.backgroundColor = [UIColor bgGray000Color];
            [self setBorderWidth:0.f withColor:[UIColor clearColor]];
        } else if (self.highlighted) {
            self.backgroundColor = RGB(254, 244, 229);
            [self setBorderWidth:1.f withColor:[UIColor stOrangeColor]];
        } else if (self.selected) {
            self.backgroundColor = RGB(254, 244, 229);
            [self setBorderWidth:1.f withColor:[UIColor stOrangeColor]];
        } else {
            self.backgroundColor = [UIColor whiteColor];
            [self setBorderWidth:1.f withColor:RGB(223, 223, 223)];
        }
    }];
    
    [self circularWithoutMask:5.0f];
}

- (void)stBorderGrayThematized {
    [self setTitleColor:[UIColor gray005Color] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    @weakify(self);
    [[RACObserve(self, highlighted) onMainThread] subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.backgroundColor = x.boolValue ? [UIColor stOrangeColor] : [UIColor clearColor];
        [self setBorderWidth:1.f withColor:(x.boolValue ? [UIColor stOrangeColor] : [UIColor gray004Color])];
    }];
    
    [self circularCorner];
}

// 老师端工具方法 (根据规范文档实现)

- (void)teSolidBlueThematized {
    [self setBackgroundColor:[UIColor teBlueColor]];
    
    [self setNormalBackgroundColor:[UIColor teBlueColor]
        highlightedBackgroundColor:[UIColor teHighlightedBlueColor]
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor whiteColor]];
    
    [self circularCorner];
}

- (void)teSolidOrangeThematized {
    [self setBackgroundColor:[UIColor teOrangeColor]];
    
    [self setNormalBackgroundColor:[UIColor teOrangeColor]
        highlightedBackgroundColor:[UIColor teHighlightedOrangeColor]
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor whiteColor]];
    
    [self circularCorner];
}

- (void)teSolidGrayThematized {
    [self setBackgroundColor:RGB(224, 224, 224)];
    
    [self setNormalBackgroundColor:RGB(224, 224, 224)
        highlightedBackgroundColor:RGB(218, 218, 218)
            disableBackgroundColor:[UIColor buttonDisableStateColor]];
    
    [self setTitleColor:[UIColor gray006Color]];
    
    [self circularCorner];
}

- (void)teBorderBlueThematized {
    [self setBorderWidth:1.f withColor:[UIColor teBlueColor]];
    
    [self setTitleColor:[UIColor teBlueColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    @weakify(self);
    [[RACObserve(self, highlighted) onMainThread] subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.backgroundColor = x.boolValue ? [UIColor teBlueColor] : [UIColor clearColor];
    }];
    
    
    [self circularCorner];
}

- (void)teBorderOrangeThematized {
    [self setBorderWidth:1.f withColor:[UIColor teOrangeColor]];
    
    [self setTitleColor:[UIColor teOrangeColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    @weakify(self);
    [[RACObserve(self, highlighted) onMainThread]subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.backgroundColor = x.boolValue ? [UIColor teOrangeColor] : [UIColor clearColor];
    }];
    
    [self circularCorner];
}

- (void)teBorderGrayThematized {
    [self setTitleColor:[UIColor gray005Color] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    @weakify(self);
    [[RACObserve(self, highlighted) onMainThread] subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.backgroundColor = x.boolValue ? [UIColor teBlueColor] : [UIColor clearColor];
        [self setBorderWidth:1.f withColor:(x.boolValue ? [UIColor teBlueColor] : [UIColor gray004Color])];
    }];
    
    [self circularCorner];
}

- (void)taBrownBlueThematized {
    [self setBorderWidth:1.f withColor:[UIColor taBrownColor]];
    
    [self setTitleColor:[UIColor taBrownColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    @weakify(self);
    [[RACObserve(self, highlighted) onMainThread] subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.backgroundColor = x.boolValue ? [UIColor taBrownColor] : [UIColor clearColor];
    }];
    
    
    [self circularCorner];
}

@end


