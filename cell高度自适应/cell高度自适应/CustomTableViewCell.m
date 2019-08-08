//
//  CustomTableViewCell.m
//  cell高度自适应
//
//  Created by 闫继祥 on 2019/8/8.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "Masonry.h"
#import "UILabel+MCLabel.h"
@implementation CustomTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        [self.contentView addSubview:self.iconImg];
        [self.contentView addSubview:self.nameL];
        [self.contentView addSubview:self.timeL];
        [self.contentView addSubview:self.titleL];
        [self.contentView addSubview:self.textContentL];
        [self.contentView addSubview:self.line];
        
        
        [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
            make.top.mas_equalTo(self.contentView.mas_top).mas_offset(15);
            make.height.mas_equalTo(@40);
            make.width.mas_equalTo(@40);
        }];
       
        
        [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImg.mas_right).mas_offset(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
            make.top.mas_equalTo(self.contentView.mas_top).mas_offset(15);
            make.height.mas_equalTo(@15);
        }];
        [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImg.mas_right).mas_offset(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
            make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(10);
            make.height.mas_equalTo(@15);
        }];
       
        [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImg.mas_right).mas_offset(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
            make.top.mas_equalTo(self.iconImg.mas_bottom).mas_offset(15);
            make.height.mas_equalTo(@1).priorityLow();//设置一个高度，以便赋值后更新
        }];
        
        [self.textContentL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImg.mas_right).mas_offset(10);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
            make.top.mas_equalTo(self.titleL.mas_bottom).mas_offset(15);
            make.height.mas_equalTo(@1).priorityLow();//设置一个高度，以便赋值后更新
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);

        }];
        
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
            make.height.mas_equalTo(@1.0);
        }];
    }
    return self;
}
- (void)setModel:(CustomModel *)model {
    _model = model;
    self.iconImg.image = [UIImage imageNamed:model.iconImg];
    self.nameL.text = model.nameStr;
    self.timeL.text = model.timeStr;
    self.titleL.text = model.titleStr;
    self.textContentL.text = model.detailStr;
    //行距 字间距
    [_titleL setColumnSpace:1.0];
    [_titleL setRowSpace:5.0];
    [_textContentL setColumnSpace:1.0];
    [_textContentL setRowSpace:5.0];
    
    if (model.detailStr.length == 0) {
        [self.textContentL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleL.mas_bottom).mas_offset(0.0);
            make.height.mas_equalTo(@0.0);//设置一个高度，以便赋值后更新
        }];
    }
}
- (UIImageView *)iconImg {
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] init];
        _iconImg.backgroundColor = [UIColor whiteColor];
//        _iconImg.clipsToBounds = YES;
        _iconImg.contentMode=UIViewContentModeScaleAspectFill;
//        _iconImg.layer.cornerRadius = 20;
        _iconImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerTapClick)];
        [_iconImg addGestureRecognizer:tap];
    }
    return _iconImg;
}
- (UILabel *)nameL {
    if (!_nameL) {
        _nameL = [[UILabel alloc] init];
        _nameL.font = [UIFont systemFontOfSize:15];
        _nameL.backgroundColor = [UIColor whiteColor];
    }
    return _nameL;
}

- (UILabel *)timeL {
    if (!_timeL) {
        _timeL = [[UILabel alloc] init];
        _timeL.font = [UIFont systemFontOfSize:13];
        _timeL.backgroundColor = [UIColor whiteColor];
        _timeL.textColor = [UIColor lightGrayColor];
        _timeL.adjustsFontSizeToFitWidth = YES;
    }
    return _timeL;
}
- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = [UIFont systemFontOfSize:15 weight:(UIFontWeightMedium)];
        _titleL.backgroundColor = [UIColor whiteColor];
        _titleL.numberOfLines = 0;
    }
    return _titleL;
}
- (UILabel *)textContentL {
    if (!_textContentL) {
        _textContentL = [[UILabel alloc] init];
        _textContentL.font = [UIFont systemFontOfSize:15 weight:(UIFontWeightLight)];
        _textContentL.backgroundColor = [UIColor whiteColor];
        _textContentL.numberOfLines = 0;
    }
    return _textContentL;
}
- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}
//头像点击
- (void)headerTapClick {
    NSString *idStr = _model.idStr;
    NSLog(@"-------%@",idStr);
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
