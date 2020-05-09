//
//  TOOrderListViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOOrderListViewController.h"
#import "TOOrderCell.h"

@interface TOOrderListViewController ()

@property(nonatomic,strong)UITableView* tbOrder;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayOrders;

@end

@implementation TOOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i=0; i<100; i++) {
        [self.arrayOrders addObject:@"1"];
    }
    
    [self.view addSubview:self.tbOrder];
    [self.tbOrder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (UIView *)listView {
    return self.view;
}

- (ZLCellDataSource*)dataSource {
    if(!_dataSource){
         _dataSource = ({
             ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayOrders cellIdentifier:@"TOOrderCell" configureCellBlock:^(TOOrderCell* cell, id item, NSIndexPath *indexPath) {
                 
             }];
             object;
        });
     }
     return _dataSource;
}

- (UITableView*)tbOrder {
    if(!_tbOrder){
         _tbOrder = ({
             UITableView * object = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
             object.dataSource = self.dataSource;
             [object registerClass:[TOOrderCell class] forCellReuseIdentifier:@"TOOrderCell"];
             [object commonSetTableView];
             object.separatorStyle = UITableViewCellSeparatorStyleNone;
             object;
        });
     }
     return _tbOrder;
}

- (NSMutableArray*)arrayOrders {
    if(!_arrayOrders){
         _arrayOrders = ({
             NSMutableArray * object = [[NSMutableArray alloc]init];
             object;
        });
     }
     return _arrayOrders;
}

@end
