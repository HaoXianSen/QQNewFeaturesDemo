//
//  ViewController.m
//  QQNewFeaturesDemo
//
//  Created by harry on 2019/8/29.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import "HYHHomeController.h"
#import "HYHHomeBusiness.h"
#import "HYHHomeTableViewCell.h"

static NSString *const kCellIdentifier = @"homeCell";

@interface HYHHomeController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) UIView *tableViewHeaderView;
@property (nonatomic, weak) UISearchBar *headerSearchBar;

@property (nonatomic, strong) HYHHomeBusiness *business;

@end

@implementation HYHHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self configTableView];
    [self configSignal];
    [self.business loadData];
}

- (void)configSignal {
    @weakify(self);
    [[RACObserve(self.business, models) filter:^BOOL(id  _Nullable value) {
        return value != nil;
    }] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}

- (void)configNavigationItem {
    self.title = @"消息";
}

- (void)configTableView {
    UIView *tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    UISearchBar *searshBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    searshBar.barStyle = UIBarStyleDefault;
    searshBar.searchBarStyle = UISearchBarStyleMinimal;
    searshBar.placeholder = @"搜索";
    [tableViewHeaderView addSubview:searshBar];
    self.tableView.tableHeaderView =tableViewHeaderView;
    _tableViewHeaderView = tableViewHeaderView;
    _headerSearchBar = searshBar;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(HYHHomeTableViewCell.class) bundle:nil] forCellReuseIdentifier:kCellIdentifier];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableViewHeaderView.frame = CGRectMake(0, 0, self.tableView.width, 50.f);
    [self.headerSearchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@18);
        make.right.equalTo(@(-18));
        make.centerY.equalTo(self.tableViewHeaderView.mas_centerY);
        make.height.equalTo(@44);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - tableViewDataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.business.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYHHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.model = self.business.models[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - GETTER

- (HYHHomeBusiness *)business {
    if (!_business) {
        _business = [[HYHHomeBusiness alloc] init];
    }
    return _business;
}


@end
