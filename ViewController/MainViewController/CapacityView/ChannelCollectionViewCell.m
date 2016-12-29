//
//  ChannelCollectionViewCell.m
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/29.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import "ChannelCollectionViewCell.h"


@interface ChannelCollectionViewCell ()
@property(nonatomic,strong) UIImageView* imageView;
@property(nonatomic,strong) UILabel* label;
@end

@implementation ChannelCollectionViewCell
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
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
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

-(UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"限时抢购";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}
@end
