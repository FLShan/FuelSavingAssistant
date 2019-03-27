//
//  YHTFlightMapViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/23.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTFlightMapViewController.h"
#import "WSLRollView.h"
#import "YHTPaopaoView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import "WSLRollViewHorizontalCell.h"
#define KRollViewHeight 150

//@interface WSLRollViewHorizontalCell : WSLRollViewCell
//@property (strong, nonatomic) UILabel * titleLabel;
//@end
//
//@implementation WSLRollViewHorizontalCell
//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self == [super initWithFrame:frame]) {
//        self.titleLabel = [[UILabel alloc] init];
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.titleLabel.font = [UIFont systemFontOfSize:30];
//        self.titleLabel.userInteractionEnabled = YES;
//        [self.contentView addSubview:self.titleLabel];
//        self.contentView.clipsToBounds = YES;
//        //        self.contentView.autoresizesSubviews = YES;
//        //        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    }
//    return self;
//}
//- (void)refreshData{
//    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//}
//@end



@interface YHTFlightMapViewController ()<BMKMapViewDelegate,WSLRollViewDelegate>
{
    NSMutableArray * _array;
}

@property (strong, nonatomic) IBOutlet BMKMapView *mapView;

@property (nonatomic, strong) UIScrollView * bgScroll;




@end

@implementation YHTFlightMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
//    _mapView.delegate = self;
//    [self.view addSubview:_mapView];
    
    [self createUI];
    [self addCircle];
    [self addPointLabel];
   
}

- (void)createUI{
    
    _array = [NSMutableArray array];
    for (int i = 0 ; i < 6; i++) {
        [_array addObject:@{@"title":[NSString stringWithFormat:@"第%d页",i],@"color":[UIColor whiteColor],@"width":@(arc4random()%(int)(kWindowW)),@"height":@(KRollViewHeight)}];
    }
    
    WSLRollView * pageRollView = [[WSLRollView alloc] initWithFrame:CGRectMake(0,kWindowH - KRollViewHeight - 20 , kWindowW, KRollViewHeight)];
    pageRollView.sourceArray = [NSMutableArray arrayWithArray:_array];
    pageRollView.backgroundColor = [UIColor clearColor];
    pageRollView.scrollStyle = WSLRollViewScrollStylePage;
    pageRollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    pageRollView.interval = 0;
    pageRollView.startingPosition = 0;
    pageRollView.loopEnabled = NO;
    pageRollView.delegate = self;
//    [pageRollView registerNib:[UINib nibWithNibName:NSStringFromClass([WSLRollViewHorizontalCell class]):[NSBundle mainBundle]] forCellWithReuseIdentifier:@"PageRollID"];
    [pageRollView registerNib:[UINib nibWithNibName:NSStringFromClass([WSLRollViewHorizontalCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"PageRollID"];
//    [pageRollView registerClass:[WSLRollViewHorizontalCell class] forCellWithReuseIdentifier:@"PageRollID"];
    [self.view addSubview:pageRollView];
    
    [self.mapView setZoomLevel:7];
    
    CLLocationCoordinate2D coor[4] = {0};
    coor[0].longitude = 123.349442;
    coor[0].latitude = 41.794481;
    
    coor[1].longitude = 116.395524;
    coor[1].latitude = 39.931414;
    
    coor[2].longitude = 117.140354;
    coor[2].latitude = 36.572421;
    
    coor[3].longitude = 118.777049;
    coor[3].latitude = 32.058853;
    BMKPolyline *polyline = [BMKPolyline polylineWithCoordinates:coor count:4];
    [_mapView addOverlay:polyline];
    
}

- (void)addCircle{
    // 添加圆形覆盖物
    CLLocationCoordinate2D coor;
    coor.latitude = 31.261;
    coor.longitude = 121.416382;
    BMKCircle *circle1 = [BMKCircle circleWithCenterCoordinate:coor radius:50000];
     BMKCircle *circle2 = [BMKCircle circleWithCenterCoordinate:coor radius:100000];
     BMKCircle *circle3 = [BMKCircle circleWithCenterCoordinate:coor radius:150000];
     BMKCircle *circle4 = [BMKCircle circleWithCenterCoordinate:coor radius:200000];
    
    [_mapView addOverlay:circle1];
    [_mapView addOverlay:circle2];
    [_mapView addOverlay:circle3];
    [_mapView addOverlay:circle4];
}
- (void)addPointLabel{
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    annotation.coordinate = CLLocationCoordinate2DMake(39.931414, 116.395524);
    //设置标注的标题
    annotation.title = @"B12";
    //副标题
    [_mapView addAnnotation:annotation];
}
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
        BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.strokeColor = YHTROUTBlueColor;
        polylineView.lineWidth = 0.5;
        
        return polylineView;
    }
    if ([overlay isKindOfClass:[BMKCircle class]]){
        BMKCircleView* circleView = [[BMKCircleView alloc] initWithOverlay:overlay];
//        circleView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.5];
        circleView.strokeColor = YHTROUTBlueColor;
        circleView.lineWidth = 0.5;
        
        return circleView;
    }
    return nil;
}

//- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//        BMKPinAnnotationView*annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil) {
//            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.pinColor = BMKPinAnnotationColorRed;
//        annotationView.canShowCallout= YES;      //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop=YES;         //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;          //设置标注可以拖动，默认为NO
//        return annotationView;
//    }
//    return nil;
//}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation
                                                           reuseIdentifier:reuseIndetifier];
        }
        
        annotationView.image = [UIImage imageNamed:@"poi_icon"];
        
        annotationView.canShowCallout = YES;
        
