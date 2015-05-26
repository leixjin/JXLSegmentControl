//
//  JXLSegmentControl.m
//  www.xiaolei0808.com
//  Created by 金小白 on 15/5/26.
//  Copyright (c) 2015年 金小白. All rights reserved.
//  金小白分段选择按钮
//
//                                  _oo8oo_
//                                 o8888888o
//                                 88" . "88
//                                 (| -_- |)
//                                 0\  =  /0
//                               ___/'==='\___
//                             .' \\|     |// '.
//                            / \\|||  :  |||// \
//                           / _||||| -:- |||||_ \
//                          |   | \\\  -  /// |   |
//                          | \_|  ''\---/''  |_/ |
//                          \  .-\__  '-'  __/-.  /
//                        ___'. .'  /--.--\  '. .'___
//                     ."" '<  '.___\_<|>_/___.'  >' "".
//                    | | :  `- \`.:`\ _ /`:.`/ -`  : | |
//                    \  \ `-.   \_ __\ /__ _/   .-` /  /
//                =====`-.____`.___ \_____/ ___.`____.-`=====
//                                  `=---=`
//
//
//               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//                          佛祖保佑         永无bug

#ifdef DEBUG
#define JXLOUT(...) NSLog(__VA_ARGS__)
#else
#define JXLOUT()
#endif

#define skyBlueColor [UIColor colorWithRed:0/255.0f green:178/255.0f blue:238/255.0f alpha:1.0]
#define tagBase 1000
#import "JXLSegmentControl.h"

@implementation JXLSegmentControl
{
    NSInteger btnCount;
    UIButton *selectedBtn;
    UIView *lineView;
}
- (instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame{
    self = [super init];
    self.frame = frame;
    self.backgroundColor = [UIColor whiteColor];
    
    if (titles.count <= 0 || titles == nil) {
        JXLOUT(@"传入数组===>>>不能为空");
        return nil;
    }else{
        btnCount = titles.count;
        for (int i = 0; i < btnCount; i++) {
            UIButton *button = [[UIButton alloc]init];
            button.tag = tagBase + i;
            [button setTitle:titles[i] forState:UIControlStateNormal];
            CGFloat buttonX = i * (frame.size.width / btnCount);
            button.frame = CGRectMake(buttonX, 0, frame.size.width / btnCount, frame.size.height);
            [self addSubview:button];
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if ( i == 0 ) {//默认选中第一个
                button.selected = YES;
                selectedBtn = button;
            }
        }
        lineView = [[UIView alloc]init];
        lineView.backgroundColor = self.sliderColor == nil ? skyBlueColor : self.sliderColor;
        [self addSubview:lineView];
        
        return self;
    }
}
- (instancetype)initWithTitles:(NSArray *)titles size:(CGSize)size{
    return [self initWithTitles:titles frame:CGRectMake(0, 0, size.width, size.height)];
}
- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //底部分割线
    CGContextSetStrokeColorWithColor(context, (self.lineColor == nil ? [UIColor grayColor] : self.lineColor).CGColor);
    CGFloat verticalLineWidth = self.bottomLineHeight == 0 ? 0.5 : self.bottomLineHeight;
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height - verticalLineWidth, rect.size.width, verticalLineWidth));
    //竖直分割线
    for (int i = 1; i < btnCount; i++) {
        CGFloat lineX = i * (rect.size.width / btnCount);
        CGContextStrokeRect(context, CGRectMake(lineX, 0, self.verticalLineWidth == 0 ? 0.1 : self.verticalLineWidth, rect.size.height));
    }
    
    CGFloat lineHeight = self.sliderHeight == 0 ? 3 : self.sliderHeight;
    lineView.frame = CGRectMake(0, rect.size.height - lineHeight, rect.size.width / btnCount, lineHeight);
    
    for (UIButton *button in self.subviews) {
        if (button.class == [UIButton class]) {
            [button setTitleColor:self.titleNormalColor == nil ? [UIColor blackColor] : self.titleNormalColor forState:UIControlStateNormal];
            [button setTitleColor:self.titleSelectedColor == nil ? skyBlueColor : self.titleSelectedColor forState:UIControlStateSelected];
            [button setTitleColor:self.titleHighlightedColor == nil ? skyBlueColor : self.titleHighlightedColor forState:UIControlStateHighlighted];
            button.titleLabel.font = self.titleFont == nil ? [UIFont systemFontOfSize:15] : self.titleFont;
        }
    }
}
- (void)btnClick:(UIButton *)btn{
    selectedBtn.selected = NO;
    btn.selected = YES;
    selectedBtn = btn;
    
    [UIView animateWithDuration:self.animateDuration == 0 ? 0.2 : self.animateDuration animations:^{
        lineView.frame = CGRectMake(btn.frame.origin.x, lineView.frame.origin.y, lineView.frame.size.width, self.sliderHeight == 0 ? 3 : self.sliderHeight);
    }];
    
    if (self.segmentChanged) {
        self.segmentChanged(btn.tag - tagBase);
    }
}
- (void)segmentChangedWithIndex:(SegmentChanged)index{
    self.segmentChanged = index;
}
@end