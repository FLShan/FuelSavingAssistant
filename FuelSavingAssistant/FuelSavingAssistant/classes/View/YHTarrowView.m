//
//  YHTarrowView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/2/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTarrowView.h"

@implementation YHTarrowView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setNeedsDisplay];
//    self.backgroundColor = [UIColor redColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    self.backgroundColor = [UIColor whiteColor];
//    //获得处理的上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //设置线的颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
//    CGContextMoveToPoint(context, 0, CGRectGetMidX(self.frame));
//    //设置下一个坐标点
//    CGContextAddLineToPoint(context, CGRectGetMaxX(self.frame), CGRectGetMidY(self.frame));
//    //设置下一个坐标点
//    //    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 10, CGRectGetMidY(self.departTimeLabel.frame) - 5);
//    //连接上面定义的坐标点，也就是开始绘图
//    CGContextStrokePath(context);
    
    UIColor *color = [UIColor lightGrayColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 10)];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), 10)];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame)-5, 5)];
    
    path.lineWidth = 1.0;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path stroke];
}


@end
