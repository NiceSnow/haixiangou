//
//  ClassRootViewController.m
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/29.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import "ClassRootViewController.h"
#import "ClassCollectionViewCell.h"

@interface ClassRootViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,retain) UICollectionView* CollectionView;
@property(nonatomic,strong) NSMutableArray* dataArray;
@end

@implementation ClassRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分类";
    [self.view addSubview:self.CollectionView];
    [self.CollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.offset(0);
    }];
    // Do any additional setup after loading the view.
}

#pragma mark -- collectionView
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;//self.dataArray.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    ClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    //    [cell updateWithIndex:indexPath.row delegate:self];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    return cell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(screenWidth / 4 , (screenWidth/4)*4/3);
}

#pragma mark -- end collectionView

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionView *)CollectionView{
    if (!_CollectionView) {
        UICollectionViewFlowLayout* FlowLayout = [[UICollectionViewFlowLayout alloc]init];
        [FlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        FlowLayout.minimumLineSpacing =0;
        FlowLayout.minimumInteritemSpacing = 0;
        _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:FlowLayout];
        _CollectionView.showsVerticalScrollIndicator = NO;
        _CollectionView.backgroundColor = [UIColor whiteColor];
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        [_CollectionView registerClass:[ClassCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _CollectionView;
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
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
