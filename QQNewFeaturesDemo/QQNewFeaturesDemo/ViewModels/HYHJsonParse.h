//
//  HYHJsonParse.h
//  QQNewFeaturesDemo
//
//  Created by harry on 2019/8/29.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HYHHomeListModel;

NS_ASSUME_NONNULL_BEGIN

@interface HYHJsonParse : NSObject

+ (NSArray<HYHHomeListModel *> *)homeListModels;

@end

NS_ASSUME_NONNULL_END
