//
//  YHTOpreationTableViewCell.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHTOpreationModelItem;
NS_ASSUME_NONNULL_BEGIN

@interface YHTOpreationTableViewCell : UITableViewCell
- (void)freshCellWith:(YHTOpreationModelItem *)model andisBefor:(BOOL)isBefor;
@end

NS_ASSUME_NONNULL_END
