//
//  YHTOpreationTableViewCell.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTOpreationTableViewCell.h"
#import "YHTOpreationModel.h"
@interface YHTOpreationTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *titleImage;
@property (strong, nonatomic) IBOutlet UILabel* nameLabel;
@property (strong, nonatomic) IBOutlet UILabel* operationValueLabel;
@property (strong, nonatomic) IBOutlet UILabel* saveFuelValueLabel;
@property (strong, nonatomic) IBOutlet UILabel* bestOperationValueLabel;
@property (strong, nonatomic) IBOutlet UILabel* bestSaveFuelValueLabel;
@property (strong, nonatomic) IBOutlet UILabel* jieyouqianliLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameyujiLabel;
@property (strong, nonatomic) IBOutlet UILabel *wenzilabel;
@property (strong, nonatomic) IBOutlet UILabel *qianlizhiLabel;
@property (strong, nonatomic) IBOutlet UILabel *lineLabel;

@end
@implementation YHTOpreationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)freshCellWith:(YHTOpreationModelItem *)model andisBefor:(BOOL)isBefor{
    self.nameLabel.text = model.name;
    if ([model.name isEqualToString:@"额外油"]) {
        self.titleImage.image = [UIImage imageNamed:@"ico标签-06"];
    }else if([model.name isEqualToString:@"APU时长"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-05"];
    }else if([model.name isEqualToString:@"滑出时长"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-07"];
    }else if([model.name isEqualToString:@"收起落架高度"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-05"];
    }else if([model.name isEqualToString:@"收襟翼高度"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-06"];
    }else if([model.name isEqualToString:@"减推力高度"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-07"];
    }else if([model.name isEqualToString:@"航线距离"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-07"];
    }else if([model.name isEqualToString:@"巡航高度达成率"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-06"];
    }else if([model.name isEqualToString:@"CI执行率"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-05"];
    }else if([model.name isEqualToString:@"放襟翼高度"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-06"];
    }else if([model.name isEqualToString:@"放起落架高度"]){
        self.titleImage.image = [UIImage imageNamed:@"ico标签-05"];
    }else{
        self.titleImage.image = [UIImage imageNamed:@"ico标签-07"];
    }
    
    if (isBefor == YES) {
        self.operationValueLabel.text = model.yujizhixing;
        self.saveFuelValueLabel.text = model.yujijieyouliang;
        self.wenzilabel.text = @"";
        self.qianlizhiLabel.text = @"";
        self.nameyujiLabel.text = @"节油基准";
        self.lineLabel.hidden = YES;
       
    }else{
        self.operationValueLabel.text = model.shijizhixing;
        self.saveFuelValueLabel.text = model.shijijieyouliang;
        self.wenzilabel.text = @"剩余节油潜力";
        self.qianlizhiLabel.text = model.shengyujieyouqianli;
        self.nameyujiLabel.text = @"实际";
        self.lineLabel.hidden = NO;
       
    }
    self.bestOperationValueLabel.text = model.zuidayuqizhixing;
    self.bestSaveFuelValueLabel.text = model.zuidayuqijieyouliang;
}
@end
