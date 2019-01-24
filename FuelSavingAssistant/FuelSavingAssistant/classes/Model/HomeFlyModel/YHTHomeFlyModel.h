//
//  YHTHomeFlyModel.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "YHTBaseModel.h"
@interface YHTHomeFlyModelItem : YHTBaseModelItem

@property (nonatomic, copy) NSString *FltID;
@property (nonatomic, copy) NSString *FltNumber;
@property (nonatomic, copy) NSString *AcType;
@property (nonatomic, copy) NSString *Acreg;
@property (nonatomic, copy) NSString *FltDate;
@property (nonatomic, copy) NSString *DepTime;
@property (nonatomic, copy) NSString *ArrTime;
@property (nonatomic, copy) NSString *DepApt;
@property (nonatomic, copy) NSString *DepApt4Code;
@property (nonatomic, copy) NSString *DepAptStand;
@property (nonatomic, copy) NSString *DepAptIsCBridge;
@property (nonatomic, copy) NSString *ArrApt;
@property (nonatomic, copy) NSString *ArrApt4Code;
@property (nonatomic, copy) NSString *ArrAptStand;
@property (nonatomic, copy) NSString *ArrAptIsCBridge;
@property (nonatomic, copy) NSString *ExpectedSaveFuel;
@property (nonatomic, copy) NSString *RealSaveFuel;
@property (nonatomic, copy) NSString *FltStatus;
-(instancetype)initYHTHomeFlyModelItemWith:(NSDictionary *)dic;

@end
@interface YHTHomeFlyModel : YHTBaseModel

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSMutableArray *flightItems;
@property (nonatomic, strong) NSArray *items;
-(id)initWithYHTHomeFlyModelDataWithDictionary:(NSDictionary*)dic;

@end
