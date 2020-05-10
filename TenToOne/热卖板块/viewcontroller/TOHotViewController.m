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
#import "TOGoodDetailViewController.h"

@interface TOHotViewController ()
<UICollectionViewDelegate, ZLCollectionViewBaseFlowLayoutDelegate, UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView* collectionViewHot;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayHots;
@property(nonatomic,assign)BOOL isHistory;

@end

@implementation TOHotViewController

- (instancetype)init {
    if (self == [super init]) {
        self.isHistory = NO;
    }
    return self;
}

- (instancetype)initWithHistory:(BOOL)history {
    if (self == [super init]) {
        self.isHistory = history;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WeakSelf;
    if (self.isHistory) {
        self.title = @"历史记录";
    } else {
        self.title = @"热卖";
        UIButton* btHistory = to_create_button_left(@"历史记录", @"icon_history");
        [btHistory setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addRightNavigationButtons:@[btHistory]];
        [[btHistory rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            TOHotViewController* vc = [[TOHotViewController alloc]initWithHistory:YES];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    [self.view addSubview:self.collectionViewHot];
    [self.collectionViewHot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView ar_sizeForCellWithIdentifier:@"TOHotCell" indexPath:indexPath fixedWidth:collectionView.frame.size.width/2-15 configuration:^(__kindof TOHotCell *cell) {
        [cell updateHotCell];
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    TOGoodDetailViewController* vc = [[TOGoodDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UICollectionView *)collectionViewHot{
    if(!_collectionViewHot){
        _collectionViewHot = ({
            ZLCollectionViewVerticalLayout* layout = [[ZLCollectionViewVerticalLayout alloc]init];
            layout.delegate = self;
            layout.layoutType = ColumnLayout;
            layout.columnCount = 2;
            layout.minimumLineSpacing = 5;
            layout.minimumInteritemSpacing = 5;
            layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
            
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.dataSource = self.dataSource;
            object.delegate = self;
            object.backgroundColor = [UIColor clearColor];
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
