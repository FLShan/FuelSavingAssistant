//
//  YHTAddressBookViewController.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/2/27.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTAddressBookViewController.h"
#import "ContactModel.h"
#import "ContactTableViewCell.h"
#import "ContactDataHelper.h"//根据拼音A~Z~#进行排序的tool
#import "SCIndexViewConfiguration.h"
#import "SCIndexView.h"

@interface YHTAddressBookViewController ()<UITableViewDelegate,UITableViewDataSource,
UISearchBarDelegate,UISearchDisplayDelegate,SCIndexViewDelegate>
{
    NSArray *_rowArr;//row arr
    NSArray *_sectionArr;//section arr
}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *serverDataArr;//数据源
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) UISearchBar *searchBar;//搜索框
@property (nonatomic,strong) UISearchDisplayController *searchDisplayController;//搜索VC
@property (nonatomic, strong) SCIndexView *indexView;
@property (nonatomic, assign) SCIndexViewStyle indexViewStyle;
@property (nonatomic, assign) BOOL translucent;


@end

@implementation YHTAddressBookViewController{
    NSMutableArray *_searchResultArr;//搜索结果Arr
}
+ (UINavigationController *)defaultStudyNavi {
    YHTAddressBookViewController *vc = [[YHTAddressBookViewController alloc]initWithNibName:@"YHTAddressBookViewController" bundle:nil LeftType:navViewLeftButtonTypeNone andTitle:@"通讯录" andRightType:navViewRightButtonTypeNone];
//    YHTAddressBookViewController *vc = [[YHTAddressBookViewController alloc]initWithLeftType:navViewLeftButtonTypeNone andTitle:@"通讯录" andRightType:navViewRightButtonTypeNone];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    return navi;
}



#pragma mark - dataArr(模拟从服务器获取到的数据)
- (NSArray *)serverDataArr{
    if (!_serverDataArr) {
        _serverDataArr=@[@{@"portrait":@"18",@"portrait":@"1",@"name":@"老王"},@{@"portrait":@"2",@"name":@"祖海亮"},@{@"portrait":@"3",@"name":@"张国凯"},@{@"portrait":@"4",@"name":@"任行"},@{@"portrait":@"5",@"name":@"王名玉"},@{@"portrait":@"6",@"name":@"阿坤"},@{@"portrait":@"13",@"name":@"张天"},@{@"portrait":@"8",@"name":@"刘明辉"},@{@"portrait":@"9",@"name":@"罗端"},@{@"portrait":@"10",@"name":@"陈晨"},@{@"portrait":@"11",@"name":@"陈大川"},@{@"portrait":@"12",@"name":@"吴涛"},@{@"portrait":@"7",@"name":@"张志良"},@{@"portrait":@"14",@"name":@"林泰"},@{@"portrait":@"15",@"name":@"常志华"},@{@"portrait":@"16",@"name":@"白冰"},@{@"portrait":@"17",@"name":@"赵一川",@"name":@"欧肖浩"}];
    }
    return _serverDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

    self.translucent = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar_bg"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    self.dataArr=[NSMutableArray array];
    for (NSDictionary *subDic in self.serverDataArr) {
        ContactModel *model=[[ContactModel alloc]initWithDic:subDic];
        [self.dataArr addObject:model];
    }
    
    _rowArr=[ContactDataHelper getFriendListDataBy:self.dataArr];
    _sectionArr=[ContactDataHelper getFriendListSectionBy:[_rowArr mutableCopy]];
    
    //configNav
    [self configNav];
    
//    _searchDisplayController=[[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
//    [_searchDisplayController setDelegate:self];
//    [_searchDisplayController setSearchResultsDataSource:self];
//    [_searchDisplayController setSearchResultsDelegate:self];
    
    _searchResultArr=[NSMutableArray array];
    [self.view addSubview:self.indexView];
    
    // 配置数据
    if ([_sectionArr count]>0) {
        NSMutableArray *indexViewDataSource = [NSMutableArray array];
        for (NSString *str in _sectionArr) {
            [indexViewDataSource addObject:str];
        }
        self.indexView.dataSource = indexViewDataSource.copy;
    }
}

- (void)configNav{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0.0, 0.0, 30.0, 30.0)];
    [btn setBackgroundImage:[UIImage imageNamed:@"contacts_add_friend"] forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:btn]];
}

#pragma mark - setUpView

- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 44)];
        [_searchBar setBackgroundImage:[UIImage imageNamed:@"ic_searchBar_bgImage"]];
        [_searchBar sizeToFit];
        [_searchBar setPlaceholder:@"搜索"];
        [_searchBar.layer setBorderWidth:0.5];
        [_searchBar.layer setBorderColor:[UIColor colorWithRed:229.0/255 green:229.0/255 blue:229.0/255 alpha:1].CGColor];
        [_searchBar setDelegate:self];
        [_searchBar setKeyboardType:UIKeyboardTypeDefault];
    }
    return _searchBar;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0.0, NAVIGATION_BAR_HEIGHT, kWindowW, kWindowH-NAVIGATION_BAR_HEIGHT) style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
        [_tableView setSectionIndexColor:[UIColor darkGrayColor]];
        [_tableView setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1]];
        _tableView.tableHeaderView=self.searchBar;
        //cell无数据时，不显示间隔线
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView setTableFooterView:v];
    }
    return _tableView;
}

#pragma mark - UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //section
    if (tableView==_searchDisplayController.searchResultsTableView) {
        return 1;
    }else{
        return _rowArr.count;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //row
    if (tableView==_searchDisplayController.searchResultsTableView) {
        return _searchResultArr.count;
    }else{
        return [_rowArr[section] count];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //viewforHeader
    id label = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (!label) {
        label = [[UILabel alloc] init];
        [label setFont:[UIFont systemFontOfSize:14.5f]];
        [label setTextColor:[UIColor grayColor]];
        [label setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1]];
    }
    [label setText:[NSString stringWithFormat:@"  %@",_sectionArr[section]]];
    return label;
}
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    if (tableView!=_searchDisplayController.searchResultsTableView) {
//        return _sectionArr;
//    }else{
//        return nil;
//    }
//}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index-1;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView==_searchDisplayController.searchResultsTableView) {
        return 0;
    }else{
        return 22.0;
    }
}

#pragma mark - UITableView dataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde=@"cellIde";
    ContactTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIde];
    if (cell==nil) {
        cell=[[ContactTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (tableView==_searchDisplayController.searchResultsTableView){
        [cell.headImageView setImage:[UIImage imageNamed:[_searchResultArr[indexPath.row] valueForKey:@"portrait"]]];
        [cell.nameLabel setText:[_searchResultArr[indexPath.row] valueForKey:@"name"]];
    }else{
        ContactModel *model=_rowArr[indexPath.section][indexPath.row];
        
        [cell.headImageView setImage:[UIImage imageNamed:model.portrait]];
        [cell.nameLabel setText:model.name];
    }
    
    return cell;
}

#pragma mark searchBar delegate
//searchBar开始编辑时改变取消按钮的文字
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    NSArray *subViews;
    subViews = [(searchBar.subviews[0]) subviews];
    for (id view in subViews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton* cancelbutton = (UIButton* )view;
            [cancelbutton setTitle:@"取消" forState:UIControlStateNormal];
            break;
        }
    }
    searchBar.showsCancelButton = YES;
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    //取消
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
}

#pragma mark searchDisplayController delegate
- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView{
    //cell无数据时，不显示间隔线
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    [tableView setTableFooterView:v];
    
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearchText:searchString
                               scope:[self.searchBar scopeButtonTitles][self.searchBar.selectedScopeButtonIndex]];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
    [self filterContentForSearchText:self.searchBar.text
                               scope:self.searchBar.scopeButtonTitles[searchOption]];
    return YES;
}

#pragma mark - 源字符串内容是否包含或等于要搜索的字符串内容
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    NSMutableArray *tempResults = [NSMutableArray array];
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
    
    for (int i = 0; i < self.dataArr.count; i++) {
        NSString *storeString = [(ContactModel *)self.dataArr[i] name];
        NSString *storeImageString=[(ContactModel *)self.dataArr[i] portrait]?[(ContactModel *)self.dataArr[i] portrait]:@"";
        
        NSRange storeRange = NSMakeRange(0, storeString.length);
        
        NSRange foundRange = [storeString rangeOfString:searchText options:searchOptions range:storeRange];
        if (foundRange.length) {
            NSDictionary *dic=@{@"name":storeString,@"portrait":storeImageString};
            
            [tempResults addObject:dic];
        }
        
    }
    [_searchResultArr removeAllObjects];
    [_searchResultArr addObjectsFromArray:tempResults];
}

- (SCIndexView *)indexView
{
    if (!_indexView) {
        _indexView = [[SCIndexView alloc] initWithTableView:_tableView configuration:[SCIndexViewConfiguration configurationWithIndexViewStyle:self.indexViewStyle]];
        _indexView.translucentForTableViewInNavigationBar = self.translucent;
        _indexView.delegate = self;
    }
    return _indexView;
}
#pragma mark - SCIndexViewDelegate
- (void)indexView:(SCIndexView *)indexView didSelectAtSection:(NSUInteger)section
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end