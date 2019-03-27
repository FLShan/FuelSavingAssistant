//
//  YHTFlightListTableViewCell.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/18.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "YHTFlightListTableViewCell.h"
@interface YHTFlightListTableViewCell()
{
    NSInteger index;
}
@property (strong, nonatomic) IBOutlet UIButton *stateBtn;
@property (strong, nonatomic) IBOutlet UILabel *departTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *arriveTimeLabel;

@property (nonatomic,assign) NSInteger Intger;
@property (strong, nonatomic) IBOutlet UILabel *flghtNoLabel;
@property (strong, nonatomic) IBOutlet UILabel *jihaolabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *depar4code;
@property (strong, nonatomic) IBOutlet UILabel *arrive4code;
@property (nonatomic, strong) YHTHomeFlyModelItem *model;

@end
@implementation YHTFlightListTableViewCell


- (void)freshFlightListCellWith:(YHTHomeFlyModelItem *)item{
    [self setNeedsDisplay];
    _model = item;
    if([item.zhuangtai isEqualToString:@"1"]){
        [self.stateBtn setTitle:@"即将起飞" forState:UIControlStateNormal];
        [self.stateBtn setBackgroundColor:YHTGreenColor];
        self.departTimeLabel.text = _model.jihuaqifei;
        self.arriveTimeLabel.text = _model.jihuadaoda;
    }else if ([item.zhuangtai isEqualToString:@"2"]){
        [self.stateBtn setTitle:@"报告生成中" forState:UIControlStateNormal];
        [self.stateBtn setBackgroundColor:[UIColor lightGrayColor]];
        self.departTimeLabel.text = _model.shijiqifei;
        self.arriveTimeLabel.text = _model.shijidaoda;
    }else{
        self.departTimeLabel.text = _model.shijiqifei;
        self.arriveTimeLabel.text = _model.shijidaoda;
        [self.stateBtn setTitle:@"报告已生成" forState:UIControlStateNormal];
        [self.stateBtn setBackgroundColor:YHTPurpleColor];
    }
    self.flghtNoLabel.text = _model.hangbanhao;
    self.jihaolabel.text = _model.feijihao;
    self.typeLabel.text = _model.duanjixing;
    
    self.depar4code.text = _model.qifeijichang4;
    self.arrive4code.text = _model.jiangluojichang4;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didClickStateBtn:(UIButton *)sender {
    NSLog(@"进入节油报告页面");
    if (_DidClickStateBtnBlock) {
        _DidClickStateBtnBlock(self.model);
    }
}

-(void)drawRect:(CGRect)rect{
    self.backgroundColor = [UIColor whiteColor];
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);

    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
    CGContextMoveToPoint(context, 0, 0);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame));
    
    
    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
    CGContextMoveToPoint(context, CGRectGetMaxX(self.departTimeLabel.frame) + 5, CGRectGetMidY(self.departTimeLabel.frame));
    //设置下一个坐标点
    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 5, CGRectGetMidY(self.departTimeLabel.frame));
    //设置下一个坐标点
    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 10, CGRectGetMidY(self.departTimeLabel.frame) - 5);
//    连接上面定义的坐标点，也就是开始绘图
    CGContextStrokePath(context);
}
@end
