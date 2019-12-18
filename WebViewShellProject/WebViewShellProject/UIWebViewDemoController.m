//
//  UIWebViewDemoController.m
//  WebViewShellProject
//
//  Created by mac on 2019/12/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UIWebViewDemoController.h"

@interface UIWebViewDemoController ()
//ios(2.0, 12.0))  iOS 12 已经废弃 iOS 8.0以上建议使用WKWebView
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation UIWebViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"UIWebView";
    NSString *webURLString = @"https://www.baidu.com";
    NSURL *url = [NSURL URLWithString:webURLString];
    NSURLRequest  * requet = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest: requet];
}

@end
