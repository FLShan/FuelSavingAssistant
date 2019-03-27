//
//  YHTReportlistView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/25.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTReportlistView.h"

@implementation YHTReportlistView
+(instancetype)initWithXib:(CGRect)frame{
    YHTReportlistView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    view.frame = frame;
    [view awakeFromNib];
    return view;
}
//1、正在准备初始化 -- loadNibName 之后会调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        
    }
    return self;
}
//2、初始化完毕`（若想初始化时做点事情，最好在这个方法里面实现）`
- (void)awakeFromNib {
    [super awakeFromNib];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
