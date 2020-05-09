//
//  TOScanViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOScanViewController.h"
#import "QiCodePreviewView.h"
#import "QiCodeManager.h"

@interface TOScanViewController ()

@property (nonatomic, strong) QiCodePreviewView *previewView;
@property (nonatomic, strong) QiCodeManager *codeManager;

@end

@implementation TOScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"扫描二维码";
    
    UIBarButtonItem *photoItem = [[UIBarButtonItem alloc] initWithTitle:@"相册" style:UIBarButtonItemStylePlain target:self action:@selector(photo:)];
    self.navigationItem.rightBarButtonItem = photoItem;
    
    [self.view addSubview:self.previewView];
    [self.previewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    WeakSelf;
    self.codeManager = [[QiCodeManager alloc] initWithPreviewView:self.previewView completion:^{
        [weakSelf startScanning];
    }];
}

- (void)photo:(id)sender {
    WeakSelf;
    [self.codeManager presentPhotoLibraryWithRooter:self callback:^(NSString * _Nonnull code) {
        [weakSelf performSegueWithIdentifier:@"showCodeGeneration" sender:code];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self startScanning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.codeManager stopScanning];
}

- (void)startScanning {
    [self.codeManager startScanningWithCallback:^(NSString * _Nonnull code) {
        //[weakSelf performSegueWithIdentifier:@"showCodeGeneration" sender:code];
        NSLog(@"扫描到二维码=%@",code);
    } autoStop:YES];
}

- (QiCodePreviewView *)previewView{
    if(!_previewView){
        _previewView = ({
            QiCodePreviewView * object = [[QiCodePreviewView alloc]initWithFrame:self.view.bounds rectFrame:CGRectMake(SCREEN_MAX_WIDTH/2-150, SCREEN_MAX_HEIGHT/2-200, 300, 300)];
            object.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            object;
       });
    }
    return _previewView;
}

@end
