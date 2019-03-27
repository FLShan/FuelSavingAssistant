//
//  YHTFLightItemView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/27.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTFLightItemView.h"

@interface YHTFLightItemView ()
@property (nonatomic, assign) NSInteger Intger;
@property (strong, nonatomic) IBOutlet UIButton *stateBtn;
@property (nonatomic, strong) IBOutlet UILabel *flightNo;
@property (nonatomic, strong) IBOutlet UILabel *airCraNo;
@property (nonatomic, strong) IBOutlet UILabel *airtype;
@property (nonatomic, strong) IBOutlet UILabel *departTime;
@property (nonatomic, strong) IBOutlet UILabel *arriveTime;
@property (nonatomic, strong) IBOutlet UILabel *departAirport;
@property (nonatomic, strong) IBOutlet UILabel *arriveAirport;
@property (nonatomic, strong) NSDictionary *dic;

@end

@implementation YHTFLightItemView
+(instancetype)initWithXib:(CGRect)frame{
    YHTFLightItemView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
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
    self.stateBtn.backgroundColor = YHTGreenColor;
    //    int value = (arc4random() % 3) + 1;
    self.Intger = (arc4random() % 3) + 1;
    if(self.Intger == 1){
        [self.stateBtn setTitle:@"即将起飞" forState:UIControlStateNormal];
        [self.stateBtn setBackgroundColor:YHTGreenColor];
    }else if (self.Intger == 2){
        [self.stateBtn setTitle:@"报告生成中" forState:UIControlStateNormal];
        [self.stateBtn setBackgroundColor:[UIColor lightGrayColor]];
    }else{
        [self.stateBtn setTitle:@"报告已生成" forState:UIControlStateNormal];
        [self.stateBtn setBackgroundColor:YHTPurpleColor];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect{
//    self.backgroundColor = [UIColor lightGrayColor];
//    //获得处理的上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //设置线的颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
//    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
//    CGContextMoveToPoint(context, CGRectGetMaxX(self.departTimeLabel.frame) + 5, CGRectGetMidY(self.departTimeLabel.frame));
//    //设置下一个坐标点
//    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 5, CGRectGetMidY(self.departTimeLabel.frame));
//    //设置下一个坐标点
//    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 10, CGRectGetMidY(self.departTimeLabel.frame) - 5);
//    //连接上面定义的坐标点，也就是开始绘图
//    CGContextStrokePath(context);
}
@end
