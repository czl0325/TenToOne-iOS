//
//  TOMyTeamViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMyTeamViewController.h"
#import "TOMyTeamTopView.h"

@interface TOMyTeamViewController ()

@property(nonatomic,strong)TOMyTeamTopView* myTeamTopView;

@end

@implementation TOMyTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的团队";
    
    [self.view addSubview:self.myTeamTopView];
    [self.myTeamTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(210);
    }];
}


- (TOMyTeamTopView *)myTeamTopView{
    if(!_myTeamTopView){
        _myTeamTopView = ({
            TOMyTeamTopView * object = [[TOMyTeamTopView alloc]init];
            object;
       });
    }
    return _myTeamTopView;
}


@end
