//
//  YHTBeforReportViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/24.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTBeforReportViewController.h"
#import "YHTSlideTableViewCell.h"
#import "YHTFlightMapViewController.h"
#import "YHTMyDataViewController.h"


@interface YHTBeforReportViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *beforReportTableVIew;

@property (strong, nonatomic) IBOutlet UIView *beforReportHeader;
@property (strong, nonatomic) IBOutlet UIView *beforeReportFooter;
@property (strong, nonatomic) IBOutlet UIView *afterReportHeader;
@property (strong, nonatomic) IBOutlet UIView *afterReportFooter;


#pragma mark ---------hangqian--------

@property (strong, nonatomic) IBOutlet UILabel *hangbanhaoLabel;
@property (strong, nonatomic) IBOutlet UILabel *feijihaoLabel;
@property (strong, nonatomic) IBOutlet UILabel *jixingLabel;
@property (strong, nonatomic) IBOutlet UILabel *qifeijichang4Label;
@property (strong, nonatomic) IBOutlet UILabel *jiangluojichang4Label;
@property (strong, nonatomic) IBOutlet UILabel *qifeijichangLabel;
@property (strong, nonatomic) IBOutlet UILabel *jiangluojichangLabel;
@property (strong, nonatomic) IBOutlet UILabel *jihuaqifei;
@property (strong, nonatomic) IBOutlet UILabel *jihuadaoda;
@property (strong, nonatomic) IBOutlet UILabel *yujiqifei;
@property (strong, nonatomic) IBOutlet UILabel *yujidaoda;
@property (strong, nonatomic) IBOutlet UILabel *shijiqifei;
@property (strong, nonatomic) IBOutlet UILabel *shijidaoda;
@property (strong, nonatomic) IBOutlet UILabel *tingjiwei;
@property (strong, nonatomic) IBOutlet UILabel *tingjiwei1;
@property (strong, nonatomic) IBOutlet UILabel *guozhanshijian;
@property (strong, nonatomic) IBOutlet UILabel *jizhunguozhanshijian;

@property (strong, nonatomic) IBOutlet UILabel *zuidayuqijieyouliang;
@property (strong, nonatomic) IBOutlet UILabel *yujijieyouliang;
@property (strong, nonatomic) IBOutlet UILabel *jieyoubiaoji;
@property (strong, nonatomic) IBOutlet UILabel *APD;
@property (strong, nonatomic) IBOutlet UILabel *jizhunAPD;
@property (strong, nonatomic) IBOutlet UILabel *yezai;
@property (strong, nonatomic) IBOutlet UILabel *jizhunyezai;
@property (strong, nonatomic) IBOutlet UILabel *juli;
@property (strong, nonatomic) IBOutlet UILabel *jizhunjuli;
@property (strong, nonatomic) IBOutlet UILabel *kongzhonghaoyou;
@property (strong, nonatomic) IBOutlet UILabel *xunhanggaoduceng;
@property (strong, nonatomic) IBOutlet UILabel *CIzhixinglv;
@property (strong, nonatomic) IBOutlet UILabel *jianyibencihangban;
@property (strong, nonatomic) IBOutlet UILabel *lishipingjunguozhanshijian;
@property (strong, nonatomic) IBOutlet UILabel *jianyihangbanshijidaodashijian;



