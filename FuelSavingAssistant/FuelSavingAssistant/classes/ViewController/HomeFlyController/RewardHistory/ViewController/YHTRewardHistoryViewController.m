//
//  YHTRewardHistoryViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/24.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTRewardHistoryViewController.h"
#import "UIView+Ext.h"
#import "RPTaggedNavView.h"
#import "YHTDateChartView.h"





@interface YHTRewardHistoryViewController ()<RPTaggedNavViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) RPTaggedNavView * taggedNavView;
@property (nonatomic, strong) UIScrollView * bgScroll;
@end

@implementation YHTRewardHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navView.backgroundColor = YHTDarkBlueColor;
    self.view.backgroundColor = YHTDarkBlueColor;
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
- (void)createUI
{
    self.taggedNavView = [[RPTaggedNavView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, WTWidth, 44)];
    self.taggedNavView.delegate = self;
    self.taggedNavView.dataArr = [NSArray arrayWithObjects:@"日",@"周",@"月",@"总", nil];
    self.taggedNavView.tagTextColor_normal = [UIColor lightGrayColor];
    self.taggedNavView.tagTextColor_selected = [UIColor whiteColor];
    self.taggedNavView.tagTextFont_normal = 15;
    self.taggedNavView.tagTextFont_selected = 15;
    self.taggedNavView.sliderColor = [UIColor whiteColor];
    self.taggedNavView.sliderW = 30;
    self.taggedNavView.sliderH = 1;
    self.taggedNavView.backgroundColor = YHTDarkBlueColor;
    [self.view addSubview:self.taggedNavView];
    
    self.bgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.taggedNavView.bottomY, WTWidth, WTHeight-self.taggedNavView.bottomY)];
    self.bgScroll.contentSize = CGSizeMake(WTWidth*4, 0);
    self.bgScroll.delegate = self;
    self.bgScroll.pagingEnabled = YES;
    [self.view addSubview:self.bgScroll];
    
    NSArray * labelContentArr = [NSArray arrayWithObjects:@"人生到处知何似，恰似飞鸿踏雪泥；",@"泥上偶然留指爪，鸿飞那复计东西。",@"老僧已死成新塔，坏壁无由见旧题；",@"人生到处知何似，恰似飞鸿踏雪泥；",@"往日崎岖还记否，路长人困蹇驴嘶。", nil];
    for (int i = 0; i<labelContentArr.count; i++) {
        YHTDateChartView *view = [YHTDateChartView initWithXib:CGRectMake(kWindowW*i, 0, kWindowW, self.bgScroll.height)];
       
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
