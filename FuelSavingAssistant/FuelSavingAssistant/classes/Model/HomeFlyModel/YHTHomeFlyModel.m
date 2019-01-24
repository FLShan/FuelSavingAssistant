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
            self.FltID = [dic safeObjectForKey:@"FltID"];
            self.FltNumber = [dic safeObjectForKey:@"FltNumber"];
            self.AcType = [dic safeObjectForKey:@"AcType"];
            self.Acreg = [dic safeObjectForKey:@"Acreg"];
            self.FltDate = [dic safeObjectForKey:@"FltDate"];
            self.DepTime = [dic safeObjectForKey:@"DepTime"];
            self.ArrTime = [dic safeObjectForKey:@"ArrTime"];
            self.DepApt = [dic safeObjectForKey:@"DepApt"];
            self.DepApt4Code = [dic safeObjectForKey:@"DepApt4Code"];
            self.DepAptStand = [dic safeObjectForKey:@"DepAptStand"];
            self.DepAptIsCBridge = [dic safeObjectForKey:@"DepAptIsCBridge"];
            self.ArrApt = [dic safeObjectForKey:@"ArrApt"];
            self.ArrApt4Code = [dic safeObjectForKey:@"ArrApt4Code"];
            self.ArrAptStand = [dic safeObjectForKey:@"ArrAptStand"];
            self.ArrAptIsCBridge = [dic safeObjectForKey:@"ArrAptIsCBridge"];
            self.ExpectedSaveFuel = [dic safeObjectForKey:@"ExpectedSaveFuel"];
            self.RealSaveFuel = [dic safeObjectForKey:@"RealSaveFuel"];
            self.FltStatus = [dic safeObjectForKey:@"FltStatus"];
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
            self.items = [NSMutableArray array];
            self.code = [dic safeObjectForKey:@"code"];
            self.msg  = [dic safeObjectForKey:@"msg"];
            self.success = [dic safeObjectForKey:@"success"];
            self.data = [dic safeObjectForKey:@"data"];
            self.items = [self.data safeObjectForKey:@"items"];
            [self.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
