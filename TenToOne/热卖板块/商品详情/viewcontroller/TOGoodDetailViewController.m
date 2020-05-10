//
//  TOGoodDetailViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOGoodDetailViewController.h"
#import "TOTitleView1.h"
#import "ZLCollectionViewHorzontalLayout.h"
#import "TOBannerCell.h"
#import "TOGoodTitleView.h"
#import "TOSpecificationView.h"
#import "zhPopupController.h"
#import "TOCreateOrderViewController.h"

@interface TOGoodDetailViewController ()
<ZLCollectionViewBaseFlowLayoutDelegate, UICollectionViewDelegate>

@property(nonatomic,strong)UIButton* btBack;
@property(nonatomic,strong)UIButton* btService;
@property(nonatomic,strong)UIButton* btShare;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)UICollectionView* cvBanner;
@property(nonatomic,strong)NSMutableArray* arrayBanners;
@property(nonatomic,strong)TOGoodTitleView* vGoodView;
@property(nonatomic,strong)TOTitleView1* vSpecification;
@property(nonatomic,strong)TOTitleView1* vDetail;
@property(nonatomic,strong)UIButton* btBuy;

@end

@implementation TOGoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    
    [self.view addSubview:self.cvBanner];
    [self.cvBanner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(300);
    }];
    
    [self.view addSubview:self.btBack];
    [self.btBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
    }];
    
    [self.view addSubview:self.btShare];
    [self.btShare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(self.btBack);
    }];
    
    [self.view addSubview:self.btService];
    [self.btService mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.btShare.mas_left).offset(-10);
        make.centerY.mas_equalTo(self.btBack);
    }];
    
    [self.view addSubview:self.vGoodView];
    [self.vGoodView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.cvBanner.mas_bottom);
    }];
    
    TOTitleView1* view1 = [[TOTitleView1 alloc]initWithTitle:@"特别提醒" detail:@"特价商品如需调换请联系商家"];
    [view1 setDetailTextColor:MainColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.vGoodView.mas_bottom).offset(5);
        make.height.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.vSpecification];
    [self.vSpecification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.right.mas_equalTo(view1);
        make.top.mas_equalTo(view1.mas_bottom);
    }];
    
    [self.view addSubview:self.vDetail];
    [self.vDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.right.mas_equalTo(view1);
        make.top.mas_equalTo(self.vSpecification.mas_bottom);
    }];
    
    [self.view addSubview:self.btBuy];
    [self.btBuy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(-10);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets safeInsets = self.view.safeAreaInsets;
    [self.btBack mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10+safeInsets.top);
    }];
    [self.btBuy mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(-(10+safeInsets.bottom));
    }];
    [self.view layoutIfNeeded];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.width, collectionView.height);
}

- (UICollectionView *)cvBanner{
    if(!_cvBanner){
        _cvBanner = ({
            ZLCollectionViewHorzontalLayout *layout = [[ZLCollectionViewHorzontalLayout alloc]init];
            layout.layoutType = ColumnLayout;
            layout.delegate = self;
            layout.sectionInset = UIEdgeInsetsZero;
            
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.dataSource = self.dataSource;
            object.delegate = self;
            object.pagingEnabled = YES;
            object.backgroundColor = WindowsBackColor;
            [object registerClass:[TOBannerCell class] forCellWithReuseIdentifier:@"TOBannerCell"];
            object;
       });
    }
    return _cvBanner;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayBanners cellIdentifier:@"TOBannerCell" configureCellBlock:^(TOBannerCell* cell, id item, NSIndexPath *indexPath) {
                
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayBanners{
    if(!_arrayBanners){
        _arrayBanners = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayBanners;
}

- (UIButton *)btBack{
    if(!_btBack){
        _btBack = ({
            UIButton * object = to_create_button_backImage(@"icon_backalpha");
            object;
       });
    }
    return _btBack;
}

- (UIButton *)btService{
    if(!_btService){
        _btService = ({
            UIButton * object = to_create_button_backImage(@"icon_servicealpha");
            object;
       });
    }
    return _btService;
}

- (UIButton *)btShare{
    if(!_btShare){
        _btShare = ({
            UIButton * object = to_create_button_backImage(@"icon_sharealpha");
            object;
       });
    }
    return _btShare;
}

- (TOGoodTitleView *)vGoodView{
    if(!_vGoodView){
        _vGoodView = ({
            TOGoodTitleView * object = [[TOGoodTitleView alloc]initWithFrame:CGRectZero];
            object;
       });
    }
    return _vGoodView;
}

- (TOTitleView1 *)vSpecification{
    if(!_vSpecification){
        _vSpecification = ({
            TOTitleView1 * object = [[TOTitleView1 alloc]initWithTitle:@"已选规格" detail:@""];
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]init];
            WeakSelf;
            [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
                TOSpecificationView * redView = [[TOSpecificationView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 500)];
                zhPopupController* popup = [[zhPopupController alloc] initWithView:redView size:redView.bounds.size];
                popup.presentationStyle = zhPopupSlideStyleFromBottom;
                popup.dismissonStyle = zhPopupSlideStyleFromBottom;
                popup.layoutType = zhPopupLayoutTypeBottom;
                [popup showInView:weakSelf.view.window completion:NULL];
                
            }];
            [object addGestureRecognizer:tap];
            object;
       });
    }
    return _vSpecification;
}

- (TOTitleView1 *)vDetail{
    if(!_vDetail){
        _vDetail = ({
            TOTitleView1 * object = [[TOTitleView1 alloc]initWithTitle:@"商品详情" detail:@"点击查看商品介绍"];
            object;
       });
    }
    return _vDetail;
}

- (UIButton *)btBuy{
    if(!_btBuy){
        _btBuy = ({
            UIButton * object = to_create_button_normal(@"购买");
            WeakSelf;
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                TOCreateOrderViewController* vc = [[TOCreateOrderViewController alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }];
            object;
       });
    }
    return _btBuy;
}

@end
