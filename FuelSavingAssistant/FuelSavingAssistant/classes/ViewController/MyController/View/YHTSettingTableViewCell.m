//
//  YHTSettingTableViewCell.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/3/4.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTSettingTableViewCell.h"

@interface YHTSettingTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UIImageView *rightImageView;

@end
@implementation YHTSettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.rightImageView.layer.cornerRadius = 15;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)freshCell{
    self.titleLabel.text = @"头像";
    self.detailLabel.text = @"123";
}
@end
