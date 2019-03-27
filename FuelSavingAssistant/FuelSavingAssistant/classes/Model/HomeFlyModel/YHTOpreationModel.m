//
//  YHTOpreationModel.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/28.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTOpreationModel.h"

@implementation YHTOpreationModelItem
-(id)initYHTOpreationModelItemWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        @try {
            self.name = [dic safeObjectForKey:@"name"];
            self.yujizhixing = [dic safeObjectForKey:@"yujizhixing"];
            self.yujijieyouliang = [dic safeObjectForKey:@"yujijieyouliang"];
            self.zuidayuqizhixing = [dic safeObjectForKey:@"zuidayuqizhixing"];
            self.zuidayuqijieyouliang = [dic safeObjectForKey:@"zuidayuqijieyouliang"];
            self.shijizhixing = [dic safeObjectForKey:@"shijizhixing"];
            self.shijijieyouliang = [dic safeObjectForKey:@"shijijieyouliang"];
            self.shengyujieyouqianli = [dic safeObjectForKey:@"shengyujieyouqianli"];
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
        @finally {
            
        }
    }
    return self;
}

@end
@implementation YHTOpreationModel
-(id)initYHTOpreationModelWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        @try {
            self.huachuArr = [NSMutableArray array];
            self.qifeiArr = [NSMutableArray array];
            self.xunhangArr = [NSMutableArray array];
            self.xiajiangArr = [NSMutableArray array];
            self.huaruArr = [NSMutableArray array];
            self.modelArr = [NSMutableArray array];
            NSArray *huachuArr = [dic safeObjectForKey:@"huachu"];
            [huachuArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *itemDic = (NSDictionary *)obj;
                    YHTOpreationModelItem *item = [[YHTOpreationModelItem alloc]initYHTOpreationModelItemWithDic:itemDic];
                    [self.huachuArr addObject:item];
                }
            }];
            
            NSArray *qifeiArr = [dic safeObjectForKey:@"qifei"];
            [qifeiArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *itemDic = (NSDictionary *)obj;
                    YHTOpreationModelItem *item = [[YHTOpreationModelItem alloc]initYHTOpreationModelItemWithDic:itemDic];
                    [self.qifeiArr addObject:item];
                }
            }];
            NSArray *xunhangArr = [dic safeObjectForKey:@"xunhang"];
            [xunhangArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *itemDic = (NSDictionary *)obj;
                    YHTOpreationModelItem *item = [[YHTOpreationModelItem alloc]initYHTOpreationModelItemWithDic:itemDic];
                    [self.xunhangArr addObject:item];
                }
            }];
            NSArray *xiajiangArr = [dic safeObjectForKey:@"xiajiang"];
            [xiajiangArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *itemDic = (NSDictionary *)obj;
                    YHTOpreationModelItem *item = [[YHTOpreationModelItem alloc]initYHTOpreationModelItemWithDic:itemDic];
                    [self.xiajiangArr addObject:item];
                }
            }];
            NSArray *huaruArr = [dic safeObjectForKey:@"huaru"];
            [huaruArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *itemDic = (NSDictionary *)obj;
                    YHTOpreationModelItem *item = [[YHTOpreationModelItem alloc]initYHTOpreationModelItemWithDic:itemDic];
                    [self.huaruArr addObject:item];
                }
            }];
            
            [self.modelArr addObject:self.huachuArr];
            [self.modelArr addObject:self.qifeiArr];
            [self.modelArr addObject:self.xunhangArr];
            [self.modelArr addObject:self.xiajiangArr];
            [self.modelArr addObject:self.huaruArr];
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
        @finally {
            
        }
    }
    return self;
}
@end
