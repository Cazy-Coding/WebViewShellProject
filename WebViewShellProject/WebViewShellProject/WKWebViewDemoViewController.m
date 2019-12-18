//
//  WKWebViewDemoViewController.m
//  WebViewShellProject
//
//  Created by mac on 2019/12/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "WKWebViewDemoViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewDemoViewController ()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WKWebViewDemoViewController

- (WKWebView *)webView {
    if (!_webView) {
        //以下代码适配屏幕大小
        NSString *jScript = @"var meta = document.createElement(‘meta‘); meta.setAttribute(‘name‘, ‘viewport‘); meta.setAttribute(‘content‘, ‘width=device-width‘); document.getElementsByTagName(‘head‘)[0].appendChild(meta); var imgs = document.getElementsByTagName(‘img‘);for (var i in imgs){imgs[i].style.maxWidth=‘100%‘;imgs[i].style.height=‘auto‘;}";
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        wkWebConfig.userContentController = wkUController;
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:wkWebConfig];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"WKWebView";
    NSString *webURLString = @"https://www.baidu.com";
    NSURL *url = [NSURL URLWithString:webURLString];
    NSURLRequest  * requet = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest: requet];    
    //添加title监听
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}

//根据监听 实时修改title
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context{
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView){
            self.navigationItem.title = self.webView.title;
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
}

//移除监听
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"title" context:nil];
}

@end
