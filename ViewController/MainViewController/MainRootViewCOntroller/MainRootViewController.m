//
//  MainRootViewController.m
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/29.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import "MainRootViewController.h"
#import "SDCycleScrollView.h"

@interface MainRootViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic, strong)UISearchBar * searchBar;
@property (nonatomic ,strong) UITableView* tableView;
@property(nonatomic,strong) SDCycleScrollView* BannerView;
@end

@implementation MainRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    self.navigationItem.titleView = self.searchBar;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.offset(0);
    }];
    // Do any additional setup after loading the view.
}

#pragma mark -- tableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"mainCell"];
    }
    return cell;
}

#pragma mark -- end TableView


#pragma mark -- SDCycleView Delegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectBannerAtIndex:(NSInteger)index{
    
}
#pragma mark -- end SDCycleView

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 300, 44)];
        _searchBar.placeholder = @"好吃的海鲜都在这里~";
        [_searchBar sizeToFit];
        _searchBar.keyboardType = UIKeyboardTypeDefault;
        _searchBar.returnKeyType =  UIReturnKeySearch;
        _searchBar.delegate = self;
        [_searchBar setImage:[UIImage imageNamed:@"search"] forSearchBarIcon:(UISearchBarIconSearch) state:UIControlStateNormal];
        [_searchBar setImage:[UIImage imageNamed:@"clearn"] forSearchBarIcon:(UISearchBarIconClear) state:UIControlStateNormal];
        
        UITextField *textfield = [_searchBar valueForKey:@"_searchField"];
        textfield.layer.borderColor = [UIColor whiteColor].CGColor;
        textfield.layer.borderWidth = 1;
        textfield.backgroundColor = [UIColor clearColor];
        textfield.layer.cornerRadius = 5;
        textfield.textColor = [UIColor whiteColor];
        [textfield setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        
    }
    return _searchBar;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.tableHeaderView = self.BannerView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        //        由于刷新  不采用自动获取高度
        //        _tableView.estimatedRowHeight = 10;
        //        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 10)];
        }
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(courseRecommend)];
    }
    return _tableView;
}

-(SDCycleScrollView *)BannerView{
    if (!_BannerView) {
        NSMutableArray* imageArray = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
        _BannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screenWidth, screenHeight/4) imagesGroup:imageArray];
        _BannerView.delegate = self;
        _BannerView.tag = 1024;
        _BannerView.autoScrollTimeInterval = 2.0;
    }
    return _BannerView;
}


@end
