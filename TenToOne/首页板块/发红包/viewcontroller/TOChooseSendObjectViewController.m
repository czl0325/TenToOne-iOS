//
//  TOChooseSendObjectViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOChooseSendObjectViewController.h"
#import "TOSendObjectCell.h"

@interface TOChooseSendObjectViewController ()
<UITableViewDelegate>

@property(nonatomic,strong)UITableView* tbObject;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayObjects;

@end

@implementation TOChooseSendObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"投放对象";
    
    [self.view addSubview:self.tbObject];
    [self.tbObject mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(self.arrayObjects.count*44);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableView *)tbObject{
    if(!_tbObject){
        _tbObject = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            object.dataSource = self.dataSource;
            object.delegate = self;
            object.backgroundColor = [UIColor whiteColor];
            object.layer.cornerRadius = 5;
            [object registerClass:[TOSendObjectCell class] forCellReuseIdentifier:@"TOSendObjectCell"];
            object;
       });
    }
    return _tbObject;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayObjects cellIdentifier:@"TOSendObjectCell" configureCellBlock:^(TOSendObjectCell* cell, NSString* item, NSIndexPath *indexPath) {
                cell.tvTitle.text = item;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayObjects{
    if(!_arrayObjects){
        _arrayObjects = ({
            NSMutableArray * object = [[NSMutableArray alloc]initWithObjects:@"全部投放", @"只投男生", @"只投女生", nil];
            object;
       });
    }
    return _arrayObjects;
}

@end
