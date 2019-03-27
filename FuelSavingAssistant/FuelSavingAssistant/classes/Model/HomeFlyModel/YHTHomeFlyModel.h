//
//  YHTHomeFlyModel.h
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/17.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "YHTBaseModel.h"
@interface YHTHomeFlyModelItem : YHTBaseModelItem


@property (nonatomic, copy) NSString *Fid;
@property (nonatomic, copy) NSString *duanjixing;
@property (nonatomic, copy) NSString *feijihao;
@property (nonatomic, copy) NSString *hangbanhao;
@property (nonatomic, copy) NSString *qifeijichang;
@property (nonatomic, copy) NSString *qifeijichang4;
@property (nonatomic, copy) NSString *zhuangtai;
@property (nonatomic, copy) NSString *jingangkaoqiao;
@property (nonatomic, copy) NSString *chugangkaoqiao;
@property (nonatomic, copy) NSString *jizhunkongzhongyouhao;
@property (nonatomic, copy) NSString *jieyoubiaoji;
@property (nonatomic, copy) NSString *shijikongzhongyouhao;
@property (nonatomic, copy) NSString *jizhunAPD;
@property (nonatomic, copy) NSString *APD;
@property (nonatomic, copy) NSString *jizhunxunhanggaodu;
@property (nonatomic, copy) NSString *xunhanggaodu;
@property (nonatomic, copy) NSString *jizhunyezai;
@property (nonatomic, copy) NSString *yezai;
@property (nonatomic, copy) NSString *jizhunhangduanjuli;
@property (nonatomic, copy) NSString *hangduanjuli;
@property (nonatomic, copy) NSString *shijidaoda;
@property (nonatomic, copy) NSString *shijiqifei;
@property (nonatomic, copy) NSString *yujidaoda;
@property (nonatomic, copy) NSString *yujiqifei;
@property (nonatomic, copy) NSString *jihuadaoda;
@property (nonatomic, copy) NSString *jihuaqifei;
@property (nonatomic, copy) NSString *jiangluojichang4;
@property (nonatomic, copy) NSString *jiangluojichang;

@property (nonatomic, copy) NSString *guozhanshijianjizhun;
@property (nonatomic, copy) NSString *guozhanshijianjihua;
@property (nonatomic, copy) NSString *guozhanshijianshiji;


-(instancetype)initYHTHomeFlyModelItemWith:(NSDictionary *)dic;

@end

@interface YHTHomeFlyFlightsModel : YHTBaseModel


@property (nonatomic, strong) NSMutableArray *flightItems;
-(id)initWithYHTHomeFlyFlightsModelDataWithDictionary:(NSDictionary*)dic;

@end
@interface YHTHomeFlyModel : YHTBaseModel


@property (nonatomic, strong) NSMutableArray *flightDayItems;
-(id)initWithYHTHomeFlyModelDataWithDictionary:(NSDictionary*)dic;

@end
