//
//  ClassCollectionViewCell.m
//  haixiangou
//
//  Created by 博睿精实 on 2017/1/3.
//  Copyright © 2017年 博睿精实. All rights reserved.
//

#import "ClassCollectionViewCell.h"

@interface ClassCollectionViewCell ()
@property(nonatomic,strong) UIImageView* imageView;
@end

@implementation ClassCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.right.offset(-10);
            make.height.equalTo(self.imageView.mas_width);
        }];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
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

@end
