//
//  YHTCalendarNavView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/26.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTCalendarNavView.h"
#import "UIView+Ext.h"

#define DefaultTagTextColor_normal [UIColor blackColor]
#define DefaultTagTextColor_selected [UIColor redColor]
#define DefaultTagTextFont_normal 15
#define DefaultTagTextFont_selected 15
//#define DefaultSliderColor [UIColor redColor]
#define DefaultSliderH 1
#define DefaultSliderW 30


@interface YHTCalendarNavView ()

@property (nonatomic, strong) NSMutableArray * buttonsArray;
@property (nonatomic, strong) NSMutableArray * buttonsArray1;

@property (nonatomic, strong) UIView * sliderView;

@end

@implementation YHTCalendarNavView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        _buttonsArray = [[NSMutableArray alloc] init];
        _buttonsArray1 = [[NSMutableArray alloc] init];
        
        //默认
        _tagTextColor_normal = DefaultTagTextColor_normal;
        _tagTextColor_selected = DefaultTagTextColor_selected;
        _tagTextFont_normal = DefaultTagTextFont_normal;
        _tagTextFont_selected = DefaultTagTextFont_selected;
        _sliderColor = YHTDarkBlueColor;
        _sliderH = DefaultSliderH;
        _sliderW = DefaultSliderW;
        
    }
    return self;
}

- (void)createUI
{
    [self.buttonsArray removeAllObjects];
    [self.buttonsArray1 removeAllObjects];
    float width = self.width / _dataArr.count;
    
    for (int i = 0 ; i < _dataArr.count ; i++) {
        UIButton *Label =  [[UIButton alloc] initWithFrame:CGRectMake(10 + i * width, 0, 30, 20)];
        Label.tag = 2000+i;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10 + i * width, 20, 30, 30)];
        
        
        NSString *str = [_dataArr objectAtIndex:i];
        NSRange range = [str rangeOfString:@" "];
        NSString *week = [str substringToIndex:range.location];
        NSString *day = [str substringFromIndex:range.location+1];
        
        button.tag = 1000+i;
        button.backgroundColor = [UIColor whiteColor];
        Label.backgroundColor = [UIColor whiteColor];
        
        
        [button setTitle:week forState:UIControlStateNormal];
        [button setTitleColor:self.tagTextColor_normal forState:UIControlStateNormal];
        [button setTitleColor:self.tagTextColor_selected forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_normal];
        [button addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [Label setTitle:day forState:UIControlStateNormal];
        [Label setTitleColor:self.tagTextColor_normal forState:UIControlStateNormal];
        [Label setTitleColor:self.tagTextColor_selected forState:UIControlStateSelected];
        Label.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_normal];
//        [Label addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //默认第一个选中
        if (i == 3) {
            button.selected = YES;
            button.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_selected];
            button.layer.cornerRadius = button.frame.size.width/2;
            [button setBackgroundColor:YHTGreenColor];
            Label.selected = YES;
            Label.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_selected];
        }
        
        [self.buttonsArray addObject:button];
        [self.buttonsArray1 addObject:Label];
        [self addSubview:button];
        [self addSubview:Label];
    }
    
    self.sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-self.sliderH, self.sliderW, self.sliderH)];
    self.sliderView.centerX = width/2;
    self.sliderView.centerY = width/2;
    self.sliderView.backgroundColor = self.sliderColor;
    [self addSubview:self.sliderView];
}

- (void)tagBtnClick:(UIButton *)btn
{
    WTWeakSelf;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.sliderView.centerX = btn.centerX;
        weakSelf.sliderView.centerY = btn.centerY;
    }];
    
    for (UIButton *subButton in self.buttonsArray) {
        subButton.selected = NO;
        subButton.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_normal];
    }
//    for (UIButton *subButton in self.buttonsArray1) {
//        subButton.selected = NO;
//        subButton.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_normal];
//    }
    btn.selected = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_selected];
    
    if ([self.delegate respondsToSelector:@selector(haveSelectedIndex:)]) {
        [self.delegate haveSelectedIndex:btn.tag -1000];
    }
}

- (void)selectingOneTagWithIndex:(NSInteger)index
{
    NSInteger s_btnTagIndex = index+1000;
     NSInteger s_btnTagIndex1 = index+2000;
    for (UIButton *subButton in self.buttonsArray) {
        if (s_btnTagIndex != subButton.tag) {
            subButton.selected = NO;
            subButton.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_normal];
            [subButton setBackgroundColor:[UIColor whiteColor]];
        }
        else{
            WTWeakSelf;
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.sliderView.centerX = subButton.centerX;
                weakSelf.sliderView.centerY = subButton.centerY;
            } completion:^(BOOL finished) {
                subButton.selected = YES;
                subButton.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_selected];
                subButton.layer.cornerRadius = subButton.frame.size.width/2;
                [subButton setBackgroundColor:YHTGreenColor];
            }];
        }
    }
    for (UIButton *subButton in self.buttonsArray1) {
        if (s_btnTagIndex1 != subButton.tag) {
            subButton.selected = NO;
            subButton.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_normal];
        }
        else{
            WTWeakSelf;
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.sliderView.centerX = subButton.centerX;
            } completion:^(BOOL finished) {
                subButton.selected = YES;
                subButton.titleLabel.font = [UIFont systemFontOfSize:self.tagTextFont_selected];
            }];
        }
    }
}

