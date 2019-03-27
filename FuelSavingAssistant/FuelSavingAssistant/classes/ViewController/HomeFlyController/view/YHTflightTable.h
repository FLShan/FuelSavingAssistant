//
//  YHTflightTable.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/27.
//  Copyright © 2019 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHTHomeFlyModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^DidClickStateBtnBlock)(YHTHomeFlyModelItem* item);
@interface YHTflightTable : UITableView
@property (nonatomic, copy)DidClickStateBtnBlock DidClickStateBtnBlock;
-(void)freshYHTflightTableViewDataWithArray:(YHTHomeFlyFlightsModel *)model;
@end

NS_ASSUME_NONNULL_END
