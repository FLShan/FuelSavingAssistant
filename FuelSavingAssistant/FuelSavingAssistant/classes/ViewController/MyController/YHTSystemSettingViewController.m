//
//  YHTSystemSettingViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/29.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTSystemSettingViewController.h"
#import "YHTSettingTableViewCell.h"

@interface YHTSystemSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *settingTableView;

@end

@implementation YHTSystemSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
//    }
//    cell.textLabel.text = @"aaa";
//    return cell;
    
    YHTSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"YHTSettingTableViewCell" owner:self options:nil] lastObject];
        }
//        cell.textLabel.text = @"aaa";
    [cell freshCell];
        return cell;
    
}




@end
