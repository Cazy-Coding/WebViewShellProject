//
//  WKWebViewComponentDemoViewController.m
//  WebViewShellProject
//
//  Created by mac on 2019/12/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "WKWebViewComponentDemoViewController.h"
#import "WKWebViewController.h"

@interface WKWebViewComponentDemoViewController ()

@end

@implementation WKWebViewComponentDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)testWKAction:(UIButton *)sender {
    WKWebViewController *webVC = [[WKWebViewController alloc] init];
    webVC.isNavHidden = NO;//是否隐藏导航栏
    [webVC loadWebURLSring:@"https://www.baidu.com"];
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
