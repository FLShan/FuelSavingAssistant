//
//  WSLRollViewHorizontalCell.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/3/4.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "WSLRollViewHorizontalCell.h"

@implementation WSLRollViewHorizontalCell



- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:30];
        self.titleLabel.userInteractionEnabled = YES;
        [self.contentView addSubview:self.titleLabel];
        self.contentView.clipsToBounds = YES;
        //        self.contentView.autoresizesSubviews = YES;
        //        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}
- (void)refreshData{
//    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:30];
    self.titleLabel.userInteractionEnabled = YES;
    [self.contentView addSubview:self.titleLabel];
    self.contentView.clipsToBounds = YES;
    
    self.layer.cornerRadius = 6;
}

@end
