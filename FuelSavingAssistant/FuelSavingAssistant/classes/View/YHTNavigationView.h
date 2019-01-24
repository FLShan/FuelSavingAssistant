//
//  YHTNavigationView.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    navViewLeftButtonTypeDefault,//返回
    navViewLeftButtonTypeWhiteBack,//返回
    navViewLeftButtonTypeSystemSetting,//
    navViewLeftButtonTypeNone,//
} navViewLeftButtonType;

typedef enum : NSUInteger {
    navViewRightButtonTypeNone,//无按钮
    navViewRightButtonTypeCancel,//文字取消
    navViewRightButtonTypeShare,//分享
    navViewRightButtonTypeSubmit,//提交
    navViewRightButtonTypeMessage,//消息
    navViewRightButtonTypeSearch,//搜索
    navViewRightButtonTypeBlackSearch,//搜索
    navViewRightButtonTypeShopCar,//购物车
    navViewRightButtonTypeSave,//文字保存
} navViewRightButtonType;
@interface YHTNavigationView : UIView
@property (nonatomic , assign) navViewLeftButtonType leftType;
@property (nonatomic , assign) navViewRightButtonType rightType;

@property (strong, nonatomic) UIButton *leftBtn;
@property (retain, nonatomic) UIButton *rightBtn;
@property (strong, nonatomic) UIButton *middleBtn;

@property (retain, nonatomic) UILabel *numLable;

@property (retain, nonatomic) UIView *lineView;

@property(nonatomic,strong) UIView * searchBackView;

-(id)initWithNavViewFrame:(CGRect )frame andLeftType:(navViewLeftButtonType)left andTitle:(NSString*)title andRightType:(navViewRightButtonType)right;
@end
