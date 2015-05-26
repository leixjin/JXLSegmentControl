//
//  JXLSegmentControl.h
//  www.xiaolei0808.com
//  Created by 金小白 on 15/5/26.
//  Copyright (c) 2015年 金小白. All rights reserved.
//

#import <UIKit/UIKit.h>

//struct SegmentSize {
//    CGFloat width;
//    CGFloat height;
//};
//typedef struct SegmentSize SegmentSize;
//
//CG_INLINE SegmentSize
//SegmentSizeMake(CGFloat width, CGFloat height){
//    SegmentSize size; size.width = width; size.height = height; return size;
//}

typedef void(^SegmentChanged)(NSInteger index);

@interface JXLSegmentControl : UIView
/**
 *  初始化方法
 *
 *  @param titles 标题数组，根据标题的个数确定按钮的个数
 *  @param size   选择器的整体尺寸
 *
 *  @return 返回创建完成的对象
 */
- (instancetype)initWithTitles:(NSArray *)titles size:(CGSize)size;
- (instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame;
/**
 *  选项卡选择的回调方法
 *
 *  @param index 选择的按钮
 */
- (void)segmentChangedWithIndex:(SegmentChanged)index;
@property (nonatomic, copy) SegmentChanged segmentChanged;
/**
 *  滑块动画时长(默认是0.2)
 */
@property (nonatomic, assign) CGFloat animateDuration;
/**
 *  滑块高度(默认是3)
 */
@property (nonatomic, assign) CGFloat sliderHeight;
/**
 *  竖直分割线宽度(默认0.1)
 */
@property (nonatomic, assign) CGFloat verticalLineWidth;
/**
 *  底部线条宽度(默认0.5)
 */
@property (nonatomic, assign) CGFloat bottomLineHeight;
/**
 *  分割线的颜色(默认灰色)
 */
@property (nonatomic, strong) UIColor *lineColor;
/**
 *  滑块颜色(默认天蓝色)
 */
@property (nonatomic, strong) UIColor *sliderColor;
/**
 *  正常标题颜色(默认黑色)
 */
@property (nonatomic, strong) UIColor *titleNormalColor;
/**
 *  高亮标题颜色(默认天蓝色)
 */
@property (nonatomic, strong) UIColor *titleHighlightedColor;
/**
 *  选中标题颜色(默认天蓝色)
 */
@property (nonatomic, strong) UIColor *titleSelectedColor;
/**
 *  标题字体(默认15号系统字体)
 */
@property (nonatomic, strong) UIFont *titleFont;
@end