//
//  TOSearchViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSearchViewController.h"
#import "TOSearchNavbar.h"
#import "TOSearchCell.h"
#import "TOTitleHeader.h"
#import "TOHotSearchView.h"

@interface TOSearchViewController ()
<UITableViewDelegate>

@property(nonatomic,strong)TOSearchNavbar* navSearch;
@property(nonatomic,strong)UITableView* tbSearch;
@property(nonatomic,strong)ZLSectionDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayRecommend;
@property(nonatomic,strong)NSMutableArray* arrayResults;
@property(nonatomic,strong)NSMutableArray* arrayAllDatas;
@property(nonatomic,strong)TOHotSearchView* hotHeader;


@end

@implementation TOSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fd_prefersNavigationBarHidden = YES;
    
    [self.view addSubview:self.navSearch];
    [self.navSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    
    for (int i=0; i<20; i++) {
        //[self.arrayRecommend addObject:@"1"];
        [self.arrayResults addObject:@"1"];
    }
    
    [self.view addSubview:self.tbSearch];
    [self.tbSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.navSearch.mas_bottom);
    }];
    self.tbSearch.tableHeaderView = self.hotHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        if (self.arrayRecommend.count == 0) {
            return 0.001f;
        } else {
            return 30;
        }
    } else {
        return 0.001f;
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        TOTitleHeader* header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TOTitleHeader"];
        header.tvTitle.text = @"推荐搜索";
        return header;
    }
    return  nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        safeAreaInsets = self.view.safeAreaInsets;
    }
    CGRect navRect = self.navigationController.navigationBar.frame;
    [self.navSearch mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.mas_equalTo(self.view);
        make.height.mas_equalTo(navRect.size.height+safeAreaInsets.top);
    }];
    [self.view layoutIfNeeded];
}

- (TOSearchNavbar *)navSearch{
    if(!_navSearch){
        _navSearch = ({
            TOSearchNavbar* object = [[TOSearchNavbar alloc]init];
            object;
       });
    }
    return _navSearch;
}

- (UITableView *)tbSearch{
    if(!_tbSearch){
        _tbSearch = ({
            UITableView* object = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
            object.dataSource = self.dataSource;
            object.delegate = self;
            [object adjustBehavior];
            [object registerClass:[TOSearchCell class] forCellReuseIdentifier:@"TOSearchCell"];
            [object registerClass:[TOTitleHeader class] forHeaderFooterViewReuseIdentifier:@"TOTitleHeader"];
            object;
       });
    }
    return _tbSearch;
}

- (ZLSectionDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLSectionDataSource* object = [[ZLSectionDataSource alloc]initWithItems:self.arrayAllDatas cellIdentifier:@[@"TOSearchCell"] configureCellBlock:^(TOSearchCell* cell, id item, NSIndexPath *indexPath) {
                
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayRecommend{
    if(!_arrayRecommend){
        _arrayRecommend = ({
            NSMutableArray* object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayRecommend;
}

- (NSMutableArray *)arrayResults{
    if(!_arrayResults){
        _arrayResults = ({
            NSMutableArray* object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayResults;
}

- (NSMutableArray *)arrayAllDatas{
    if(!_arrayAllDatas){
        _arrayAllDatas = ({
            NSMutableArray* object = [[NSMutableArray alloc]initWithObjects:self.arrayRecommend, self.arrayResults, nil];
            object;
       });
    }
    return _arrayAllDatas;
}


- (TOHotSearchView *)hotHeader{
    if(!_hotHeader){
        _hotHeader = ({
            TOHotSearchView * object = [[TOHotSearchView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_MAX_WIDTH, 100)];
            object;
       });
    }
    return _hotHeader;
}
@end
