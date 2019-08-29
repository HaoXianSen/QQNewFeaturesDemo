//
//  HYHJsonParse.m
//  QQNewFeaturesDemo
//
//  Created by harry on 2019/8/29.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import "HYHJsonParse.h"
#import "HYHHomeListModel.h"

@implementation HYHJsonParse


+ (NSArray <HYHHomeListModel *> *)homeListModels {
    return [self _loadResource];
}

+ (NSArray *)_loadResource {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"json"];
    if (path) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray *dataArray = [dict objectForKey:@"data"];
        NSArray *models = [HYHHomeListModel mj_keyValuesArrayWithObjectArray:dataArray];
        return models;
    }
    return nil;
}

@end
