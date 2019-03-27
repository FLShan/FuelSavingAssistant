//
//  YHTCalendarTopView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/21.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTCalendarTopView.h"

#import "NSDate+BXHCalendar.h"
#import "NSDate+BXHCategory.h"
@interface YHTCalendarTopView()
@property (nonatomic, strong) UILabel *midTitleLabel;
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
    self.midTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.midTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.midTitle = [NSString stringWithFormat:@"%@",[[NSDate date] bxh_stringWithFormate:@"yyyy-MM"]];
    self.midTitleLabel.text = self.midTitle;
    
    self.midTitleLabel.textColor = [UIColor blackColor];
    
    [self addSubview:self.midTitleLabel];
    
}
- (void)setMidTitle:(NSString *)midTitle{
    _midTitleLabel.text = midTitle;
}
@end
