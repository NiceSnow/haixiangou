//
//  ShoppingTableViewCell.m
//  haixiangou
//
//  Created by 博睿精实 on 2017/1/3.
//  Copyright © 2017年 博睿精实. All rights reserved.
//

#import "ShoppingTableViewCell.h"

@interface ShoppingTableViewCell ()
@property(nonatomic,strong) UIButton* leftBtn;
@property(nonatomic,strong) UIImageView* headerImageView;
@property(nonatomic,strong) UILabel* nameLabel;
@property(nonatomic,strong) UIButton* plusBtn;
@property(nonatomic,strong) UIButton* minusBtn;
@property(nonatomic,strong) UILabel* countLabel;
@property(nonatomic,strong) UILabel* PriceLabel;
@end

@implementation ShoppingTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.leftBtn];
        [self addSubview:self.headerImageView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.minusBtn];
        [self addSubview:self.countLabel];
        [self addSubview:self.plusBtn];
        [self addSubview:self.PriceLabel];
        [self makeConstraints];
    }
    return self;
}

-(void)makeConstraints{
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.centerY.equalTo(self);
        make.width.height.equalTo(@20);
    }];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.bottom.offset(-10);
        make.left.equalTo(self.leftBtn.mas_right).offset(10);
        make.width.equalTo(self.headerImageView.mas_height);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImageView.mas_top);
        make.left.equalTo(self.headerImageView.mas_right).offset(10);
    }];
    [self.minusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headerImageView.mas_bottom);
        make.left.equalTo(self.nameLabel.mas_left);
        make.width.height.equalTo(@20);
    }];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.minusBtn.mas_right);
        make.centerY.equalTo(self.minusBtn.mas_centerY);
        make.width.mas_greaterThanOrEqualTo(45);
    }];
    [self.plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countLabel.mas_right);
        make.centerY.equalTo(self.minusBtn.mas_centerY);
        make.width.height.equalTo(@20);
    }];
    [self.PriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.bottom.equalTo(self.countLabel.mas_bottom);
    }];
}

-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
        _leftBtn.backgroundColor = [UIColor blueColor];
    }
    return _leftBtn;
}

-(UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [UIImageView new];
        _headerImageView.backgroundColor = [UIColor redColor];
    }
    return _headerImageView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"大闸蟹";
        _nameLabel.backgroundColor = [UIColor blueColor];
    }
    return _nameLabel;
}

-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [UILabel new];
        _countLabel.text = @"1";
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.backgroundColor = [UIColor redColor];
    }
    return _countLabel;
}

-(UILabel *)PriceLabel{
    if (!_PriceLabel) {
        _PriceLabel = [UILabel new];
        _PriceLabel.text = @"39元";
        _PriceLabel.textAlignment = NSTextAlignmentRight;
        _PriceLabel.backgroundColor = [UIColor blueColor];
    }
    return _PriceLabel;
}

-(UIButton *)minusBtn{
    if (!_minusBtn) {
        _minusBtn = [UIButton new];
        _minusBtn.backgroundColor = [UIColor purpleColor];
    }
    return _minusBtn;
}

-(UIButton *)plusBtn{
    if (!_plusBtn) {
        _plusBtn = [UIButton new];
        _plusBtn.backgroundColor = [UIColor blackColor];
    }
    return _plusBtn;
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