- (void)setDataArr:(NSArray *)dataArr
{
    if (_dataArr != dataArr) {
        _dataArr = dataArr;
        [self createUI];
    }
}
- (void)setTagTextColor_normal:(UIColor *)tagTextColor_normal
{
    if (_tagTextColor_normal != tagTextColor_normal) {
        for (UIButton *subButton in self.buttonsArray){
            [subButton setTitleColor:tagTextColor_normal forState:UIControlStateNormal];
        }
        for (UIButton *subButton in self.buttonsArray1){
            [subButton setTitleColor:tagTextColor_normal forState:UIControlStateNormal];
        }
        _tagTextColor_normal = tagTextColor_normal;
    }
}
- (void)setTagTextColor_selected:(UIColor *)tagTextColor_selected
{
    if (_tagTextColor_selected != tagTextColor_selected) {
        for (UIButton *subButton in self.buttonsArray){
            [subButton setTitleColor:tagTextColor_selected forState:UIControlStateSelected];
        }
        for (UIButton *subButton in self.buttonsArray1){
            [subButton setTitleColor:YHTGreenColor forState:UIControlStateSelected];
        }
        _tagTextColor_selected = tagTextColor_selected;
    }
}
- (void)setTagTextFont_normal:(CGFloat)tagTextFont_normal
{
    if (_tagTextFont_normal != tagTextFont_normal) {
        for (UIButton *subButton in self.buttonsArray){
            if (subButton.selected == NO) {
                subButton.titleLabel.font = [UIFont systemFontOfSize:tagTextFont_normal] ;
            }
        }
        for (UIButton *subButton in self.buttonsArray1){
            if (subButton.selected == NO) {
                subButton.titleLabel.font = [UIFont systemFontOfSize:tagTextFont_normal] ;
            }
        }
        _tagTextFont_normal = tagTextFont_normal;
    }
}
- (void)setTagTextFont_selected:(CGFloat)tagTextFont_selected
{
    if (_tagTextFont_selected != tagTextFont_selected) {
        for (UIButton *subButton in self.buttonsArray){
            if (subButton.selected == YES) {
                subButton.titleLabel.font = [UIFont systemFontOfSize:tagTextFont_selected] ;
            }
        }
        for (UIButton *subButton in self.buttonsArray1){
            if (subButton.selected == YES) {
                subButton.titleLabel.font = [UIFont systemFontOfSize:tagTextFont_selected] ;
            }
        }
        _tagTextFont_selected = tagTextFont_selected;
    }
}
- (void)setSliderColor:(UIColor *)sliderColor
{
    if (_sliderColor != sliderColor) {
        self.sliderView.backgroundColor = sliderColor;
        _sliderColor = sliderColor;
    }
}
- (void)setSliderW:(CGFloat)sliderW
{
    if (_sliderW != sliderW) {
        self.sliderView.width = sliderW;
        _sliderW = sliderW;
    }
}
- (void)setSliderH:(CGFloat)sliderH
{
    if (_sliderH != sliderH) {
        self.sliderView.height = sliderH;
        self.sliderView.Y = self.height-self.sliderView.height;
        for (UIButton *subButton in self.buttonsArray){
            if (subButton.selected == YES) {
                self.sliderView.centerX = subButton.centerX;
                self.sliderView.centerY = subButton.centerY;
            }
        }
        for (UIButton *subButton in self.buttonsArray1){
            if (subButton.selected == YES) {
                self.sliderView.centerX = subButton.centerX;
            }
        }
        _sliderH = sliderH;
    }
}

 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
     //获得处理的上下文
     CGContextRef context = UIGraphicsGetCurrentContext();
     //设置线的颜色
     CGContextSetStrokeColorWithColor(context, kRGBColor(228, 229, 230).CGColor);
     //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
     CGContextMoveToPoint(context,10, CGRectGetMaxY(self.frame)-1);
     //设置下一个坐标点
     CGContextAddLineToPoint(context, CGRectGetMaxX(self.frame)-10, CGRectGetMaxY(self.frame)-1);
     //连接上面定义的坐标点，也就是开始绘图
     CGContextStrokePath(context);
 }
 

@end

