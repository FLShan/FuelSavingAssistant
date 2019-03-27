//
//  YHTFlightListTableViewCell.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/18.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHTHomeFlyModel.h"

typedef void(^DidClickStateBtnBlock)(YHTHomeFlyModelItem* item);

@interface YHTFlightListTableViewCell : UITableViewCell
@property (nonatomic, copy)DidClickStateBtnBlock DidClickStateBtnBlock;

- (void)freshFlightListCellWith:(YHTHomeFlyModelItem *)item;

@end
