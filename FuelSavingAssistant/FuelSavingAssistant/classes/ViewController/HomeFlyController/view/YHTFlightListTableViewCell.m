//
//  YHTFlightListTableViewCell.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/18.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "YHTFlightListTableViewCell.h"
@interface YHTFlightListTableViewCell()
@property (strong, nonatomic) IBOutlet UIButton *stateBtn;
@property (strong, nonatomic) IBOutlet UILabel *departTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *arriveTimeLabel;

@end
@implementation YHTFlightListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.stateBtn.backgroundColor = YHTGreenColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didClickStateBtn:(UIButton *)sender {
    NSLog(@"进入节油报告页面");
    if (_DidClickStateBtnBlock) {
        _DidClickStateBtnBlock();
    }
}

-(void)drawRect:(CGRect)rect{
    self.backgroundColor = [UIColor lightGrayColor];
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
    CGContextMoveToPoint(context, CGRectGetMaxX(self.departTimeLabel.frame) + 5, CGRectGetMidY(self.departTimeLabel.frame));
    //设置下一个坐标点
    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 5, CGRectGetMidY(self.departTimeLabel.frame));
    //设置下一个坐标点
    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 10, CGRectGetMidY(self.departTimeLabel.frame) - 5);
    //连接上面定义的坐标点，也就是开始绘图
    CGContextStrokePath(context);
}
@end
