//
//  TOMessageViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMessageViewController.h"
#import "TOMessageCell.h"

@interface TOMessageViewController ()
<UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableViewMsg;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayMessages;

@end

@implementation TOMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息";
    
    UIButton* btHistory = to_create_button_Right(@"筛选", @"icon_filtrate");
    [btHistory setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addRightNavigationButtons:@[btHistory]];
    
    for (int i=0; i<100; i++) {
        [self.arrayMessages addObject:@"1"];
    }
    
    [self.view addSubview:self.tableViewMsg];
    [self.tableViewMsg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableView *)tableViewMsg{
    if(!_tableViewMsg){
        _tableViewMsg = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            object.delegate = self;
            object.dataSource = self.dataSource;
            [object registerClass:[TOMessageCell class] forCellReuseIdentifier:@"TOMessageCell"];
            object;
       });
    }
    return _tableViewMsg;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayMessages cellIdentifier:@"TOMessageCell" configureCellBlock:^(TOMessageCell* cell, id item, NSIndexPath *indexPath) {
                
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayMessages{
    if(!_arrayMessages){
        _arrayMessages = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayMessages;
}

@end
