//
//  HYHHomeBusiness.m
//  QQNewFeaturesDemo
//
//  Created by harry on 2019/8/29.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import "HYHHomeBusiness.h"
#import "HYHJsonParse.h"

@interface HYHHomeBusiness()


@end

@implementation HYHHomeBusiness

- (void)loadData {
    self.models = [HYHJsonParse homeListModels];
}

@end
