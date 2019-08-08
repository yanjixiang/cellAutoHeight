//
//  CustomTableViewCell.h
//  cell高度自适应
//
//  Created by 闫继祥 on 2019/8/8.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel *nameL;
@property(nonatomic, strong)UIImageView *iconImg;
@property(nonatomic, strong)UILabel *timeL;
@property(nonatomic, strong)UILabel *titleL;
@property(nonatomic, strong)UILabel *textContentL;
@property (nonatomic,strong)UIView *line;

@property(nonatomic, strong)CustomModel *model;


@end

NS_ASSUME_NONNULL_END
