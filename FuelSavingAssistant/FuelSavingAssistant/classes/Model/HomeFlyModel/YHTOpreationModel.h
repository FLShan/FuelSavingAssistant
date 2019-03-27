//
//  YHTOpreationModel.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHTOpreationModelItem : YHTBaseModelItem
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * yujizhixing;
@property (nonatomic, copy) NSString * yujijieyouliang;
@property (nonatomic, copy) NSString * zuidayuqizhixing;
@property (nonatomic, copy) NSString * zuidayuqijieyouliang;
@property (nonatomic, copy) NSString * shijizhixing;
@property (nonatomic, copy) NSString * shijijieyouliang;
@property (nonatomic, copy) NSString * shengyujieyouqianli;
- (id)initYHTOpreationModelItemWithDic:(NSDictionary *)dic;
@end

@interface YHTOpreationModel : YHTBaseModel
@property (nonatomic, strong) NSMutableArray *huachuArr;
@property (nonatomic, strong) NSMutableArray *qifeiArr;
@property (nonatomic, strong) NSMutableArray *xunhangArr;
@property (nonatomic, strong) NSMutableArray *xiajiangArr;
@property (nonatomic, strong) NSMutableArray *huaruArr;
@property (nonatomic, strong) NSMutableArray *modelArr;
-(id)initYHTOpreationModelWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
