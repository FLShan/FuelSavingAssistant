//
//  HomeFlyViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "HomeFlyViewController.h"
#import "YHTFlightListTableViewCell.h"

#import "calendarViewController/YHTCalendarViewController.h"
#import "BXHCalendarView.h"
#import "NSDate+BXHCalendar.h"
#import "NSDate+BXHCategory.h"
#import "YHTBeforReportViewController.h"
#import "YHTRewardHistoryViewController.h"
#import "YHTMyDataViewController.h"
#import "MBProgressHUD+NJ.h"
#import "YHTHomeCalendarCollectionViewCell.h"
#import "YHTCalendarNavView.h"
#import "YHTFlightContentView.h"
#import "UIView+Ext.h"
#import "YHTHomeFlyModel.h"
#import "YHTflightTable.h"
#import "YHTMessageViewController.h"

#import "SIDADView.h"

@interface HomeFlyViewController ()<UITableViewDelegate,UITableViewDataSource,BXHCalendarViewDataSource,BXHCalendarViewDelegate,YHTCalendarNavViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;
@property (strong, nonatomic) IBOutlet UITableView *flightListTableView;
@property (nonatomic, strong) UISwipeGestureRecognizer * recognizer;
@property (nonatomic, strong) YHTCalendarViewController *calendarVC;

@property (strong, nonatomic) IBOutlet UIView *homeCalendarView;
@property (nonatomic, strong) BXHCalendarView *calendarView;
@property (strong, nonatomic) IBOutlet UIView *tapView;
@property (strong, nonatomic) IBOutlet UIView *footerView;

@property (nonatomic, strong) YHTCalendarNavView * taggedNavView;
@property (nonatomic, strong) UIScrollView * bgScroll;

@property (nonatomic, strong) YHTHomeFlyModel *model;


@property (nonatomic, strong) NSMutableArray *weekArr;

@end

@implementation HomeFlyViewController
+ (UINavigationController *)defaultHomeFlyNavi {
    HomeFlyViewController *vc = [[HomeFlyViewController alloc]initWithNibName:@"HomeFlyViewController" bundle:nil LeftType:navViewLeftButtonTypeNone andTitle:@"飞行" andRightType:navViewRightButtonTypeMessage];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     SIDADView *adView = [[SIDADView alloc]init];
    //当faceInfo为nil时，adView不显示。
    [adView showInView:self.tabBarController.view withFaceInfo:@{@"lively":@"活泼",@"character":@"lively",@"tags":@[@"goodLooking"],@"gender":@"man",@"generation":@"80"} advertisementImage:[UIImage imageNamed:@"adImage"] borderColor:nil];
    _weekArr = [NSMutableArray array];
   _weekArr = [self getCurrentWeeksWithFirstDiff:-3 lastDiff:3];
    NSDictionary *dic = [self readLocalFileWithName:@"homepagedata"];
    self.model = [[YHTHomeFlyModel alloc]initWithYHTHomeFlyModelDataWithDictionary:dic];
    self.navRightType = navViewRightButtonTypeShare;
    [self.navView.middleBtn setTitle:@"飞行" forState:UIControlStateNormal];
//    self.navView.backgroundColor = YHTDarkBlueColor;
    self.flightListTableView.tableHeaderView = self.tableHeaderView;
    self.flightListTableView.tableFooterView = self.footerView;

    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rewardHistoryBtnCLick:)];
    [self.tapView addGestureRecognizer:tapGesture];
