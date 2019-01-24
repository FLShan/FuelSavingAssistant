//
//  communityViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "communityViewController.h"

@interface communityViewController ()

@end

@implementation communityViewController
+ (UINavigationController *)defaultCommunityNavi {
    communityViewController *vc = [communityViewController new];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
