//
//  TOMyAddressViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMyAddressViewController.h"
#import "TOAddressCell.h"
#import "TONewAddressViewController.h"

@interface TOMyAddressViewController ()
<UITableViewDelegate>

@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)UITableView* tbAddress;
@property(nonatomic,strong)NSMutableArray* arrayAddress;

@end

@implementation TOMyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WeakSelf;
    
    self.title = @"地址管理";
    UIButton* btAdd = to_create_button_backImage(@"icon_addwhite");
    [[btAdd rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        TONewAddressViewController* vc = [[TONewAddressViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self addRightNavigationButtons:@[btAdd]];
    
    for (int i=0; i<100; i++) {
        [self.arrayAddress addObject:@"1"];
    }
    
    [self.view addSubview:self.tbAddress];
    [self.tbAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayAddress cellIdentifier:@"TOAddressCell" configureCellBlock:^(TOAddressCell* cell, id item, NSIndexPath *indexPath) {
                
            }];
            object;
       });
    }
    return _dataSource;
}

- (UITableView *)tbAddress{
    if(!_tbAddress){
        _tbAddress = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            object.dataSource = self.dataSource;
            object.delegate = self;
            object.separatorStyle = UITableViewCellSeparatorStyleNone;
            [object registerClass:[TOAddressCell class] forCellReuseIdentifier:@"TOAddressCell"];
            object;
       });
    }
    return _tbAddress;
}

- (NSMutableArray *)arrayAddress{
    if(!_arrayAddress){
        _arrayAddress = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayAddress;
}

@end
