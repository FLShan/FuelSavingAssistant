//
//  WSLRollViewHorizontalCell.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/3/4.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "WSLRollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WSLRollViewHorizontalCell : WSLRollViewCell
@property (strong, nonatomic) UILabel * titleLabel;
- (void)refreshData;
@end

NS_ASSUME_NONNULL_END