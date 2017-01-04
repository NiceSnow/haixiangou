//
//  RankTableViewCell.m
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/30.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import "RankTableViewCell.h"

@interface RankTableViewCell ()
@property(nonatomic,strong) UIImageView* headerView;
@property(nonatomic,strong) UILabel* nameLabel;
@property(nonatomic,strong) UILabel* descriptionLabel;
@property(nonatomic,strong) UILabel* priceLabel;
@end

@implementation RankTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.headerView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.descriptionLabel];
        [self addSubview:self.priceLabel];
        [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.left.offset(0);
            make.width.equalTo(self.headerView.mas_height);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.offset(0);
            make.left.equalTo(self.headerView.mas_right).offset(10);
        }];
        [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(0);
            make.top.equalTo(self.nameLabel.mas_bottom);
            make.left.equalTo(self.headerView.mas_right).offset(10);
        }];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(0);
            make.top.equalTo(self.descriptionLabel.mas_bottom);
            make.left.equalTo(self.headerView.mas_right).offset(10);
            make.bottom.offset(0);
        }];
    }
    return self;
}

-(UIImageView *)headerView{
    if (!_headerView) {
        _headerView = [UIImageView new];
        _headerView.backgroundColor = [UIColor redColor];
    }
    return _headerView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"大螃蟹大海螺";
    }
    return _nameLabel;
}

-(UILabel *)descriptionLabel{
    if (!_descriptionLabel) {
        _descriptionLabel = [UILabel new];
        _descriptionLabel.text = @"海的味道  来自天堂";
        
    }
    return _descriptionLabel;
}

-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.text = @"价格: 9.9$";
        
    }
    return _priceLabel;
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
