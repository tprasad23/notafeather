//
//  TweetViewControllerViewController.m
//  NotAFeather
//
//  Created by Denny Kwon on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TweetViewControllerViewController.h"

@interface TweetViewControllerViewController ()

@end

@implementation TweetViewControllerViewController
@synthesize tweetLabel;
@synthesize tweet;

- (id)init
{
    self = [super init];
    if (self) {
        
        linkButton = nil;
        
        // register for rotation notifications:
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rotate) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
        
    }

    return self;
    
}

- (void)loadView
{
    
    // construct the view - as you would in storyboard with nib
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor cyanColor];
    
    // determine the orientation
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    // set frame size and origin
    
    frame.origin.y = 0.0f;
    
    // set the image views
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(30,9,260,200)];
    
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,260,192)];
    bubbleImageView.image = [UIImage imageNamed:@"word_bubble2.png"];
    
    UIImageView *birdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(93,192,75,75)];
    birdImageView.image = [UIImage imageNamed:@"twit_bird.png"];
    
    // configure tweetLabel
    
    tweetLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 239, 128)];
    tweetLabel.backgroundColor = [UIColor clearColor];
    tweetLabel.text = tweet.text;
    
    tweetLabel.numberOfLines = 0;
    tweetLabel.lineBreakMode = UILineBreakModeWordWrap;

    CGSize size = [tweet.text sizeWithFont:self.tweetLabel.font constrainedToSize:CGSizeMake(self.tweetLabel.frame.size.width, 1000) lineBreakMode:self.tweetLabel.lineBreakMode];
    
    frame = tweetLabel.frame;
    frame.size.height = size.height;
    tweetLabel.frame = frame;
    
    // Check if tweet contains an HTTP link
    
    NSRange rangeValue;
    
    rangeValue = [tweet.text rangeOfString:@"http" options:NSCaseInsensitiveSearch];
    
    if ( rangeValue.length > 0 ) {
        
        // all short - URL lengths are the same length
        // fixed at 20 characters.
        
        NSString *tempStr  = [tweet.text substringWithRange:NSMakeRange(rangeValue.location, 20)];
        
        tweet.linkURL = [[NSURL alloc] initWithString:tempStr];
        
    }
    
    // if Http link exists, add button
    
    if ( tweet.linkURL.absoluteString.length > 0 )
    {
        linkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [linkButton addTarget:self 
                       action:@selector(onLinkClicked:)
             forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *playButtonNormal = [UIImage imageNamed:@"linkbtn_button.png"];
        UIImage *playButtonPressed = [UIImage imageNamed:@"linkbtn_button_highlight.png"];
        
        [linkButton setBackgroundImage:playButtonNormal forState:UIControlStateNormal];
        [linkButton setBackgroundImage:playButtonPressed forState:UIControlStateHighlighted];
        
        [linkButton setTitle:@"Follow Link" forState:UIControlStateNormal];
        
        if (orientation==UIInterfaceOrientationLandscapeLeft || 
            orientation==UIInterfaceOrientationLandscapeRight )
        {
            linkButton.frame = CGRectMake(310.0, 30, 160.0, 40.0);
        }
        else {
            linkButton.frame = CGRectMake(80.0, 250.0, 160.0, 40.0);
        }
            
            
        [contentView addSubview:linkButton];
    }
        
        
    //add all the views to content view.
    
    [topView addSubview:bubbleImageView];
    [topView addSubview:tweetLabel];
    
    [contentView addSubview:topView];
    [contentView addSubview:birdImageView];
    
    self.view = contentView;
    
}
    

- (void)rotate
{
    NSLog(@"ROTATE!");
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation==UIInterfaceOrientationLandscapeLeft || orientation==UIInterfaceOrientationLandscapeRight){
        if (linkButton==nil)
            return;
        
        linkButton.frame = CGRectMake(310, 30, linkButton.frame.size.width, linkButton.frame.size.height);
        
    }
    
    // put the button back into portrait mode:
    
    if (orientation==UIInterfaceOrientationPortrait || orientation==UIInterfaceOrientationPortraitUpsideDown){
        if (linkButton==nil)
            return;
        
        linkButton.frame = CGRectMake(80, 250, linkButton.frame.size.width, linkButton.frame.size.height);
        
    }
    
}

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
 
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)onLinkClicked:(id)sender {
    NSLog(@"onLinkBtnClicked");
    
    TweetWebViewController *tweetWebVC = [[TweetWebViewController alloc] init];
    tweetWebVC.tweet = tweet;
    
    [self.navigationController pushViewController:tweetWebVC animated:YES];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
