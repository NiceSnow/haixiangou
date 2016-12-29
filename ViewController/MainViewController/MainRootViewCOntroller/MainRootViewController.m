//
//  MainRootViewController.m
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/29.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import "MainRootViewController.h"
#import "SDCycleScrollView.h"
#import "ChannelTableViewCell.h"

@interface MainRootViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic, strong)UISearchBar * searchBar;
@property (nonatomic ,strong) UITableView* tableView;
@property(nonatomic,strong) SDCycleScrollView* BannerView;

@property(nonatomic,strong) NSMutableArray* bannerArray;
@property(nonatomic,strong) NSMutableArray* ChannelArray;
@property(nonatomic,strong) NSMutableArray* RecommendArray;
@property(nonatomic,strong) NSMutableArray* RankingArray;
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
    switch (indexPath.section) {
        case 0:
        {
            NSInteger x = ceil(self.ChannelArray.count/4.0);
            return (screenWidth/4)*4/3 * x;
        }
            break;
        case 1:
        {
            return 45;
        }
            break;
        case 2:
        {
            return 60;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return self.RecommendArray.count;
        }
            break;
        case 2:
        {
            return self.RankingArray.count;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }
    return 45;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        {
            ChannelTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ChannelCell"];
            if (!cell) {
                cell = [[ChannelTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ChannelCell"];
            }
            cell.dataArray = self.ChannelArray;
            return cell;
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        default:
            break;
    }
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"mainCell"];
    }
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    UIView* sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 45)];
    sectionHeaderView.backgroundColor = [UIColor blueColor];
    UILabel* label = [UILabel new];
    if (section == 1) {
        label.text = [NSString stringWithFormat:@"————%@————",@"  个性推荐  "];
    }else if (section == 2){
        label.text = [NSString stringWithFormat:@"————%@————",@"TOP 10排行榜"];
    }
    label.textAlignment = NSTextAlignmentCenter;
    [sectionHeaderView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.offset(0);
    }];
    return sectionHeaderView;
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
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 10)];
        }
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

-(NSMutableArray *)bannerArray{
    if (!_bannerArray) {
        _bannerArray = [NSMutableArray new];
        _bannerArray = [@[@"123",@"456",@"456",@"456",@"456"]mutableCopy];
    }
    return _bannerArray;
}

-(NSMutableArray *)ChannelArray{
    if (!_ChannelArray) {
        _ChannelArray = [NSMutableArray new];
        _ChannelArray = [@[@"123",@"456",@"456",@"456",@"456"]mutableCopy];
    }
    return _ChannelArray;
}

-(NSMutableArray *)RecommendArray{
    if (!_RecommendArray) {
        _RecommendArray = [NSMutableArray new];
        _RecommendArray = [@[@"123",@"456",@"456",@"456",@"456"]mutableCopy];
    }
    return _RecommendArray;
}

-(NSMutableArray *)RankingArray{
    if (!_RankingArray) {
        _RankingArray = [NSMutableArray new];
        _RankingArray = [@[@"123",@"456",@"456",@"456",@"456"]mutableCopy];
    }
    return _RankingArray;
}
@end
