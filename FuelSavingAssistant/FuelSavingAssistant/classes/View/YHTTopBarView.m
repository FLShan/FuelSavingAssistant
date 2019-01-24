//
//  YHTTopBarView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/18.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "YHTTopBarView.h"
@interface YHTTopBarView()
@property (nonatomic, strong) UIImageView *functionIcon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *rightBtn;
@end
@implementation YHTTopBarView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        // 1. 创建图标
        UIImageView *icon = [UIImageView new];
        self.functionIcon = icon;
        self.functionIcon.image = [UIImage imageNamed:@"navigationbar_messages_btn_black"];
        [self addSubview:self.functionIcon];
        
        // 2.标题
        UILabel *title = [UILabel new];
        title.textAlignment = NSTextAlignmentCenter;
        self.titleLabel = title;
        self.titleLabel.text = @"飞行任务";
        [self addSubview:self.titleLabel];
        // 3. create button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn = btn;
        [self.rightBtn addTarget:self action:@selector(didClickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightBtn];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = self.frame.size;
    self.functionIcon.frame = CGRectMake(10, 12, 40 , 40);
    self.titleLabel.frame = CGRectMake(60, 12, 40 , 150);
    self.rightBtn.frame = CGRectMake(size.width-80, 12, 80, 40);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)didClickRightBtn:(UIButton*)UIButton{
    NSLog(@"点击了更多按钮");
}
@end
