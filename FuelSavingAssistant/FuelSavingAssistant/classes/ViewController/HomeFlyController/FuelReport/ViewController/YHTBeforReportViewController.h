//
//  YHTBeforReportViewController.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/24.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "BaseViewController.h"
#import "YHTHomeFlyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHTBeforReportViewController : BaseViewController
@property (nonatomic, assign) BOOL isBefor;
@property (nonatomic, strong) YHTHomeFlyModelItem *model;
@end

NS_ASSUME_NONNULL_END
