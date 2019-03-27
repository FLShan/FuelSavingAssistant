//
//  YHTSlideTableViewCell.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/25.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTSlideTableViewCell.h"
#import "UIView+Ext.h"
#import "RPTaggedNavView.h"
#import "YHTReportlistView.h"
#import "YHTOpreationTable.h"
#import "YHTOpreationModel.h"

#define HIGHT 150
#define SEGMENT (kWindowW-40)/10

@interface YHTSlideTableViewCell()  <RPTaggedNavViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) RPTaggedNavView * taggedNavView;
@property (nonatomic, strong) UIScrollView * bgScroll;
@property (nonatomic, strong) YHTOpreationModel *model;

@end
@implementation YHTSlideTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSDictionary *dic =  [self readLocalFileWithName:@"apu"];
    self.model = [[YHTOpreationModel alloc]initYHTOpreationModelWithDic:dic];
//     [self createUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)drawRect:(CGRect)rect{
    self.backgroundColor = [UIColor lightGrayColor];
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
    CGContextMoveToPoint(context, 20, HIGHT);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 20+SEGMENT*2, HIGHT);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 20+SEGMENT*3, HIGHT-SEGMENT);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 20+SEGMENT*7, HIGHT-SEGMENT);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 20+SEGMENT*8, HIGHT);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 20+SEGMENT*10, HIGHT);
    //设置下一个坐标点
//    CGContextAddLineToPoint(context, CGRectGetMinX(self.arriveTimeLabel.frame) - 10, CGRectGetMidY(self.departTimeLabel.frame) - 5);
    //连接上面定义的坐标点，也就是开始绘图
    CGContextStrokePath(context);
    
    // 绘制图片
        CGContextSaveGState(context);

    
        // 绘制图片
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"qx-01@3x" ofType:@"png"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    
    NSString *imagePath1 = [[NSBundle mainBundle] pathForResource:@"qx-02@3x" ofType:@"png"];
    UIImage *image1 = [[UIImage alloc] initWithContentsOfFile:imagePath1];
        
        CGRect rectImage = CGRectMake(20.0, HIGHT - 30, 30, 30);
         CGRect rectImage1 = CGRectMake( kWindowW - 50.0, HIGHT - 30, 30, 30);
    
        [image drawInRect:rectImage];
        [image1 drawInRect:rectImage1];
    
        
        // 恢复到初始状态
        CGContextRestoreGState(context);

}

-(void)freshYHTSlideTableViewCell:(YHTHomeFlyModelItem *)Flightmodel{
    self.Flightmodel = Flightmodel;
    [self createUI ];
}
- (void)createUI
{
    self.taggedNavView = [[RPTaggedNavView alloc]initWithFrame:CGRectMake(0, 160, WTWidth, 44)];
    self.taggedNavView.isGreen = YES;
    self.taggedNavView.delegate = self;
    self.taggedNavView.dataArr = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@",self.Flightmodel.qifeijichang4],@"起飞",@"巡航",@"降落",[NSString stringWithFormat:@"%@",self.Flightmodel.jiangluojichang4], nil];
    self.taggedNavView.tagTextColor_normal = [UIColor blackColor];
    self.taggedNavView.tagTextColor_selected = YHTGreenColor;
    self.taggedNavView.tagTextFont_normal = 15;
    self.taggedNavView.tagTextFont_selected = 15;
    self.taggedNavView.sliderColor = YHTGreenColor;
    self.taggedNavView.sliderW = 30;
    self.taggedNavView.sliderH = 1;
    self.taggedNavView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.taggedNavView];
    
    self.bgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.taggedNavView.bottomY, WTWidth, 850-self.taggedNavView.bottomY)];
    self.bgScroll.contentSize = CGSizeMake(WTWidth*5, 0);
    self.bgScroll.delegate = self;
    self.bgScroll.pagingEnabled = YES;
    [self addSubview:self.bgScroll];
    
    NSArray * labelContentArr = [NSArray arrayWithObjects:@"ZSSS",@"起飞",@"巡航",@"降落",@"ZGSG", nil];
    for (int i = 0; i<labelContentArr.count; i++) {
        YHTOpreationTable *view = [[YHTOpreationTable alloc]initWithFrame:CGRectMake(kWindowW*i, 0, kWindowW, self.bgScroll.height) style:UITableViewStylePlain];
        view.scrollEnabled = NO;
        
        NSMutableArray *arr = self.model.modelArr[i];
//        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",nil];
        BOOL isbefor = NO;
        if ([self.Flightmodel.zhuangtai isEqualToString:@"1"] || [self.Flightmodel.zhuangtai isEqualToString:@"2"]) {
            isbefor = YES;
        }
        [view freshYHTOpreationTableViewDataWithArray:arr andisBefor:isbefor];
//        view.DidClickStateBtnBlock = ^(YHTHomeFlyModelItem* item){
//            NSLog(@"代码块中进入x数据节油报告");
//            
//
//        };
        [_bgScroll addSubview:view];
    }
}

#pragma mark -- taggedNavViewDelegate
- (void)haveSelectedIndex:(NSInteger)index
{
    self.bgScroll.contentOffset = CGPointMake(WTWidth*index, 0);
}

#pragma mark -- scrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger selectedIndx = scrollView.contentOffset.x/WTWidth;
    [self.taggedNavView selectingOneTagWithIndex:selectedIndx];
}
- (IBAction)didClickMapBtn:(UIButton *)sender {
    if (_DidClickMapBtnBlock) {
        _DidClickMapBtnBlock();
    }
}
- (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
@end
