//
//  YHTFlightListTableViewCell.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/18.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DidClickStateBtnBlock)();

@interface YHTFlightListTableViewCell : UITableViewCell
@property (nonatomic, copy)DidClickStateBtnBlock DidClickStateBtnBlock;

@end