//    [self setupCalendarView];
    
    [self createUI];
    
}
- (void)setupCalendarView{
    CGFloat itemWH = kWindowW / 7;
    self.calendarView = [[BXHCalendarView alloc] initWithFrame:CGRectMake(0, 64, kWindowW, itemWH + 30)];
//    self.calendarView = [[BXHCalendarView alloc] initWithFrame:CGRectMake(0, 164, kWindowW, itemWH * CalendarDayView_HW_Ration * 6 + 30)];
    [self.calendarView changeDisplayType:BXHCalendarDisplayWeekType animated:YES];
    self.calendarView.dataSource = self;
    self.calendarView.delegate = self;
    [self.homeCalendarView addSubview:self.calendarView];
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
#pragma mark clickMethod

- (IBAction)didClickMoreBtn:(UIButton *)sender {
    NSLog(@"点击进入日历页面");
    self.calendarVC = [[YHTCalendarViewController alloc]initWithLeftType:navViewLeftButtonTypeDefault andTitle:@"日历" andRightType:navViewRightButtonTypeNone];
    self.definesPresentationContext = YES;
    self.calendarVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    self.calendarVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    CYLTabBarController *tab = [self tabbarController];
    [tab presentViewController:self.calendarVC animated:YES completion:nil];
}
- (IBAction)rewardHistoryBtnCLick:(UIButton *)sender {
    YHTMyDataViewController *reportVC = [[YHTMyDataViewController alloc]initWithNibName:@"YHTMyDataViewController" bundle:nil LeftType:navViewLeftButtonTypeWhiteBack andTitle:@"我的数据" andRightType:navViewRightButtonTypeNone];
    [reportVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:reportVC animated:YES];
}

#pragma mark delegate-datasource
#pragma mark - UITableViewDataSource
/**
 *  设置每个分区显示的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *globalPriceCellIdentifier = @"cellStr";
    YHTFlightListTableViewCell *cell = (YHTFlightListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:globalPriceCellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YHTFlightListTableViewCell" owner:self options:nil] lastObject];
    }
    cell.DidClickStateBtnBlock = ^(YHTHomeFlyModelItem* item){
        NSLog(@"代码块中进入x数据节油报告");
        if([item.zhuangtai isEqualToString:@"1"]){
            YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil];
            reportVC.isBefor = YES;
             [reportVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:reportVC animated:YES];
        }else if ([item.zhuangtai isEqualToString:@"2"]){
//            [MBProgressHUD showSuccess:@"报告正在生成中"];
            YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil];
            reportVC.isBefor = YES;
            [reportVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:reportVC animated:YES];
        }else{
            YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil];
            reportVC.isBefor = NO;
            [reportVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:reportVC animated:YES];
        }
        
        
    };
    return cell;
}


/**
 *  设置单元格的高度
 *  单元格默认高度44像素
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}
- (CYLTabBarController *)tabbarController
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    UIViewController *tabbarController = window.rootViewController;
    if ([tabbarController isKindOfClass:[CYLTabBarController class]]) {
        return (CYLTabBarController *)tabbarController;
    }
    return nil;
}


- (void)calendarView:(BXHCalendarView *)calendarView willShowMonthView:(BXHCalendarMonthView *)monthView
{
    //    self.title = [NSString stringWithFormat:@"%@",[monthView.beaginDate bxh_stringWithFormate:@"yyyy-MM"]];
}

- (void)calendarView:(BXHCalendarView *)calendarView dayViewHaveEvent:(BXHCalendarDayView *)dayView
{
    dayView.haveEvent = dayView.date.day % 3 == 0;
}

- (void)calendarView:(BXHCalendarView *)calendarView didSelectDayView:(BXHCalendarDayView *)dayView
{
    
    NSLog(@"select %@",[dayView.date bxh_stringWithFormate:@"yyyy-MM-dd"]);
}





- (void)createUI
{
    self.taggedNavView = [[YHTCalendarNavView alloc]initWithFrame:CGRectMake(0, 0, WTWidth, 60)];
    self.taggedNavView.delegate = self;
//    self.taggedNavView.dataArr = [NSArray arrayWithObjects:@"一",@"二",@"三",@"今日",@"今日",@"六",@"日", nil];
    self.taggedNavView.dataArr = _weekArr;

    self.taggedNavView.tagTextColor_normal = [UIColor lightGrayColor];
    self.taggedNavView.tagTextColor_selected = [UIColor whiteColor];
    self.taggedNavView.tagTextFont_normal = 13;
    self.taggedNavView.tagTextFont_selected = 13;
    self.taggedNavView.sliderColor = YHTGreenColor;
//     self.taggedNavView.sliderColor = [UIColor colorWithRed:50 green:199 blue:141 alpha:1];
    
    self.taggedNavView.sliderW = 30;
    self.taggedNavView.sliderH = 0;
    self.taggedNavView.backgroundColor = [UIColor whiteColor];
    [self.footerView addSubview:self.taggedNavView];
    
    self.bgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.taggedNavView.bottomY, WTWidth, 400)];
    self.bgScroll.contentSize = CGSizeMake(WTWidth*7, 0);
    self.bgScroll.contentOffset = CGPointMake(WTWidth*3, 0);
    self.bgScroll.delegate = self;
    self.bgScroll.pagingEnabled = YES;
    [self.footerView addSubview:self.bgScroll];
    
    NSArray * labelContentArr = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"日", nil];
    for (int i = 0; i<labelContentArr.count; i++) {
        YHTflightTable *view = [[YHTflightTable alloc]initWithFrame:CGRectMake(kWindowW*i, 0, kWindowW, 480) style:UITableViewStylePlain];
        view.scrollEnabled = NO;
                YHTHomeFlyFlightsModel *model = self.model.flightDayItems[i];
        [view freshYHTflightTableViewDataWithArray:model];
        view.DidClickStateBtnBlock = ^(YHTHomeFlyModelItem* item){
            NSLog(@"代码块中进入x数据节油报告");
            if([item.zhuangtai isEqualToString:@"1"]){
                YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil LeftType:navViewLeftButtonTypeDefault andTitle:[NSString stringWithFormat:@"%@-%@",item.qifeijichang4,item.jiangluojichang4] andRightType:navViewRightButtonTypeNone];
                reportVC.isBefor = YES;
                reportVC.model = item;
                [reportVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:reportVC animated:YES];
            }else if ([item.zhuangtai isEqualToString:@"2"]){
                            [MBProgressHUD showSuccess:@"报告正在生成中"];
//                YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil LeftType:navViewLeftButtonTypeDefault andTitle:[NSString stringWithFormat:@"%@-%@",item.qifeijichang4,item.jiangluojichang4] andRightType:navViewRightButtonTypeNone];
//                reportVC.isBefor = YES;
//                reportVC.model = item;
//                [reportVC setHidesBottomBarWhenPushed:YES];
//                [self.navigationController pushViewController:reportVC animated:YES];
            }else{
                YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil LeftType:navViewLeftButtonTypeDefault andTitle:[NSString stringWithFormat:@"%@-%@",item.qifeijichang4,item.jiangluojichang4] andRightType:navViewRightButtonTypeNone];
                reportVC.isBefor = NO;
                reportVC.model = item;
                [reportVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:reportVC animated:YES];
            }
            
            
        };
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
    if (scrollView == self.bgScroll) {
        NSInteger selectedIndx = scrollView.contentOffset.x/WTWidth;
        [self.taggedNavView selectingOneTagWithIndex:selectedIndx];
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

//获取一周时间 数组
- (NSMutableArray *)getCurrentWeeksWithFirstDiff:(NSInteger)first lastDiff:(NSInteger)last{
    NSMutableArray *eightArr = [[NSMutableArray alloc] init];
    for (NSInteger i = first; i < last + 1; i ++) {
        //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"d"];
        NSString *dateStr = [dateFormatter stringFromDate:curDate];//几月几号
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        //组合时间
        if ([weekStr isEqualToString:@"Friday"]) {
            if (i == 0) {
                weekStr = @"今日";
            }else {weekStr = @"五";}
        }else if ([weekStr isEqualToString:@"Saturday"]) {
            if (i == 0) {
                weekStr = @"今日";
            }else {weekStr = @"六";}
        }
        else if ([weekStr isEqualToString:@"Sunday"]) {
            if (i == 0) {
                weekStr = @"今日";
            }else {weekStr = @"日";}
        }
        else if ([weekStr isEqualToString:@"Monday"]) {
            if (i == 0) {
                weekStr = @"今日";
            }else {weekStr = @"一";}
        }
        else if ([weekStr isEqualToString:@"Tuesday"]) {
            if (i == 0) {
                weekStr = @"今日";
            }else {weekStr = @"二";}
        }
        else if ([weekStr isEqualToString:@"Wednesday"]){
            if (i == 0) {
                weekStr = @"今日";
            }else {weekStr = @"三";}
        }
        else if ([weekStr isEqualToString:@"Thursday"]) {
            if (i == 0) {
                weekStr = @"今日";
            }else {weekStr = @"四";}
        }
        NSString *strTime = [NSString stringWithFormat:@"%@ %@",dateStr,weekStr];
        [eightArr addObject:strTime];
    }
    return eightArr;
}

-(void)navRightButtonClicked:(id)sender
{
    NSLog(@"进入消息页面");
    YHTMessageViewController *reportVC = [[YHTMessageViewController alloc]initWithNibName:@"YHTMessageViewController" bundle:nil LeftType:navViewLeftButtonTypeDefault andTitle:@"我的消息" andRightType:navViewRightButtonTypeNone];
    [reportVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:reportVC animated:YES];
}
@end
