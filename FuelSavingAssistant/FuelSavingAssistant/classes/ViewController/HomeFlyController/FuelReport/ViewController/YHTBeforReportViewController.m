//
//  YHTBeforReportViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/24.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTBeforReportViewController.h"

@interface YHTBeforReportViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *beforReportTableVIew;

@property (strong, nonatomic) IBOutlet UIView *beforReportHeader;
@property (strong, nonatomic) IBOutlet UIView *beforeReportFooter;
@property (strong, nonatomic) IBOutlet UIView *afterReportHeader;
@property (strong, nonatomic) IBOutlet UIView *afterReportFooter;


@end

@implementation YHTBeforReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.beforReportTableVIew.tableHeaderView = self.afterReportHeader;
    self.beforReportTableVIew.tableFooterView = self.afterReportFooter;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**
 *  设置每个分区显示的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *globalPriceCellIdentifier = @"cellStr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:globalPriceCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:globalPriceCellIdentifier];
    }
    return cell;
}


/**
 *  设置单元格的高度
 *  单元格默认高度44像素
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}
@end
