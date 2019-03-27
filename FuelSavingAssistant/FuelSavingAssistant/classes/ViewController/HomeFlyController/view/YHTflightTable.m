//
//  YHTflightTable.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/27.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTflightTable.h"
#import "YHTFlightListTableViewCell.h"

@interface YHTflightTable ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *commentMeListArr;
@property (nonatomic,strong) YHTHomeFlyFlightsModel *model;


@end


@implementation YHTflightTable

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)freshYHTflightTableViewDataWithArray:(YHTHomeFlyFlightsModel *)model
{
    _model = model;
    _commentMeListArr = model.flightItems;
    [self reloadData];
}

#pragma mark - tableView delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _commentMeListArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *globalPriceCellIdentifier = @"cellStr";
    YHTFlightListTableViewCell *cell = (YHTFlightListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:globalPriceCellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YHTFlightListTableViewCell" owner:self options:nil] lastObject];
    }
    [cell setNeedsDisplay];
    YHTHomeFlyModelItem *item = _commentMeListArr[indexPath.row];
    [cell freshFlightListCellWith:item];
    __weak typeof(self) weakSelf = self;
    cell.DidClickStateBtnBlock = ^(YHTHomeFlyModelItem* item){
        NSLog(@"代码块中进入x数据节油报告");
        if (weakSelf.DidClickStateBtnBlock) {
            weakSelf.DidClickStateBtnBlock(item);
        }
//        if(intg == 1){
//            YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil];
//            reportVC.isBefor = YES;
//            [reportVC setHidesBottomBarWhenPushed:YES];
//            [self.navigationController pushViewController:reportVC animated:YES];
//        }else if (intg == 2){
//            [MBProgressHUD showSuccess:@"报告正在生成中"];
//        }else{
//            YHTBeforReportViewController *reportVC = [[YHTBeforReportViewController alloc]initWithNibName:@"YHTBeforReportViewController" bundle:nil];
//            reportVC.isBefor = NO;
//            [reportVC setHidesBottomBarWhenPushed:YES];
//            [self.navigationController pushViewController:reportVC animated:YES];
//        }
        
        
    };
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
