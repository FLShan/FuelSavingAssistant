//
//  YHTNavigationView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "YHTNavigationView.h"
#define BTNWIDTH   44
@implementation YHTNavigationView

#pragma mark - init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createItemsView];
        
        _rightType = navViewRightButtonTypeNone;
        _leftType = navViewLeftButtonTypeDefault;
        
        
        self.backgroundColor = [UIColor clearColor];
        [self createLineView];
        
    }
    return self;
}

-(id)initWithNavViewFrame:(CGRect )frame andLeftType:(navViewLeftButtonType)left andTitle:(NSString*)title andRightType:(navViewRightButtonType)right
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createItemsView];
        
        self.backgroundColor = [UIColor clearColor];
        [self.middleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.middleBtn setTitle:title forState:UIControlStateNormal];
        
        _rightType = right;
        _leftType = left;
        
        
        [self createLeftButton];
        [self createRightButton];
        
        [self createLineView];
        
    }
    return self;
    
}

-(void)createLineView
{
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63, kWindowW, 1)];
    _lineView.hidden = YES;
    _lineView.backgroundColor = UIColorFromRGBA(0xf2f2f2,0.8);
    [self addSubview:_lineView];
    
}

#pragma mark - setter

-(void)setNavLeftType:(navViewLeftButtonType)navLeftType
{
    _leftType = navLeftType;
}

-(void)setNavRightType:(navViewRightButtonType)navRightType
{
    _rightType = navRightType;
}

#pragma mark - create

//-(void)setShowTwoBtn:(BOOL)showTwoBtn{
//    //显示超过2个btn
//    if (showTwoBtn) {
//        self.middleBtn.frame = CGRectMake(BTNWIDTH*2, YHT_IOS7VIEWHEIGHT, YHT_SCREENSIZE.width-BTNWIDTH*4, BTNWIDTH);
//    }else{
//        self.middleBtn.frame = CGRectMake(BTNWIDTH, YHT_IOS7VIEWHEIGHT, YHT_SCREENSIZE.width-BTNWIDTH*2, BTNWIDTH);
//    }
//}

//创建上面得选项
-(void)createItemsView{
    self.leftBtn = [self getButtonWithIndex:1];
    //    self.leftTwoBtn = [self getButtonWithIndex:2];
    
    //创建中间得button
    self.middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.middleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    self.middleBtn.userInteractionEnabled = YES;
    self.middleBtn.backgroundColor = [UIColor clearColor];
    [self.middleBtn setTitleColor:UIColorFromRGBA(0x333333,0.0f) forState:UIControlStateNormal];
    self.middleBtn.frame = CGRectMake(BTNWIDTH, LEFT_BTN_POSITION, CGRectGetWidth([UIScreen mainScreen].bounds) -BTNWIDTH*2, BTNWIDTH);
    
    _searchBackView = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - (BTNWIDTH)/2,32, 30 ,30)];
    _searchBackView.layer.masksToBounds = YES;
    _searchBackView.layer.cornerRadius = 15.f;
    _searchBackView.hidden = YES;
    _searchBackView.backgroundColor = UIColorFromRGBA(0x000000,0.0f);
    [self addSubview:_searchBackView];
    
    //    self.rightTwoBtn = [self getButtonWithIndex:3];
    self.rightBtn = [self getButtonWithIndex:4];
    self.numLable=[[UILabel alloc]initWithFrame:CGRectMake(self.rightBtn.frame.origin.x+24,self.rightBtn.frame.origin.y+10, 8 ,8)];
    self.numLable.layer.cornerRadius = self.numLable.frame.size.height/2;
    self.numLable.layer.masksToBounds = YES;
    self.numLable.font=[UIFont systemFontOfSize:9];
    self.numLable.textAlignment = NSTextAlignmentCenter;
    self.numLable.backgroundColor = [UIColor redColor];
    self.numLable.textColor = [UIColor whiteColor];
    self.numLable.hidden = YES;
    
    _searchBackView.center = self.rightBtn.center;
    
    [self addSubview:self.leftBtn];
    //    [self addSubview:self.leftTwoBtn];
    [self addSubview:self.middleBtn];
    [self addSubview:self.rightBtn];
    //    [self addSubview:self.rightTwoBtn];
    [self addSubview:self.numLable];
    
}
//创建每一个选项
-(UIButton *)getButtonWithIndex:(int)index{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake([self getXWithIndex:index], LEFT_BTN_POSITION, BTNWIDTH, BTNWIDTH);
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    btn.backgroundColor = [UIColor clearColor];
    btn.imageEdgeInsets = UIEdgeInsetsMake(BTNWIDTH/4, BTNWIDTH/4, BTNWIDTH/4, BTNWIDTH/4);
    return btn;
}

