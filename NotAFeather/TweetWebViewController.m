//
//  TweetWebViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TweetWebViewController.h"


@interface TweetWebViewController ()

@end

@implementation TweetWebViewController
@synthesize tweet;

/*

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

*/

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Loading...";
    }
    return self;
}


- (void)loadView
{
    
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
    webView.delegate = self;
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:tweet.linkURL];
    [webView loadRequest:requestObj];
    
    
    self.view = webView;
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    loading = [[LoadingIndicator alloc] initWithFrame:self.view.frame];
    [self.view addSubview:loading];
    [loading show];
    
}




#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"webView shouldStartLoadWithRequest:");
    return TRUE;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad:");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad:");
    self.title = @"";
    [loading hide];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webView didFailLoadWithError:");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
