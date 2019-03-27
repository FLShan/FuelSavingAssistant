//
//  YHTDateChartView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/24.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTDateChartView.h"
#import "HistogramModel.h"
// --------------------------View--------------------------
#import "DemoBMainTopView.h"
@interface YHTDateChartView()<DemoBMainTopViewDelegate>
//@property (nonatomic, strong) UIView *topView;
//@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) DemoBMainTopView *topView;
//@property (strong, nonatomic) IBOutlet DemoBMainTopView *topView;
@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UIView *upView;

/// 充当数据模型数组
@property (nonatomic, strong) NSArray *dataArray;

@end
@implementation YHTDateChartView
+(instancetype)initWithXib:(CGRect)frame{
    YHTDateChartView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    view.frame = frame;
    [view awakeFromNib];
    return view;
}

//1、正在准备初始化 -- loadNibName 之后会调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = YHTDarkBlueColor;
//        self.topView = [[DemoBMainTopView alloc]initWithFrame:CGRectMake(0, 10, kWindowW, self.frame.size.height-400)];
        
       

    }
    return self;
}
//2、初始化完毕`（若想初始化时做点事情，最好在这个方法里面实现）`
- (void)awakeFromNib {
    [super awakeFromNib];
    self.topView = [[DemoBMainTopView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW)];
    self.topView.backgroundColor = YHTDarkBlueColor;
    self.topView.delegate = self;
    [self.upView addSubview:self.topView];
    //        [self bringSubviewToFront:self.bottomView];
    
    [self refreshView];
    
}


- (void)refreshView
{
    // 1.网络请求数据
    self.dataArray = [self xxoo];
    
    // 2.找最大值
    double max = 0;
    for (HistogramModel *m in self.dataArray) {
        if (m.value > max) {
            max = m.value;
        }
    }
    
    [self.topView reloadWith:self.dataArray max:max];
}

#pragma mark - DemoBMainTopViewDelegate

- (void)topView:(DemoBMainTopView *)topView select:(NSInteger)row
{
//    HistogramModel *m = self.dataArray[row];
//    self.valueLabel.text = [NSString stringWithFormat:@"选中：%@年---值是：%ld",
//                            m.date,(long)m.value];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - 充当网络请求
- (NSArray *)xxoo
{
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:50];
    
    for (int i = 0; i < 30; i++)
    {
        // 1 - 500 之间的随机数，充当每个柱状图柱子的代表值
        
        HistogramModel *m = [HistogramModel new];
        m.value = (long)(1 + (arc4random() % 500));
        m.date = [NSString stringWithFormat:@"%ld",(long)(i)];

        [dataArray addObject:m];
    }
    
    return dataArray;
}

@end