-(float)getXWithIndex:(int)index{
    
    CGFloat width = kWindowW;
    
    float X = 0;
    switch (index) {
        case 1:{
            X = 0;
        }
            break;
        case 2:{
            X = BTNWIDTH;
        }
            break;
        case 3:{
            X = width - BTNWIDTH*2;
        }
            break;
        case 4:{
            X = width - BTNWIDTH;
        }
            break;
        default:
            break;
    }
    return X;
}


-(void)createLeftButton
{
    switch (_leftType) {
        case navViewLeftButtonTypeDefault://默认为黑色
        {
            [self.leftBtn setImage:[UIImage imageNamed:@"navigationbar_pop_btn_black"] forState:UIControlStateNormal];
        }
            break;
        case navViewLeftButtonTypeWhiteBack://白色
        {
            [self.leftBtn setImage:[UIImage imageNamed:@"arrow_white"] forState:UIControlStateNormal];
        }
            break;
        case navViewLeftButtonTypeSystemSetting://
        {
            [self.leftBtn setImage:[UIImage imageNamed:@"navigationbar_settings_btn_white"] forState:UIControlStateNormal];
        }
            break;
        case navViewLeftButtonTypeNone://
        {
            self.leftBtn.hidden = YES;
        }
            break;
        default:
            break;
    }
    
}
-(void)createRightButton
{
    switch (_rightType) {
            
        case navViewRightButtonTypeNone:
        {
            self.rightBtn.hidden = YES;
        }
            break;
        case navViewRightButtonTypeCancel:
        {
            [self.rightBtn setTitle:@"取消" forState:UIControlStateNormal];
        }
            break;
        case navViewRightButtonTypeShare:
        {
            [self.rightBtn setImage:[UIImage imageNamed:@"navigationbar_share_btn_black"] forState:UIControlStateNormal];
        }
            break;
        case navViewRightButtonTypeSubmit:
        {
            [self.rightBtn setTitle:@"完成" forState:UIControlStateNormal];
        }
            break;
        case navViewRightButtonTypeMessage:
        {
            [self.rightBtn setImage:[UIImage imageNamed:@"ico-02"] forState:UIControlStateNormal];
        }
            break;
        case navViewRightButtonTypeSearch:
        {
            _searchBackView.hidden = NO;
            [self.rightBtn setImage:[UIImage imageNamed:@"navigationbar_search_btn_white"] forState:UIControlStateNormal];
        }
            break;
        case navViewRightButtonTypeBlackSearch:
        {
            [self.rightBtn setImage:[UIImage imageNamed:@"navigationbar_search_btn_black"] forState:UIControlStateNormal];
        }
            break;
        case navViewRightButtonTypeShopCar:
        {
            [self.rightBtn setImage:[UIImage imageNamed:@"navigationbar_shopList_btn_black"] forState:UIControlStateNormal];
        }
            break;
        case navViewRightButtonTypeSave:
        {
            [self.rightBtn setTitle:@"保存" forState:UIControlStateNormal];
        }
            break;
        default:
        {
            NSLog(@"数据问题");
        }
            break;
    }
    
}

@end
