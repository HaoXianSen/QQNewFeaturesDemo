//
//  HYHHomeTableViewCell.m
//  QQNewFeaturesDemo
//
//  Created by harry on 2019/8/29.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import "HYHHomeTableViewCell.h"
//#import ""

@interface HYHHomeTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation HYHHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    @weakify(self);
    [[RACObserve(self, model) filter:^BOOL(id  _Nullable value) {
        return value != nil;
    }] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
