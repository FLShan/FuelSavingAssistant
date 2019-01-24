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
//#import "YHTFuelReportViewController.h"
#import "YHTFlightMapViewController.h"
#import "YHTRewardHistoryViewController.h"



@interface HomeFlyViewController ()<UITableViewDelegate,UITableViewDataSource,BXHCalendarViewDataSource,BXHCalendarViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;
@property (strong, nonatomic) IBOutlet UITableView *flightListTableView;
@property (nonatomic, strong) UISwipeGestureRecognizer * recognizer;
@property (nonatomic, strong) YHTCalendarViewController *calendarVC;

@property (strong, nonatomic) IBOutlet UIView *homeCalendarView;
@property (nonatomic, strong) BXHCalendarView *calendarView;
@end

@implementation HomeFlyViewController
+ (UINavigationController *)defaultHomeFlyNavi {
    HomeFlyViewController *vc = [HomeFlyViewController new];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navRightType = navViewRightButtonTypeShare;
    self.flightListTableView.tableHeaderView = self.tableHeaderView;
    [self setupCalendarView];
    
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
    self.calendarVC = [[YHTCalendarViewController alloc]init];
    self.definesPresentationContext = YES;
    self.calendarVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    self.calendarVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    CYLTabBarController *tab = [self tabbarController];
    [tab presentViewController:self.calendarVC animated:YES completion:nil];
}

#pragma mark delegate-datasource
#pragma mark - UITableViewDataSource
/**
 *  设置每个分区显示的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *globalPriceCellIdentifier = @"cellStr";
    YHTFlightListTableViewCell *cell = (YHTFlightListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:globalPriceCellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YHTFlightListTableViewCell" owner:self options:nil] lastObject];
    }
    cell.DidClickStateBtnBlock = ^(){
        NSLog(@"代码块中进入x数据节油报告");
        YHTRewardHistoryViewController *reportVC = [[YHTRewardHistoryViewController alloc]initWithNibName:@"YHTRewardHistoryViewController" bundle:nil];
        [self.navigationController pushViewController:reportVC animated:YES];
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
@end
