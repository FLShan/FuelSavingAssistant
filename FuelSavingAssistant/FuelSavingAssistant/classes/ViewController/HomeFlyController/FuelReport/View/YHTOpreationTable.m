//
//  YHTOpreationTable.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTOpreationTable.h"
#import "YHTOpreationTableViewCell.h"

@interface YHTOpreationTable ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *modelArr;
@end

@implementation YHTOpreationTable

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.modelArr = [NSMutableArray array];
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)freshYHTOpreationTableViewDataWithArray:(NSMutableArray *)model andisBefor:(BOOL)isBefore
{
    _modelArr = model;
    _isBefore = isBefore;
    [self reloadData];
}

#pragma mark - tableView delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *globalPriceCellIdentifier = @"YHTOpreationTableViewCell";
    YHTOpreationTableViewCell *cell = (YHTOpreationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:globalPriceCellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YHTOpreationTableViewCell" owner:self options:nil] lastObject];
    }
    YHTOpreationModelItem *item = _modelArr[indexPath.row];
    [cell freshCellWith:item andisBefor:_isBefore];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
