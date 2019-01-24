//
//  XBMeHeaderView.m
//  xiu8iOS
//
//  Created by Scarecrow on 15/9/19.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import "XBMeHeaderView.h"
@interface XBMeHeaderView()
@property (weak, nonatomic) IBOutlet UIView *circleBg;
@property (weak, nonatomic) IBOutlet UIImageView *header;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIView *alreadyLoginView;

@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (strong, nonatomic) IBOutlet UIView *midView;

@property (strong, nonatomic) IBOutlet UIView *rightView;

@end
@implementation XBMeHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupHeaderCircle];
    self.backgroundColor = YHTDarkBlueColor;
    self.leftView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.leftView.layer.shadowOpacity = 0.8f;
    self.leftView.layer.shadowRadius = 4.f;
    self.leftView.layer.shadowOffset = CGSizeMake(2,2);
    self.leftView.layer.cornerRadius = 4;
    
    
    self.midView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.midView.layer.shadowOpacity = 0.8f;
    self.midView.layer.shadowRadius = 4.f;
    self.midView.layer.shadowOffset = CGSizeMake(2,2);
     self.midView.layer.cornerRadius = 4;
    
    self.rightView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.rightView.layer.shadowOpacity = 0.8f;
    self.rightView.layer.shadowRadius = 4.f;
    self.rightView.layer.shadowOffset = CGSizeMake(2,2);
     self.rightView.layer.cornerRadius = 4;
}

- (void)loginStateChanged:(BOOL)loginState
{
//    self.noLoginView.hidden = loginState;
    self.alreadyLoginView.hidden = !loginState;
}

- (IBAction)loginBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(XBMeHeaderViewBtnClicked:)]) {
        [self.delegate XBMeHeaderViewBtnClicked:XBMeHeaderViewButtonTypeLogin];
    }
}

- (IBAction)registerBtnClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(XBMeHeaderViewBtnClicked:)]) {
        [self.delegate XBMeHeaderViewBtnClicked:XBMeHeaderViewButtonTypeRegister];
    }
}

- (IBAction)attentionBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(XBMeHeaderViewBtnClicked:)]) {
        [self.delegate XBMeHeaderViewBtnClicked:XBMeHeaderViewButtonTypeAttention];
    }
}

- (IBAction)historyBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(XBMeHeaderViewBtnClicked:)]) {
        [self.delegate XBMeHeaderViewBtnClicked:XBMeHeaderViewButtonTypeHistory];
    }
}

- (IBAction)guardBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(XBMeHeaderViewBtnClicked:)]) {
        [self.delegate XBMeHeaderViewBtnClicked:XBMeHeaderViewButtonTypeGuard];
    }
}



- (void)setupHeaderCircle
{
//    self.circleBg.layer.cornerRadius = self.circleBg.height * 0.5;
    self.header.layer.cornerRadius = self.header.frame.size.width * 0.5;
    self.header.clipsToBounds = YES;
    self.circleBg.clipsToBounds = YES;
}

@end
