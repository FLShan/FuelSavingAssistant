//
//  YHTMyDataViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/22.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTMyDataViewController.h"

@interface YHTMyDataViewController ()
@property (strong, nonatomic) IBOutlet UIView *tabelHeadView;
@property (strong, nonatomic) IBOutlet UITableView *mydataTableView;

@end

@implementation YHTMyDataViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = kRGBColor(78, 80, 99);
    self.navView.backgroundColor = YHTGreenColor;
    self.mydataTableView.backgroundColor = [UIColor clearColor];
    self.mydataTableView.tableHeaderView = self.tabelHeadView;
    
    
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
