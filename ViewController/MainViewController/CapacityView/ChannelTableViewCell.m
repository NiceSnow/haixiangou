//
//  ChannelTableViewCell.m
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/29.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import "ChannelTableViewCell.h"
#import "ChannelCollectionViewCell.h"

@interface ChannelTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,retain) UICollectionView* CollectionView;
@end

@implementation ChannelTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.CollectionView];
        [self.CollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.offset(0);
        }];
    }
    return self;
}


-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    [self.CollectionView reloadData];
}

#pragma mark -- collectionView
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
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
    ChannelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
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
        [_CollectionView registerClass:[ChannelCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _CollectionView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
