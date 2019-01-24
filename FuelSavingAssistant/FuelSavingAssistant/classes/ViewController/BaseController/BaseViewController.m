//
//  BaseViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property(nonatomic,copy)NSString * navTitleString;
@end

@implementation BaseViewController
#pragma mark - init

-(void)awakeFromNib{
    [super awakeFromNib];
    _navRightType = navViewRightButtonTypeShare;
    _navLeftType = navViewLeftButtonTypeNone;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _navRightType = navViewRightButtonTypeMessage;
        _navLeftType = navViewLeftButtonTypeWhiteBack;
    }
    return self;
}

-(id)initWithLeftType:(navViewLeftButtonType)left andTitle:(NSString*)title andRightType:(navViewRightButtonType)right
{
    self = [super init];
    if (self) {
        _navLeftType = left;
        _navRightType = right;
        _navTitleString = title;
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kRGBColor(249, 250, 251);
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBar.hidden=YES;
    
    [self createNavView];
    [self createNavViewLeftButton];
    [self createNavViewMiddleBtnButton];
    [self createNavViewRightButton];
}
- (void)createNavView{
    
    if (!self.navView) {
        NSString * title = @"";
        if (_navTitleString && _navTitleString.length > 0) {
            title = _navTitleString;
        }
        self.navView = [[YHTNavigationView alloc] initWithNavViewFrame:CGRectMake(0, 0, kWindowW, NAVIGATION_BAR_HEIGHT) andLeftType:_navLeftType andTitle:title andRightType:_navRightType];
        self.navView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.navView];
    }
}

-(void)createNavViewLeftButton
{
    [self.navView.leftBtn addTarget:self action:@selector(navLeftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)createNavViewMiddleBtnButton{
    [self.navView.middleBtn addTarget:self action:@selector(navMiddleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)createNavViewRightButton
{
    [self.navView.rightBtn addTarget:self action:@selector(navRightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
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
#pragma mark - buttonClicked

-(void)navLeftButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)navMiddleButtonClicked:(id)sender
{
    
}
-(void)navRightButtonClicked:(id)sender
{
    
}
#pragma mark - setter

-(void)setNavLeftType:(navViewLeftButtonType)navLeftType
{
    _navLeftType = navLeftType;
}

-(void)setNavRightType:(navViewRightButtonType)navRightType
{
    _navRightType = navRightType;
}
@end
