//
//  TOOrderGoodSpacView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOOrderGoodSpacView.h"
#import "TOTitleView1.h"

@interface TOOrderGoodSpacView ()

@property(nonatomic,strong)NSMutableArray* arraySpacs;

@end

@implementation TOOrderGoodSpacView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        
        for (int i=0; i<2; i++) {
            [self.arraySpacs addObject:@"1"];
        }
        [self reloadSpac];
    }
    return self;
}

- (void)reloadSpac {
    [self removeAllSubviews];
    
    UIView* temp = nil;
    for (int i=0; i<self.arraySpacs.count; i++) {
        TOTitleView1* view = [[TOTitleView1 alloc]initWithTitle:@"已选规格" detail:@"XL" showLine:i!=self.arraySpacs.count-1];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.height.mas_equalTo(40);
            if (temp != nil) {
                make.top.mas_equalTo(temp.mas_bottom);
            } else {
                make.top.mas_equalTo(0);
            }
        }];
        temp = view;
    }
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(temp.mas_bottom);
    }];
}

- (NSMutableArray *)arraySpacs{
    if(!_arraySpacs){
        _arraySpacs = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arraySpacs;
}
@end
