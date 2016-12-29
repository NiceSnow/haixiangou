//
//  RecommendCollectionViewCell.m
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/29.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import "RecommendCollectionViewCell.h"

@interface RecommendCollectionViewCell ()
@property(nonatomic,strong) UIImageView* imageView;
@property(nonatomic,strong) UILabel* namelabel;
@property(nonatomic,strong) UILabel* pricelabel;
@end

@implementation RecommendCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.right.bottom.offset(-10);
        }];
        [self.imageView addSubview:self.namelabel];
        [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(10);
            make.left.right.offset(0);
        }];
        [self.imageView addSubview:self.pricelabel];
        [self.pricelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(10);
            make.left.right.offset(0);
        }];
    }
    return self;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}

-(UILabel *)namelabel{
    if (!_namelabel) {
        _namelabel = [UILabel new];
        _namelabel.text = @"大螃蟹";
        _namelabel.textAlignment = NSTextAlignmentCenter;
    }
    return _namelabel;
}

-(UILabel *)pricelabel{
    if (!_pricelabel) {
        _pricelabel = [UILabel new];
        _pricelabel.text = @"8块钱";
        _pricelabel.textAlignment = NSTextAlignmentCenter;
    }
    return _pricelabel;
}
@end
