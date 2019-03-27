//
//  BaseViewController.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic , strong) YHTNavigationView * navView;
@property (nonatomic , assign) navViewLeftButtonType navLeftType;
@property (nonatomic , assign) navViewRightButtonType navRightType;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil LeftType:(navViewLeftButtonType)left andTitle:(NSString*)title andRightType:(navViewRightButtonType)right;
-(id)initWithLeftType:(navViewLeftButtonType)left andTitle:(NSString*)title andRightType:(navViewRightButtonType)right;

@end
