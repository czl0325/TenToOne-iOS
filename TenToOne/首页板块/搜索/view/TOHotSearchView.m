//
//  TOHotSearchView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/12.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOHotSearchView.h"
#import "ZLCollectionViewHorzontalLayout.h"
#import "TOLabelCell.h"

@interface TOHotSearchView ()
<ZLCollectionViewBaseFlowLayoutDelegate, UICollectionViewDelegate>

@property(nonatomic,strong)UILabel* tvTitle;
@property(nonatomic,strong)UICollectionView* cvHot;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayHots;

@end

@implementation TOHotSearchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
        }];
        
        for (int i=0; i<10; i++) {
            [self.arrayHots addObject:@"小米商店"];
        }
        
        [self addSubview:self.cvHot];
        [self.cvHot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.tvTitle.mas_bottom).offset(8);
            make.height.mas_equalTo(52);
        }];
    }
    return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString* str = self.arrayHots[indexPath.item];
    return CGSizeMake([str getTextWidthfont:DefaultFont labelHeight:collectionView.height]+40, collectionView.height);
}

- (UILabel *)tvTitle{
    if(!_tvTitle){
        _tvTitle = ({
            UILabel * object = to_createLabel_black(@"热门搜索");
            object;
       });
    }
    return _tvTitle;
}

- (UICollectionView *)cvHot{
    if(!_cvHot){
        _cvHot = ({
            ZLCollectionViewHorzontalLayout* layout = [[ZLCollectionViewHorzontalLayout alloc]init];
            layout.layoutType = ColumnLayout;
            layout.delegate = self;
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.dataSource = self.dataSource;
            object.delegate = self;
            object.backgroundColor = [UIColor whiteColor];
            object.layer.cornerRadius = 5;
            [object registerClass:[TOLabelCell class] forCellWithReuseIdentifier:@"TOLabelCell"];
            object;
       });
    }
    return _cvHot;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayHots cellIdentifier:@"TOLabelCell" configureCellBlock:^(TOLabelCell* cell, NSString* item, NSIndexPath *indexPath) {
                cell.tvTitle.text = item;
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayHots{
    if(!_arrayHots){
        _arrayHots = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayHots;
}
@end
