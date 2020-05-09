//
//  TORedView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TORedView.h"
#import "TOUserCell.h"
#import "ZLCollectionViewHorzontalLayout.h"

@interface TORedView()
<UICollectionViewDelegate>

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvTitle;
@property(nonatomic,strong)UILabel* tvCount;
@property(nonatomic,strong)UICollectionView* cvMember;
@property(nonatomic,strong)UIButton* btKai;
@property(nonatomic,strong)ZLCellDataSource* dataSource;
@property(nonatomic,strong)NSMutableArray* arrayMembers;

@end

@implementation TORedView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        for (int i=0; i<100; i++) {
            [self.arrayMembers addObject:@"1"];
        }
        
        UIImageView* ivBack = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back_red"]];
        [self addSubview:ivBack];
        [ivBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        [self addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(60);
            make.size.mas_equalTo(68);
            make.centerX.mas_equalTo(self);
        }];
        
        [self addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.ivAvatar.mas_bottom).offset(8);
            make.centerX.mas_equalTo(self);
        }];
        
        [self addSubview:self.tvCount];
        [self.tvCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tvTitle.mas_bottom).offset(8);
            make.centerX.mas_equalTo(self);
        }];
        
        UILabel* l1 = to_createLabel_white(@"参与免单群组成员");
        [self addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tvCount.mas_bottom).offset(50);
            make.centerX.mas_equalTo(self);
        }];
        
        UIView* line1 = createView([UIColor whiteColor]);
        [self addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(l1);
            make.right.mas_equalTo(l1.mas_left).offset(-10);
            make.left.mas_equalTo(self);
            make.height.mas_equalTo(1);
        }];
        
        UIView* line2 = createView([UIColor whiteColor]);
        [self addSubview:line2];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(l1);
            make.left.mas_equalTo(l1.mas_right).offset(10);
            make.right.mas_equalTo(self);
            make.height.mas_equalTo(1);
        }];
        
        [self addSubview:self.cvMember];
        [self.cvMember mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(-30);
            make.height.mas_equalTo(80);
            make.top.mas_equalTo(l1.mas_bottom).offset(20);
        }];
        
        [self addSubview:self.btKai];
        [self.btKai mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-20);
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(84);
        }];
    }
    return self;
}


- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_defaultavatar"]];
            object.layer.cornerRadius = 34;
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvTitle{
    if(!_tvTitle){
        _tvTitle = ({
            UILabel * object = to_createLabel_white(@"某某某的红包");
            object.font = [UIFont systemFontOfSize:18];
            object;
       });
    }
    return _tvTitle;
}

- (UILabel *)tvCount{
    if(!_tvCount){
        _tvCount = ({
            UILabel * object = to_createLabel_white(@"免单次数：0次");
            object.font = [UIFont systemFontOfSize:14];
            object;
       });
    }
    return _tvCount;
}

- (UICollectionView *)cvMember{
    if(!_cvMember){
        _cvMember = ({
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
    return _cvMember;
}

- (UIButton *)btKai{
    if(!_btKai){
        _btKai = ({
            WeakSelf;
            UIButton * object = to_create_button_backImage(@"icon_kai");
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (weakSelf.onKai) {
                    weakSelf.onKai();
                }
            }];
            object;
       });
    }
    return _btKai;
}

- (ZLCellDataSource *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            ZLCellDataSource * object = [[ZLCellDataSource alloc]initWithItems:self.arrayMembers cellIdentifier:@"TOUserCell" configureCellBlock:^(TOUserCell* cell, id item, NSIndexPath *indexPath) {
                
            }];
            object;
       });
    }
    return _dataSource;
}

- (NSMutableArray *)arrayMembers{
    if(!_arrayMembers){
        _arrayMembers = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayMembers;
}
@end
