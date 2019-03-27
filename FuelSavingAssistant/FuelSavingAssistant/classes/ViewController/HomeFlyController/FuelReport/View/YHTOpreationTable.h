//
//  YHTOpreationTable.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHTOpreationModel.h"
NS_ASSUME_NONNULL_BEGIN
//typedef void(^DidClickStateBtnBlock)(YHTHomeFlyModelItem* item);

@interface YHTOpreationTable : UITableView
//@property (nonatomic, copy)DidClickStateBtnBlock DidClickStateBtnBlock;
@property (nonatomic,assign) BOOL isBefore;
-(void)freshYHTOpreationTableViewDataWithArray:(NSMutableArray *)model andisBefor:(BOOL)isBefore;

@end

NS_ASSUME_NONNULL_END
