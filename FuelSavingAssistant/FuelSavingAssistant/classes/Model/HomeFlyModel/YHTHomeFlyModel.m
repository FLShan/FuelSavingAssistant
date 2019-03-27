//
//  YHTHomeFlyModel.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "YHTHomeFlyModel.h"

@implementation YHTHomeFlyModelItem
-(instancetype)initYHTHomeFlyModelItemWith:(NSDictionary *)dic{
    if (self = [super init]) {
        @try {
            
            self.Fid = [dic safeObjectForKey:@"id"];
            self.duanjixing = [dic safeObjectForKey:@"duanjixing"];
            self.feijihao = [dic safeObjectForKey:@"feijihao"];
            self.hangbanhao = [dic safeObjectForKey:@"hangbanhao"];
            self.qifeijichang = [dic safeObjectForKey:@"qifeijichang"];
            self.qifeijichang4 = [dic safeObjectForKey:@"qifeijichang4"];
            self.zhuangtai = [dic safeObjectForKey:@"zhuangtai"];
            self.jingangkaoqiao = [dic safeObjectForKey:@"jingangkaoqiao"];
            self.chugangkaoqiao = [dic safeObjectForKey:@"chugangkaoqiao"];
            self.jizhunkongzhongyouhao = [dic safeObjectForKey:@"jizhunkongzhongyouhao"];
            self.jieyoubiaoji = [dic safeObjectForKey:@"jieyoubiaoji"];
            self.shijikongzhongyouhao = [dic safeObjectForKey:@"shijikongzhongyouhao"];
            self.jizhunAPD = [dic safeObjectForKey:@"jizhunAPD"];
            self.APD = [dic safeObjectForKey:@"APD"];
            self.jizhunxunhanggaodu = [dic safeObjectForKey:@"jizhunxunhanggaodu"];
            self.xunhanggaodu = [dic safeObjectForKey:@"xunhanggaodu"];
            self.jizhunyezai = [dic safeObjectForKey:@"jizhunyezai"];
            self.yezai = [dic safeObjectForKey:@"yezai"];
            self.jizhunhangduanjuli = [dic safeObjectForKey:@"jizhunhangduanjuli"];
            self.hangduanjuli = [dic safeObjectForKey:@"hangduanjuli"];
            self.shijidaoda = [dic safeObjectForKey:@"shijidaoda"];
            self.shijiqifei = [dic safeObjectForKey:@"shijiqifei"];
            self.yujidaoda = [dic safeObjectForKey:@"yujidaoda"];
            self.yujiqifei = [dic safeObjectForKey:@"yujiqifei"];
            self.jihuadaoda = [dic safeObjectForKey:@"jihuadaoda"];
            self.jihuaqifei = [dic safeObjectForKey:@"jihuaqifei"];
            self.jiangluojichang4 = [dic safeObjectForKey:@"jiangluojichang4"];
            self.jiangluojichang = [dic safeObjectForKey:@"jiangluojichang"];
            self.guozhanshijianjizhun = [dic safeObjectForKey:@"guozhanshijianjizhun"];
            self.guozhanshijianjihua = [dic safeObjectForKey:@"guozhanshijianjihua"];
            self.guozhanshijianshiji = [dic safeObjectForKey:@"guozhanshijianshiji"];
            
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


@implementation YHTHomeFlyFlightsModel
-(id)initWithYHTHomeFlyFlightsModelDataWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        @try {
            self.flightItems = [NSMutableArray array];
            NSArray *items = [dic safeObjectForKey:@"flights"];
            [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *itemDic = (NSDictionary *)obj;
                    YHTHomeFlyModelItem *item = [[YHTHomeFlyModelItem alloc]initYHTHomeFlyModelItemWith:itemDic];
                    [self.flightItems addObject:item];
                }
            }];
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




@implementation YHTHomeFlyModel
-(id)initWithYHTHomeFlyModelDataWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        @try {
            self.flightDayItems =[NSMutableArray array];
            NSArray *items = [dic safeObjectForKey:@"items"];
            [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *itemDic = (NSDictionary *)obj;
                    YHTHomeFlyFlightsModel *item = [[YHTHomeFlyFlightsModel alloc]initWithYHTHomeFlyFlightsModelDataWithDictionary:itemDic];
                    [self.flightDayItems addObject:item];
                }
            }];
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
