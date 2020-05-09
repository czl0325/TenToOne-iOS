//
//  TORedViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TORedViewController.h"
#import "TORedTopView.h"
#import "TOUserCell.h"
#import "ZLCollectionViewHorzontalLayout.h"

@interface TORedViewController ()

@property(nonatomic,strong)TORedTopView* redTopView;
@property(nonatomic,strong)UILabel* tvCount;
@property(nonatomic,strong)UICollectionView* cvMoney;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayMoneys;


@end

@implementation TORedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"某某某的红包";
    
    for (int i=0; i<100; i++) {
          [self.arrayMoneys addObject:@"1"];
      }
    
    [self.view addSubview:self.redTopView];
    [self.redTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.top.mas_equalTo(self.view);
        make.height.mas_equalTo(self.redTopView.mas_width).multipliedBy(413.0/750);
    }];
    
    [self.view addSubview:self.tvCount];
    [self.tvCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.redTopView.mas_bottom).offset(12);
    }];
    
    [self.view addSubview:self.cvMoney];
    [self.cvMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.tvCount.mas_bottom).offset(15);
        make.height.mas_equalTo(70);
    }];
}

- (TORedTopView *)redTopView{
    if(!_redTopView){
        _redTopView = ({
            TORedTopView * object = [[TORedTopView alloc]init];
            object;
       });
    }
    return _redTopView;
}

- (UILabel *)tvCount{
    if(!_tvCount){
        _tvCount = ({
            UILabel * object = to_createLabel_text_color(@"已领取 0/0份", MainColor);
            object;
       });
    }
    return _tvCount;
}

- (UICollectionView *)cvMoney{
    if(!_cvMoney){
        _cvMoney = ({
            ZLCollectionViewHorzontalLayout *layout = [[ZLCollectionViewHorzontalLayout alloc]init];
            layout.layoutType = ColumnLayout;
            layout.itemSize = CGSizeMake(50, 0);
            layout.sectionInset = UIEdgeInsetsZero;
            
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.dataSource = self.dataSource;
            object.delegate = self;
            object.backgroundColor = [UIColor clearColor];
            [object registerClass:[TOUserCell class] forCellWithReuseIdentifier:@"TOUserCell"];
            object;
       });
    }
    return _cvMoney;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayMoneys cellIdentifier:@"TOUserCell" configureCellBlock:^(TOUserCell* cell, id item, NSIndexPath *indexPath) {
                
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayMoneys{
    if(!_arrayMoneys){
        _arrayMoneys = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayMoneys;
}
@end
