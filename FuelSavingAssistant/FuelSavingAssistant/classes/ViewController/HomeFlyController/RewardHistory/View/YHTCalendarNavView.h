//
//  YHTCalendarNavView.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/26.
//  Copyright © 2019 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YHTCalendarNavViewDelegate <NSObject>
@optional
/**
 *    选择了某个选项的回调
 */
- (void)haveSelectedIndex:(NSInteger )index;

@end

@interface YHTCalendarNavView : UIView

/**
 *  数据源
 */
@property (nonatomic, strong) NSArray * dataArr;
@property (nonatomic, assign) BOOL isGreen;
/**
 *  标签文字颜色_未选中时
 */
@property (nonatomic, strong) UIColor * tagTextColor_normal;
/**
 *  标签文字颜色_选中时
 */
@property (nonatomic, strong) UIColor * tagTextColor_selected;
/**
 *  标签文字颜色_未选中时
 */
@property (nonatomic, assign)CGFloat tagTextFont_normal;
/**
 *  标签文字颜色_选中时
 */
@property (nonatomic, assign)CGFloat tagTextFont_selected;
/**
 *  滑块颜色
 */
@property (nonatomic, strong)UIColor *sliderColor;
/**
 *  滑块宽度
 */
@property (nonatomic, assign)CGFloat sliderW;
/**
 *  滑块高度
 */
@property (nonatomic, assign)CGFloat sliderH;
/**
 *  delegate
 */
@property (nonatomic, assign)id<YHTCalendarNavViewDelegate> delegate;

/**
 *  选择某一个标签
 */
- (void)selectingOneTagWithIndex:(NSInteger )index;



















@end

