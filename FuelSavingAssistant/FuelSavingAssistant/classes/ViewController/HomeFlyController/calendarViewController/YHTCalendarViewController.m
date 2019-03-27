//
//  YHTCalendarViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/21.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTCalendarViewController.h"
#import "YHTCalendarView.h"
#import "YHTCalendarTopView.h"
@interface YHTCalendarViewController ()
@property (nonatomic, strong) YHTCalendarView *calendarView;
@property (nonatomic, strong) UISwipeGestureRecognizer *recognizer;


@end

@implementation YHTCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.calendarView = [[YHTCalendarView alloc]initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH)];
    __weak typeof(self) weakSelf = self;
    self.calendarView.CalendarSelectedWithDate = ^(NSDate* date){
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
     [self.view addSubview:self.calendarView];
    _recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [_recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self.view addGestureRecognizer:_recognizer];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"swipe down");
//        CYLTabBarController *tab = [self tabbarController];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right");
    }
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

#pragma mark - 初始化view

-(void)navLeftButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
