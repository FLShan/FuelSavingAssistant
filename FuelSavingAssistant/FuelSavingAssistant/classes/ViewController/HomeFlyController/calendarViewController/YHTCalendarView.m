//
//  YHTCalendarView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/21.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTCalendarView.h"
#import "BXHCalendarView.h"
#import "NSDate+BXHCalendar.h"
#import "NSDate+BXHCategory.h"
#import "YHTCalendarTopView.h"

@interface YHTCalendarView ()<BXHCalendarViewDataSource,BXHCalendarViewDelegate>
@property (nonatomic, strong) NSDate *defautDate;
@property (nonatomic, strong) UIView *calendar;
@property (nonatomic, strong) BXHCalendarView *calendarView;

@property (nonatomic, strong) UIButton *todayBtn;

@property (nonatomic, strong) UIButton *typeButton;

@property (nonatomic, strong) YHTCalendarTopView *topview;
@end
@implementation YHTCalendarView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.defautDate = [NSDate date];
        self.calendar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH/2)];
        [self addSubview:self.calendar];
        self.calendar.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self setupView];
        [self bringSubviewToFront:self.todayBtn];
    }
    return self;
}
#pragma mark - 初始化view
- (void)setupView {
    // 初始化calendarView
    [self setupCalendarView];
}

// 初始化calendarView
- (void)setupCalendarView {
    self.topview = [[YHTCalendarTopView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 30)];
//    self.topview.backgroundColor = YHTGreenColor;
    [self.calendar addSubview:self.topview];
    CGFloat itemWH = kWindowW / 7;
    self.calendarView = [[BXHCalendarView alloc] initWithFrame:CGRectMake(0, 30, kWindowW, itemWH * CalendarDayView_HW_Ration * 6 )];
    self.calendarView.dataSource = self;
    self.calendarView.delegate = self;
    [self.calendar addSubview:self.calendarView];
    
    self.todayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.todayBtn setTitle:@"今日" forState:UIControlStateNormal];
    [self.todayBtn setTitleColor:YHTGreenColor forState:UIControlStateNormal];
    [self.todayBtn addTarget:self action:@selector(todayButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.todayBtn.layer.borderColor = YHTGreenColor.CGColor;
    self.todayBtn.layer.borderWidth = 1.0f;
    self.todayBtn.layer.cornerRadius = 5.0;
    [self.calendar addSubview:self.todayBtn];
    
    self.typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.typeButton.layer.cornerRadius = 5.0;
    [self.typeButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.typeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.typeButton setBackgroundColor:YHTGreenColor];
    [self.typeButton addTarget:self action:@selector(typeBUttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.calendar addSubview:self.typeButton];

    NSInteger padding = 20;
    [@[self.todayBtn,self.typeButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:padding leadSpacing:padding tailSpacing:padding];
    [@[self.todayBtn,self.typeButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-20);
    }];
    
    
}
- (void)todayButtonAction
{
    [self.calendarView goToToday];
    if (_CalendarSelectedWithDate) {
        _CalendarSelectedWithDate(self.defautDate);
    }
}

- (void)typeBUttonAction
{
//    CGFloat itemWH = self.frame.size.width / 7;
//    BXHCalendarDisplayType type = self.calendarView.displayType == BXHCalendarDisplayWeekType ? BXHCalendarDisplayMonthType : BXHCalendarDisplayWeekType;
//    [self.calendarView changeDisplayType:type animated:YES];
//    CGRect frame = self.calendarView.frame;
//    if (type == BXHCalendarDisplayWeekType)
//    {
//        frame.size.height = itemWH + 30;
//    }
//    else
//    {
//        frame.size.height = itemWH * CalendarDayView_HW_Ration * 6 + 30;
//    }
//    [UIView animateWithDuration:0.3 animations:^{
//        self.calendarView.frame = frame;
//    }];
    if (_CalendarSelectedWithDate) {
        _CalendarSelectedWithDate(self.defautDate);
    }
    
}
- (void)calendarView:(BXHCalendarView *)calendarView willShowMonthView:(BXHCalendarMonthView *)monthView
{
    self.topview.midTitle = [NSString stringWithFormat:@"%@",[monthView.beaginDate bxh_stringWithFormate:@"yyyy-MM"]];
}

- (void)calendarView:(BXHCalendarView *)calendarView dayViewHaveEvent:(BXHCalendarDayView *)dayView
{
    dayView.haveEvent = dayView.date.day % 3 == 0;
}

- (void)calendarView:(BXHCalendarView *)calendarView didSelectDayView:(BXHCalendarDayView *)dayView
{
    
    NSLog(@"select %@",[dayView.date bxh_stringWithFormate:@"yyyy-MM-dd"]);
    self.defautDate = dayView.date;
}
@end
