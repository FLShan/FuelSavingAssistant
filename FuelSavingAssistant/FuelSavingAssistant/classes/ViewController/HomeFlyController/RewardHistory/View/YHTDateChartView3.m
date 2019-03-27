//
//  YHTDateChartView3.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTDateChartView3.h"

@implementation YHTDateChartView3

+(instancetype)initWithXib:(CGRect)frame{
    YHTDateChartView3 *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    view.frame = frame;
    [view awakeFromNib];
    return view;
}

//1、正在准备初始化 -- loadNibName 之后会调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = YHTDarkBlueColor;
        
        
    }
    return self;
}
//2、初始化完毕`（若想初始化时做点事情，最好在这个方法里面实现）`
- (void)awakeFromNib {
    [super awakeFromNib];
    
}


@end
