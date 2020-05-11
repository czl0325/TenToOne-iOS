//
//  TOShareView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOShareView.h"
#import "ZLButton.h"
#import "zhImageButton.h"

@interface TOShareView ()

@property(nonatomic,strong)UIButton *closeButton;
@property(nonatomic,strong)UIView *vShare;
@property(nonatomic,strong)NSArray<zhImageButtonModel *> *arrayIcons;
@property(nonatomic,strong)NSMutableArray<zhImageButton *>* arrayButtons;

@end

@implementation TOShareView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = WindowsBackColor;
        
        [self addSubview:self.closeButton];
        [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(self);
            make.height.mas_equalTo(45);
        }];
        
        [self addSubview:self.vShare];
        [self.vShare mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self);
            make.height.mas_equalTo(120);
        }];
        
        [self setShareIcons];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIEdgeInsets safeInsets = self.safeAreaInsets;
    [self.closeButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(45);
        make.bottom.mas_equalTo(-safeInsets.bottom);
    }];
    [self layoutIfNeeded];
}

- (void)setShareIcons {
    [self.arrayButtons removeAllObjects];
    
    __block UIView* temp = nil;
    [self.arrayIcons enumerateObjectsUsingBlock:^(zhImageButtonModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        zhImageButton *button = [zhImageButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:model.text forState:UIControlStateNormal];
        [button setTitleColor:DefaultTextColor forState:UIControlStateNormal];
        [button setImage:model.icon forState:UIControlStateNormal];
        button.tag = idx;
        [button imagePosition:zhImageButtonPositionTop spacing:5];
        [self.vShare addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.mas_equalTo(self.vShare);
            make.width.mas_equalTo(self.vShare.mas_width).multipliedBy(0.25);
            if (temp == nil) {
                make.left.mas_equalTo(0);
            } else {
                make.left.mas_equalTo(temp.mas_right);
            }
        }];
        temp = button;
        [self.arrayButtons addObject:button];
    }];
}

- (void)startAnimationsCompletion:(void (^ __nullable)(BOOL finished))completion {
    [self.arrayButtons enumerateObjectsUsingBlock:^(zhImageButton *item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.alpha = 0;
        item.transform = CGAffineTransformMakeTranslation(0, 120);
        [UIView animateWithDuration:0.8 delay:idx * 0.12 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            item.alpha = 1;
            item.transform = CGAffineTransformIdentity;
        } completion:completion];
    }];
}

- (UIButton *)closeButton{
    if(!_closeButton){
        _closeButton = ({
            UIButton * object = to_create_button_white(@"取消");
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
            }];
            object;
       });
    }
    return _closeButton;
}

- (UIView *)vShare{
    if(!_vShare){
        _vShare = ({
            UIView * object = createView([UIColor whiteColor]);
            object;
       });
    }
    return _vShare;
}

- (NSMutableArray<zhImageButton *> *)arrayButtons{
    if(!_arrayButtons){
        _arrayButtons = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayButtons;
}

- (NSArray<zhImageButtonModel *> *)arrayIcons{
    if(!_arrayIcons){
        _arrayIcons = ({
            NSArray * object = [[NSArray alloc]initWithObjects:
        [zhImageButtonModel modelWithTitle:@"微信" image:[UIImage imageNamed:@"icon_sharewx"]],
        [zhImageButtonModel modelWithTitle:@"朋友圈" image:[UIImage imageNamed:@"icon_sharewxpy"]],
        [zhImageButtonModel modelWithTitle:@"QQ好友" image:[UIImage imageNamed:@"icon_shareqq"]],
        [zhImageButtonModel modelWithTitle:@"QQ空间" image:[UIImage imageNamed:@"icon_shareqqzone"]], nil];
            object;
       });
    }
    return _arrayIcons;
}
@end