//        [self.mapView mapForceRefresh];
        YHTPaopaoView *customPopView = [[YHTPaopaoView alloc] init];
        customPopView.frame = CGRectMake(0, 0, 60.0f, 30.0f);
//        customPopView.image = [UIImage imageNamed:@"poi_icon"];
        customPopView.title = @"北京";
        
        BMKActionPaopaoView *pView = [[BMKActionPaopaoView alloc] initWithCustomView:customPopView];
        pView.backgroundColor = [UIColor whiteColor];
        pView.frame = customPopView.frame;
        annotationView.paopaoView = pView;
        
//        [annotationView setSelected:YES animated:YES];
        return annotationView;
    }
    return nil;
}
- (IBAction)didClickmapType:(UIButton *)sender {
    [_mapView setMapType:BMKMapTypeStandard];
}


- (IBAction)didClickmapTypeWX:(UIButton *)sender {
    [_mapView setMapType:BMKMapTypeSatellite];
}


#pragma mark - WSLRollViewDelegate

//返回itemSize
- (CGSize)rollView:(WSLRollView *)rollView sizeForItemAtIndex:(NSInteger)index{
    if (rollView.scrollStyle == WSLRollViewScrollStylePage){
        //        return CGSizeMake(SCREEN_WIDTH, KRollViewHeight);
        //        return CGSizeMake((SCREEN_WIDTH - [self spaceOfItemInRollView:rollView] * 2)/2.0, KRollViewHeight);
        return CGSizeMake(300, KRollViewHeight);
    }else{
        NSNumber * width = _array[index][@"width"];
        NSNumber * height = _array[index][@"height"];
        return CGSizeMake([width floatValue], [height floatValue]);
    }
}

//间隔
- (CGFloat)spaceOfItemInRollView:(WSLRollView *)rollView{
    if (rollView.scrollStyle == WSLRollViewScrollStylePage){
        return 10;
    }else{
        return 10;
    }
}

//内边距
- (UIEdgeInsets)paddingOfRollView:(WSLRollView *)rollView{
    if (rollView.scrollStyle == WSLRollViewScrollStylePage){
        return UIEdgeInsetsMake(0,[self spaceOfItemInRollView:rollView],0,[self spaceOfItemInRollView:rollView]);
    }else{
        return UIEdgeInsetsMake(0,10,0,10);
    }
}

//点击事件
- (void)rollView:(WSLRollView *)rollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@" 点击了 %ld",(long)index);
}

//当前页码
- (void)rollView:(WSLRollView *)rollView didRollItemToIndex:(NSInteger)currentIndex{
    NSLog(@"当前页码 %ld",(long)currentIndex);
}

//返回自定义cell样式
-(WSLRollViewCell *)rollView:(WSLRollView *)rollView cellForItemAtIndex:(NSInteger)index{
    
    WSLRollViewHorizontalCell * cell;
    if (rollView.scrollStyle == WSLRollViewScrollStylePage){
        cell = (WSLRollViewHorizontalCell *)[rollView dequeueReusableCellWithReuseIdentifier:@"PageRollID" forIndex:index];
    }else{
        cell = (WSLRollViewHorizontalCell *)[rollView dequeueReusableCellWithReuseIdentifier:@"StepRollID" forIndex:index];
    }
    
    cell.backgroundColor = _array[index][@"color"];
    cell.titleLabel.text = _array[index][@"title"];
    [cell refreshData];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