#pragma mark ---------hanghou--------
@property (strong, nonatomic) IBOutlet UILabel *hangbanhaoLabel1;
@property (strong, nonatomic) IBOutlet UILabel *feijihaoLabel1;
@property (strong, nonatomic) IBOutlet UILabel *jixingLabel1;
@property (strong, nonatomic) IBOutlet UILabel *qifeijichang4Label1;
@property (strong, nonatomic) IBOutlet UILabel *jiangluojichang4Label1;
@property (strong, nonatomic) IBOutlet UILabel *qifeijichangLabel1;
@property (strong, nonatomic) IBOutlet UILabel *jiangluojichangLabel1;
@property (strong, nonatomic) IBOutlet UILabel *jihuaqifei1;
@property (strong, nonatomic) IBOutlet UILabel *jihuadaoda1;
@property (strong, nonatomic) IBOutlet UILabel *shijiqifei1;
@property (strong, nonatomic) IBOutlet UILabel *shijidaoda1;
@property (strong, nonatomic) IBOutlet UILabel *tingjiweiAfter;
@property (strong, nonatomic) IBOutlet UILabel *tingjiweiAfter1;
@property (strong, nonatomic) IBOutlet UILabel *guozhanshijianAfter;
@property (strong, nonatomic) IBOutlet UILabel *jizhunguozhanshijianAfter;

@property (strong, nonatomic) IBOutlet UILabel *jieyouTotal;
@property (strong, nonatomic) IBOutlet UILabel *caozuoJL;
@property (strong, nonatomic) IBOutlet UILabel *hangbanJL;
@property (strong, nonatomic) IBOutlet UILabel *yunxingJL;
@property (strong, nonatomic) IBOutlet UILabel *shishi;
@property (strong, nonatomic) IBOutlet UILabel *pingjunzhiliang;
@property (strong, nonatomic) IBOutlet UILabel *jieyouzongliang;
@property (strong, nonatomic) IBOutlet UILabel *gerenfenpei;
@property (strong, nonatomic) IBOutlet UILabel *jiangli1;

@property (strong, nonatomic) IBOutlet UILabel *kongzhonghaoyou1;
@property (strong, nonatomic) IBOutlet UILabel *hangbanjieyou;
@property (strong, nonatomic) IBOutlet UILabel *gerenfenpei1;
@property (strong, nonatomic) IBOutlet UILabel *jiangli2;
@property (strong, nonatomic) IBOutlet UILabel *feixingshijian;
@property (strong, nonatomic) IBOutlet UILabel *xunhanggaodudachengxishu;
@property (strong, nonatomic) IBOutlet UILabel *CIdachenglv;
@property (strong, nonatomic) IBOutlet UILabel *hangbanzhengdianxishu;
@property (strong, nonatomic) IBOutlet UILabel *guozhanzhengchangxishu;
@property (strong, nonatomic) IBOutlet UILabel *jiangli3;
#pragma mark    航班耗油总结
@property (strong, nonatomic) IBOutlet UILabel *kongzhongyouliang;
@property (strong, nonatomic) IBOutlet UILabel *jiesheng;
@property (strong, nonatomic) IBOutlet UILabel *APD1;
@property (strong, nonatomic) IBOutlet UILabel *jizhunAPD1;
@property (strong, nonatomic) IBOutlet UILabel *yezai1;
@property (strong, nonatomic) IBOutlet UILabel *jizhunyezai1;
@property (strong, nonatomic) IBOutlet UILabel *juli1;
@property (strong, nonatomic) IBOutlet UILabel *jizhunjuli1;
@property (strong, nonatomic) IBOutlet UILabel *kongzhongyouhao;
@property (strong, nonatomic) IBOutlet UILabel *jizhunkongzhongyouhao;
#pragma mark    运行质量考核总结
@property (strong, nonatomic) IBOutlet UILabel *xunhanggaoduceng1;
@property (strong, nonatomic) IBOutlet UILabel *CIzhixinglv1;
@property (strong, nonatomic) IBOutlet UILabel *guozhanshijian1;
@property (strong, nonatomic) IBOutlet UILabel *shida;
@property (strong, nonatomic) IBOutlet UILabel *yuda;
@property (strong, nonatomic) IBOutlet UILabel *jida;



@end

