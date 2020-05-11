//
//  TOSendRedViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSendRedViewController.h"
#import "ZLCollectionViewVerticalLayout.h"
#import "TOSendRedHeader.h"
#import "UICollectionView+ARDynamicCacheHeightLayoutCell.h"
#import "TORedPhotoCell.h"

@interface TOSendRedViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, ZLCollectionViewBaseFlowLayoutDelegate>

@property(nonatomic,strong)UICollectionView* cvSendred;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayPhotos;
@property(nonatomic,strong)UIButton* btSend;
@property(nonatomic,strong)UILabel* tvPrice;

@end

@implementation TOSendRedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发红包";
    
    [self.view addSubview:self.btSend];
    [self.btSend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.tvPrice];
    [self.tvPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.btSend.mas_top).offset(-15);
        make.centerX.mas_equalTo(self.view);
    }];
    
    [self.view addSubview:self.cvSendred];
    [self.cvSendred mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.tvPrice.mas_top).offset(-15);
        make.left.right.top.mas_equalTo(self.view);
    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.btSend mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10-self.view.safeAreaInsets.bottom);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
    }];
    [self.view layoutIfNeeded];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayPhotos.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TORedPhotoCell* cell = (TORedPhotoCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"TORedPhotoCell" forIndexPath:indexPath];
    cell.imageForPhoto = self.arrayPhotos[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (collectionView.width-40-56)/3;
    return CGSizeMake(width, width);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(collectionView.width, 275);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        TOSendRedHeader* header = (TOSendRedHeader*)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TOSendRedHeader" forIndexPath:indexPath];
        return header;
    }
    return nil;
}

- (UICollectionView *)cvSendred{
    if(!_cvSendred){
        _cvSendred = ({
            ZLCollectionViewVerticalLayout *layout = [[ZLCollectionViewVerticalLayout alloc]init];
            layout.layoutType = ColumnLayout;
            layout.columnCount = 3;
            layout.minimumLineSpacing = 15;
            layout.minimumInteritemSpacing = 28;
            layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
            layout.delegate = self;
            
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.dataSource = self;
            object.delegate = self;
            object.backgroundColor = [UIColor clearColor];
            [object registerClass:[TOSendRedHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TOSendRedHeader"];
            [object registerClass:[TORedPhotoCell class] forCellWithReuseIdentifier:@"TORedPhotoCell"];
            object;
       });
    }
    return _cvSendred;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayPhotos cellIdentifier:@"TORedPhotoCell" configureCellBlock:^(TORedPhotoCell* cell, UIImage* item, NSIndexPath *indexPath) {
                cell.imageForPhoto = item;
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayPhotos{
    if(!_arrayPhotos){
        _arrayPhotos = ({
            NSMutableArray * object = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"icon_addblack"], nil];
            object;
       });
    }
    return _arrayPhotos;
}

- (UIButton *)btSend{
    if(!_btSend){
        _btSend = ({
            UIButton* object = to_create_button_normal(@"发红包");
            object;
       });
    }
    return _btSend;
}

- (UILabel *)tvPrice{
    if(!_tvPrice){
        _tvPrice = ({
            UILabel* object = to_createLabel_text_color_font(@"￥0.0", MainColor, 30);
            object;
       });
    }
    return _tvPrice;
}

@end
