//
//  YHTCalendarTopView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/21.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTCalendarTopView.h"
@interface YHTCalendarTopView()
@property (nonatomic, strong) UILabel *midTitleLabel;
@property (nonatomic, strong) UILabel *rightTitleLabel;
@property (nonatomic, strong) UILabel *leftTitleLabel;
@end
@implementation YHTCalendarTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor greenColor];
        [self setupView];
    }
    return self;
}
- (void)setupView{
    self.midTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kWindowW-80)/2, 0, 80, 80)];
    self.midTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.rightTitleLabel = [[UILabel alloc]init];
    self.leftTitleLabel = [[UILabel alloc]init];
    self.midTitleLabel.text = @"一月";
    self.rightTitleLabel.text = @"二月";
    self.leftTitleLabel.text = @"十二月";
    self.midTitleLabel.textColor = [UIColor blackColor];
    self.rightTitleLabel.textColor = [UIColor blackColor];
    self.leftTitleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.midTitleLabel];
    [self addSubview:self.midTitleLabel];
    [self addSubview:self.midTitleLabel];
    [self.midTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.center.y);
//        make.centerX.mas_equalTo(self.center.x);
//        make.height.mas_equalTo(self.frame.size.height);
//        make.height.mas_equalTo(40);
//        make.leading.mas_equalTo(20);
//        make.centerY.mas_equalTo(self.center.y);
        
    }];
    [self.rightTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.center.y);
//        make.height.mas_equalTo(self.frame.size.height);
//        make.leading.mas_equalTo(20);
    }];
    [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.center.y);
//        make.height.mas_equalTo(self.frame.size.height);
//        make.trailing.mas_equalTo(20);
    }];
    
}
@end