@implementation YHTBeforReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([self.model.zhuangtai isEqualToString:@"1"] || [self.model.zhuangtai isEqualToString:@"2"]) {
        self.beforReportTableVIew.tableHeaderView = self.beforReportHeader;
        self.beforReportTableVIew.tableFooterView = self.beforeReportFooter;
        self.hangbanhaoLabel.text = self.model.hangbanhao;
        self.feijihaoLabel.text = self.model.feijihao;
        self.jixingLabel.text = self.model.duanjixing;
        self.qifeijichang4Label.text = self.model.qifeijichang4;
        self.qifeijichangLabel.text = self.model.qifeijichang;
        self.jiangluojichangLabel.text = self.model.jiangluojichang;
        self.jiangluojichang4Label.text = self.model.jiangluojichang4;
        self.jihuaqifei.text = self.model.jihuaqifei;
        self.jihuadaoda.text = self.model.jihuadaoda;
        self.yujiqifei.text = self.model.yujiqifei;
        self.yujidaoda.text = self.model.yujidaoda;
        self.shijiqifei.text = self.model.shijiqifei;
        self.tingjiwei.text = self.model.chugangkaoqiao;
        self.tingjiwei1.text = self.model.jingangkaoqiao;
        self.guozhanshijian.text = [NSString stringWithFormat:@"%@min(基准)",self.model.guozhanshijianjizhun] ;
        self.guozhanshijian1.text = [NSString stringWithFormat:@"%@min(计划)",self.model.guozhanshijianjihua] ;
//        self.zuidayuqijieyouliang.text = self.model.zuida;
        self.jieyoubiaoji.text = self.model.jieyoubiaoji;
        self.APD.text = self.model.APD;
        self.jizhunAPD.text = self.model.jizhunAPD;
        self.yezai.text = self.model.jizhunyezai;
        self.jizhunyezai.text = self.model.jizhunyezai;
        self.juli.text = self.model.hangduanjuli;
        self.jizhunjuli.text = self.model.jizhunhangduanjuli;
        self.kongzhonghaoyou.text = self.model.jizhunkongzhongyouhao;
        self.xunhanggaoduceng.text = self.model.jizhunxunhanggaodu;
//        self.CIzhixinglv.text = self.model.
    }else{
        self.beforReportTableVIew.tableHeaderView = self.afterReportHeader;
        self.beforReportTableVIew.tableFooterView = self.afterReportFooter;

        self.hangbanhaoLabel1.text = self.model.hangbanhao;
        self.feijihaoLabel1.text = self.model.feijihao;
        self.jixingLabel1.text = self.model.duanjixing;
        self.qifeijichang4Label1.text = self.model.qifeijichang4;
        self.qifeijichangLabel1.text = self.model.qifeijichang;
        self.jiangluojichangLabel1.text = self.model.jiangluojichang;
        self.jiangluojichang4Label1.text = self.model.jiangluojichang4;
        self.jihuaqifei1.text = self.model.jihuaqifei;
        self.jihuadaoda1.text = self.model.jihuadaoda;
        self.shijiqifei1.text = self.model.shijiqifei;
        self.shijidaoda1.text = self.model.shijidaoda;
        self.tingjiweiAfter.text = self.model.chugangkaoqiao;
        self.tingjiweiAfter1.text = self.model.jingangkaoqiao;
        
        
        if ([self.model.hangbanhao isEqualToString:@"HO1252"]) {
            self.jieyouTotal.text = @"472";
            self.caozuoJL.text = @"188.8";
            self.hangbanJL.text = @"236";
            self.yunxingJL.text = @"47.2";
            self.shishi.text = @"16/16";
            self.pingjunzhiliang.text = @"81";
            self.jieyouzongliang.text = @"472kg";
            self.gerenfenpei.text = @"236kg";
            self.jiangli1.text = @"188元";
            self.kongzhonghaoyou1.text = @"5032kg";
            self.hangbanjieyou.text = @"608kg";
            self.gerenfenpei1.text = @"274kg";
            self.jiangli2.text = @"236元";
            self.feixingshijian.text = @"1h5m";
            self.xunhanggaodudachengxishu.text = @"2";
            self.CIdachenglv.text = @"1";
            self.hangbanzhengdianxishu.text = @"2";
            self.guozhanzhengchangxishu.text = @"1";
            self.jiangli3.text = @"47.2元";
            self.jiesheng.text = @"608kg";
        }else{
            self.jieyouTotal.text = @"314";
            self.caozuoJL.text = @"125.6";
            self.hangbanJL.text = @"157";
            self.yunxingJL.text = @"31.4";
            self.shishi.text = @"16/16";
            self.pingjunzhiliang.text = @"79";
            self.jieyouzongliang.text = @"467kg";
            self.gerenfenpei.text = @"199kg";
            self.jiangli1.text = @"125.6元";
            self.kongzhonghaoyou1.text = @"5513kg";
            self.hangbanjieyou.text = @"562kg";
            self.gerenfenpei1.text = @"193kg";
            self.jiangli2.text = @"157元";
            self.feixingshijian.text = @"1h4m";
            self.xunhanggaodudachengxishu.text = @"1";
            self.CIdachenglv.text = @"1";
            self.hangbanzhengdianxishu.text = @"2";
            self.guozhanzhengchangxishu.text = @"2";
            self.jiangli3.text = @"31.4元";
            self.jiesheng.text = @"562kg";
        }
        
        
        
//        self.jieyouTotal.text = self.model
       
        
        self.kongzhongyouliang.text = self.model.jieyoubiaoji;
//        self.jiesheng.text = self.model.jiesheng
        self.APD1.text = self.model.APD;
        self.jizhunAPD1.text = self.model.jizhunAPD;
        self.yezai1.text = self.model.yezai;
        self.jizhunyezai1.text = self.model.jizhunAPD;
        self.juli1.text = self.model.hangduanjuli;
        self.jizhunjuli1.text = self.model.jizhunhangduanjuli;
        self.kongzhongyouhao.text = self.model.shijikongzhongyouhao;
        self.jizhunkongzhongyouhao.text = self.model.jizhunkongzhongyouhao;
        self.xunhanggaoduceng1.text = self.model.xunhanggaodu;
//        self.CIzhixinglv1.text = self.model.
//        self.guozhanshijian1.text = self.model.guozhanshijian
        self.shida.text =[NSString stringWithFormat:@"实达 %@", self.model.shijidaoda];
        self.yuda.text = [NSString stringWithFormat:@"实达 %@", self.model.yujidaoda];
        self.jida.text = [NSString stringWithFormat:@"实达 %@", self.model.jihuadaoda];
    }
