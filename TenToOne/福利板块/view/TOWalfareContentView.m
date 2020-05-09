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
#import "TORedView.h"
#import "zhPopupController.h"
#import "TORedViewController.h"

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TORedView * redView = [[TORedView alloc]initWithFrame:CGRectMake(0, 0, 684/2, 1040/2)];
    WeakSelf;
    zhPopupController* popup = [[zhPopupController alloc] initWithView:redView size:redView.bounds.size];
    popup.presentationStyle = zhPopupSlideStyleTransform;
    popup.dismissonStyle = zhPopupSlideStyleTransform;
    [popup showInView:self.viewController.view.window completion:NULL];
    redView.onKai = ^{
        [popup dismiss];
        TORedViewController* vc = [[TORedViewController alloc]init];
        [weakSelf.viewController.navigationController pushViewController:vc animated:YES];
    };
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
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
