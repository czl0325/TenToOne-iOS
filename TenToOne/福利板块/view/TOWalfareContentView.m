//
//  TOWalfareContentView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOWalfareContentView.h"
#import "TOFreeHeader.h"
#import "TOFreeCell.h"

@interface TOWalfareContentView ()
<UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableViewFree;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayFrees;

@end

@implementation TOWalfareContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        for (int i=0; i<100; i++) {
            [self.arrayFrees addObject:[NSString stringWithFormat:@"%d", i]];
        }
        
        [self addSubview:self.tableViewFree];
        [self.tableViewFree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TOFreeHeader *header = [[TOFreeHeader alloc]initWithReuseIdentifier:@"TOFreeHeader"];
    return header;
}

- (UITableView *)tableViewFree{
    if(!_tableViewFree){
        _tableViewFree = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            object.delegate = self;
            object.dataSource = self.dataSource;
            [object registerClass:[TOFreeHeader class] forHeaderFooterViewReuseIdentifier:@"TOFreeHeader"];
            [object registerClass:[TOFreeCell class] forCellReuseIdentifier:@"TOFreeCell"];
            object;
       });
    }
    return _tableViewFree;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayFrees cellIdentifier:@"TOFreeCell" configureCellBlock:^(TOFreeCell* cell, id item, NSIndexPath *indexPath) {
                
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayFrees{
    if(!_arrayFrees){
        _arrayFrees = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayFrees;
}
@end
