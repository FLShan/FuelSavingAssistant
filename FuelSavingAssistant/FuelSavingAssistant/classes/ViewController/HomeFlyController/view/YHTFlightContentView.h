//
//  YHTFlightContentView.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/27.
//  Copyright © 2019 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHTHomeFlyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YHTFlightContentView : UIView
@property (nonatomic,strong) YHTHomeFlyFlightsModel *model;
+(instancetype)initWithXib:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
