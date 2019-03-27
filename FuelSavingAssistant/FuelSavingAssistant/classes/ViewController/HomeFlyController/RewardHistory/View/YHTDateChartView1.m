//
//  YHTDateChartView1.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTDateChartView1.h"
@interface YHTDateChartView1()

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *label4;

@end

@implementation YHTDateChartView1
+(instancetype)initWithXib:(CGRect)frame{
    YHTDateChartView1 *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
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
- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.label1.layer.cornerRadius = 15;
    self.label2.layer.cornerRadius = 15;

    self.label3.layer.cornerRadius = 15;

    
    self.label4.layer.cornerRadius = 15;
    self.label1.layer.masksToBounds = YES;
    self.label2.layer.masksToBounds = YES;
    self.label3.layer.masksToBounds = YES;
    self.label4.layer.masksToBounds = YES;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
