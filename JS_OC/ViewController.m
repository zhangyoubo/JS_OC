//
//  ViewController.m
//  JS_OC
//
//  Created by  on 2017/12/6.
//  Copyright © 2017年 张友波. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView=[[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.webView.delegate=self;
    //网页分页的方向
    self.webView.paginationMode=UIWebPaginationModeTopToBottom;
    
    [self.view addSubview:self.webView];
    
    [self loadPurchasesWeb];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadPurchasesWeb{
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
   
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"网页数目:%ld",webView.pageCount);//网页数目
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"连接错误!");
}

// 代理方法里拦截 JS 发送的请求,如果是约定的请求 那么就触发本地该执行的OC方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //
    NSString *requestUrl = request.URL.absoluteString;
    NSLog(@"请求URL:%@",requestUrl);
   
    navigationType=UIWebViewNavigationTypeReload;
    return YES;
}




@end
