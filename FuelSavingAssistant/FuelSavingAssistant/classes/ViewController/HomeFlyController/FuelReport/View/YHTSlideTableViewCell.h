//
//  YHTSlideTableViewCell.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/25.
//  Copyright © 2019 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHTHomeFlyModel.h"
typedef void(^DidClickMapBtnBlock)();
NS_ASSUME_NONNULL_BEGIN

@interface YHTSlideTableViewCell : UITableViewCell
@property (nonatomic, copy)DidClickMapBtnBlock DidClickMapBtnBlock;
@property (nonatomic, strong) YHTHomeFlyModelItem *Flightmodel;
-(void)freshYHTSlideTableViewCell:(YHTHomeFlyModelItem *)Flightmodel;

@end

NS_ASSUME_NONNULL_END
