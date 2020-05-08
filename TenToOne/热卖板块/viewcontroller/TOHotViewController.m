//
//  TOHotViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOHotViewController.h"
#import "ZLCollectionViewVerticalLayout.h"
#import "UICollectionView+ARDynamicCacheHeightLayoutCell.h"
#import "TOHotCell.h"

@interface TOHotViewController ()
<UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView* collectionViewHot;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayHots;

@end

@implementation TOHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"热卖";
    
    [self.view addSubview:self.collectionViewHot];
    [self.collectionViewHot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}


- (UICollectionView *)collectionViewHot{
    if(!_collectionViewHot){
        _collectionViewHot = ({
            ZLCollectionViewVerticalLayout* layout = [[ZLCollectionViewVerticalLayout alloc]init];
            layout.layoutType = ColumnLayout;
            layout.columnCount = 2;
            layout.minimumLineSpacing = 5;
            layout.minimumInteritemSpacing = 5;
            layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
            
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.dataSource = self.dataSource;
            object.delegate = self;
            [object registerClass:[TOHotCell class] forCellWithReuseIdentifier:@"TOHotCell"];
            object;
       });
    }
    return _collectionViewHot;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayHots cellIdentifier:@"TOHotCell" configureCellBlock:^(TOHotCell* cell, id item, NSIndexPath *indexPath) {
                [cell updateHotCell];
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayHots{
    if(!_arrayHots){
        _arrayHots = ({
            NSMutableArray * object = [[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1",@"1", nil];
            object;
       });
    }
    return _arrayHots;
}
@end
