//
//  YHTFlightContentView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/27.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTFlightContentView.h"
#import "YHTFLightItemView.h"

@interface YHTFlightContentView ()
@property (nonatomic, strong) YHTFLightItemView *item;
@end
@implementation YHTFlightContentView
+(instancetype)initWithXib:(CGRect)frame{
    YHTFlightContentView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    view.frame = frame;
    [view awakeFromNib];
    return view;
}
//1、正在准备初始化 -- loadNibName 之后会调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        YHTFLightItemView *viewa = [YHTFLightItemView initWithXib:CGRectMake(0, 0, kWindowW, 100)];
//
//        [self addSubview:viewa];

       
    }
    return self;
}
//2、初始化完毕`（若想初始化时做点事情，最好在这个方法里面实现）`
-(void)awakeFromNib{
    [super awakeFromNib];

    for (int index = 0; index < self.model.flightItems.count; index++) {
        YHTFLightItemView *viewa = [YHTFLightItemView initWithXib:CGRectMake(0, 100 * index + 10, kWindowW, 100)];
        
        [self addSubview:viewa];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