//    self.navView.backgroundColor = YHTGreenColor;
    self.navView.leftType = navViewLeftButtonTypeDefault;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**
 *  设置每个分区显示的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *globalPriceCellIdentifier = @"YHTSlideTableViewCell";
    YHTSlideTableViewCell *cell = (YHTSlideTableViewCell*)[tableView dequeueReusableCellWithIdentifier:globalPriceCellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YHTSlideTableViewCell" owner:self options:nil] lastObject];
    }
    [cell freshYHTSlideTableViewCell:self.model];
    cell.DidClickMapBtnBlock = ^(){
        NSLog(@"代码块中进入x数据节油报告");
        YHTFlightMapViewController *reportVC = [[YHTFlightMapViewController alloc]initWithNibName:@"YHTFlightMapViewController" bundle:nil LeftType:navViewLeftButtonTypeDefault andTitle:@"ZBAA - ZSSS" andRightType:navViewRightButtonTypeNone];
        [reportVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:reportVC animated:YES];
    };
    return cell;
}

- (IBAction)ClickMydataBtn:(id)sender {
    YHTMyDataViewController *reportVC = [[YHTMyDataViewController alloc]initWithNibName:@"YHTMyDataViewController" bundle:nil LeftType:navViewLeftButtonTypeWhiteBack andTitle:@"我的数据" andRightType:navViewRightButtonTypeNone];
    [reportVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:reportVC animated:YES];
}

/**
 *  设置单元格的高度
 *  单元格默认高度44像素
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 850.0f;
}
@end
