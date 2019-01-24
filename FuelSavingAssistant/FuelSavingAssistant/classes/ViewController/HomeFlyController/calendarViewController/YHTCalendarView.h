//
//  YHTCalendarView.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/21.
//  Copyright © 2019 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^CalendarSelectedWithDate)(NSDate *date);
@interface YHTCalendarView : UIView
@property (nonatomic, copy) CalendarSelectedWithDate CalendarSelectedWithDate;
@end

NS_ASSUME_NONNULL_END
