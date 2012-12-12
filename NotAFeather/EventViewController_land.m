//
//  EventViewController_land.m
//  NotAFeather
//
//  Created by Teju Prasad on 8/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventViewController_land.h"

@interface EventViewController_land ()

@end

@implementation EventViewController_land

@synthesize titleLabel;
@synthesize titleString;
@synthesize bodyString;
@synthesize bodyLabel;
@synthesize audioBtn;
@synthesize videoBtn;
@synthesize audioStopBtn;
@synthesize audioPlayer;
@synthesize event;
@synthesize mediaLabel;
@synthesize movieURL;
@synthesize filePath;
@synthesize fileURL;
@synthesize labelDict;
@synthesize imageView;
@synthesize backgroundImage;
@synthesize backImage;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization - label text for audio and video content
        
        
        NSArray *keys = [NSArray arrayWithObjects:@"Yoga",
                         @"Vedas", 
                         @"The word Hindu", 
                         @"Alien Land Act, 1913",
                         @"Immigration Act, 1965",
                         @"Director's Statement", nil];
        
        NSArray *objs = [NSArray arrayWithObjects:@"Learn about Yoga", 
                         @"Vedic Chanting Sample",
                         @"History of 'Hindu'",
                         @"Learn about the Act",
                         @"Learn about the Act",
                         @"Words from the Director", nil];
        
        labelDict = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
        
    }
        
    return self;
}

- (void)rotate
{
    NSLog(@"ROTATE inside event controller - landscape!");
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGSize available;
    CGRect frame;
    CGRect backImageFrame;
    CGPoint imgCenter;
    
    // Rotate TO Landscape
    
    if (orientation==UIInterfaceOrientationLandscapeLeft || 
        orientation==UIInterfaceOrientationLandscapeRight){
        
        if (event.mode == EventModeNothing )
        {
            // adjust scrollview
            
            theScrollview.frame = CGRectMake(90,0,320,300);
            
            available = CGSizeMake(300, INFINITY);
            CGSize sizeToFit = [bodyLabel sizeThatFits:available];
            
            // adjust label frame
            
            frame = bodyLabel.frame; // to get the width
            frame.size.height = sizeToFit.height;    
            bodyLabel.frame = frame;
            
            // adjust background image
            
            backgroundImage = [UIImage imageNamed:@"scroll_back_lands_none.png"];
            imgCenter = CGPointMake(240,140);
            backImageFrame = CGRectMake(0,150,340,300);
            
            backImage.frame = backImageFrame;
            backImage.center = imgCenter;
            
            // adjust scrollview contentsize
            
            theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, 
                                                   bodyLabel.frame.size.height + 60);
            
        } else if (event.mode == EventModeImage )
        {
            
            theScrollview.frame = CGRectMake(10,0,240,300);
            
            available = CGSizeMake(230, INFINITY);
            CGSize sizeToFit = [bodyLabel sizeThatFits:available];
            
            // adjust label frame
            
            bodyLabel.frame = CGRectMake(0,0,230,sizeToFit.height);
            
            // adjust background image
            
            backgroundImage = [UIImage imageNamed:@"scroll_back_lands_some.png"];
            imgCenter = CGPointMake(127,140);
            backImageFrame = CGRectMake(0,150,240,300);
            
            backImage.frame = backImageFrame;
            backImage.center = imgCenter;
            
            // adjust scrollview contentsize
            
            theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, 
                                                   bodyLabel.frame.size.height + 60);
            
            imageView.frame = CGRectMake(315,60,100,150);
            
        } else {
            
            theScrollview.frame = CGRectMake(10,0,240,300);
            
            available = CGSizeMake(230, INFINITY);
            CGSize sizeToFit = [bodyLabel sizeThatFits:available];
            
            // adjust label frame
            
            bodyLabel.frame = CGRectMake(0,0,230,sizeToFit.height);
            
            // adjust background image
            
            backgroundImage = [UIImage imageNamed:@"scroll_back_lands_some.png"];
            imgCenter = CGPointMake(128,140);
            backImageFrame = CGRectMake(0,150,240,300);
            
            backImage.frame = backImageFrame;
            backImage.center = imgCenter;
            
            // adjust scrollview contentsize
            
            theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, 
                                                   bodyLabel.frame.size.height + 60);
            
            // set audio/video buttons
            
            mediaLabel.frame = CGRectMake(240.0, 60.0, 240.0, 30.0);
            
            if ( event.mode == EventModeAudio )
            {
                audioBtn.frame = CGRectMake(300.0, 120.0, 120.0, 30.0);
            } else if ( event.mode == EventModeVideo )
            {
                videoBtn.frame = CGRectMake(300.0, 120.0, 120.0, 30.0);
            }
            
        }
        
    }
    
    
    if (orientation==UIInterfaceOrientationPortrait || 
        orientation==UIInterfaceOrientationPortraitUpsideDown){
        
        // Rotate BACK to portrait
        
        if (event.mode == EventModeNothing )
        {
            // adjust scrollview
            
            theScrollview.frame = CGRectMake(0,0,300,400);
            theScrollview.center = CGPointMake(160,210);
            
            available = CGSizeMake(300, INFINITY);
            CGSize sizeToFit = [bodyLabel sizeThatFits:available];
            
            // adjust label frame
            
            frame.size.height = sizeToFit.height;    
            bodyLabel.frame = CGRectMake(0,0,300,sizeToFit.height);
            
            // adjust background image
            
            backgroundImage = [UIImage imageNamed:@"scroll_back_none.png"];
            imgCenter = CGPointMake(160,210);
            backImageFrame = CGRectMake(0,30,320,430);
            
            backImage.frame = backImageFrame;
            backImage.center = imgCenter;
            
            // adjust scrollview contentsize
            
            theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, 
                                                   bodyLabel.frame.size.height + 20);
            
        } else if (event.mode == EventModeImage )
        {
            
            theScrollview.frame = CGRectMake(0,150,320,240);
            theScrollview.center = CGPointMake(170,280);
            
            available = CGSizeMake(300, INFINITY);
            CGSize sizeToFit = [bodyLabel sizeThatFits:available];
            
            // adjust label frame
            
            bodyLabel.frame = CGRectMake(0,0,300,sizeToFit.height);
            
            // adjust background image
            
            backgroundImage = [UIImage imageNamed:@"scroll_back_img.png"];
            imgCenter = CGPointMake(160,280);
            backImageFrame = CGRectMake(0,150,320,240);
            
            backImage.frame = backImageFrame;
            backImage.center = imgCenter;
            
            // adjust scrollview contentsize
            
            theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, 
                                                   bodyLabel.frame.size.height + 20);
            
            imageView.frame = CGRectMake(110,0,100,150);
            imageView.contentMode = UIViewContentModeCenter;
            
        } else {
            
            theScrollview.frame = CGRectMake(0,30,320,240);
            theScrollview.center = CGPointMake(170,205);
            
            available = CGSizeMake(300, INFINITY);
            CGSize sizeToFit = [bodyLabel sizeThatFits:available];
            
            // adjust label frame
            
            bodyLabel.frame = CGRectMake(0,0,300,sizeToFit.height);
            
            // adjust background image
            
            backgroundImage = [UIImage imageNamed:@"scroll_back.png"];
            imgCenter = CGPointMake(160,210);
            backImageFrame = CGRectMake(0,30,320,300);
            
            backImage.frame = backImageFrame;
            backImage.center = imgCenter;
            
            // adjust scrollview contentsize
            
            theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, 
                                                   bodyLabel.frame.size.height + 20);
            
            // set audio/video buttons
            
            mediaLabel.frame = CGRectMake(10.0, 330.0, 300.0, 30.0);
            
            if ( event.mode == EventModeAudio )
            {
                audioBtn.frame = CGRectMake(100.0, 370.0, 120.0, 30.0);
            } else if ( event.mode == EventModeVideo )
            {
                videoBtn.frame = CGRectMake(100.0, 370.0, 120.0, 30.0);
            }
            
        }
        
    }
    
}

- (void)loadView
{
    NSLog(@"Calling LoadView Event Controller Landscape");
    
    self.title = event.title;
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    
    // Load the main scroll text window based on event mode
    
    backgroundImage = nil;
    CGPoint imgCenter;
    
    if ( event.mode == EventModeNothing ) {
        
        theScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(90,0,320,300)];
        
        frame = CGRectMake(0,150,340,300);
        imgCenter = CGPointMake(240,140);
        backgroundImage = [UIImage imageNamed:@"scroll_back_lands_none.png"];
        
    } else if (event.mode == EventModeImage) {
        
        theScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(10,0,240,300)];
        
        backgroundImage = [UIImage imageNamed:@"scroll_back_lands_some.png"];
        imgCenter = CGPointMake(127,140);
        frame = CGRectMake(0,150,240,300);
        
    } else {
        
        // It's either a video or audio screen
        
        theScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(10,0,240,300)];
        
        frame = CGRectMake(0,150,240,300);
        imgCenter = CGPointMake(128,140);
        backgroundImage = [UIImage imageNamed:@"scroll_back.png"];
        
    }
    
    backImage= [[UIImageView alloc] initWithImage:backgroundImage];
    backImage.frame = frame;
    backImage.center = imgCenter;
    
    [contentView addSubview:backImage];
    
    // create the scrollview content size
    
    theScrollview.backgroundColor = [UIColor clearColor];
    theScrollview.contentSize = CGSizeMake(300, 9500);
    
    // add body label here
    
    NSInteger labelWidth;
    
    if (event.mode == EventModeNothing )
    {
        labelWidth = 300;
    }
    else {
        labelWidth = 230;
    }
    
    bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 9550.0)];
    bodyLabel.textColor = [UIColor whiteColor];
    bodyLabel.backgroundColor = [UIColor clearColor];
    bodyLabel.textAlignment = UITextAlignmentLeft;
    bodyLabel.text = event.description;
    bodyLabel.font=[UIFont systemFontOfSize:16.0];
    
    // if numberOfLines is set to 0, then it is unlimited
    
    bodyLabel.numberOfLines = 0;
    bodyLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    CGSize available;
    available = CGSizeMake(labelWidth, INFINITY);
    CGSize sizeToFit = [bodyLabel sizeThatFits:available];
    
    frame = bodyLabel.frame; // to get the width
    frame.size.height = sizeToFit.height;    
    bodyLabel.frame = frame;
    
    theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, 
                                           bodyLabel.frame.size.height + 60);
    theScrollview.bounces = NO;

    [theScrollview addSubview:bodyLabel];
    [contentView addSubview:theScrollview];
    
    // Create Buttons if Audio URL is included
    
    if (event.mode==EventModeAudio){
        
        /// do stuff...
        
        mediaLabel = [[UILabel alloc] initWithFrame:CGRectMake(240.0, 60.0, 240.0, 30.0)];
        mediaLabel.textColor = [UIColor whiteColor];
        mediaLabel.backgroundColor = [UIColor clearColor];
        mediaLabel.textAlignment = UITextAlignmentCenter;
        
        
        // determine the correct media Label and audio URL
        
        if ([[labelDict allKeys] containsObject:event.title])
        {
            mediaLabel.text = [labelDict objectForKey:event.title];
            
            self.filePath = [[NSBundle mainBundle] pathForResource:event.dataURL ofType:@"mp3"];
            self.fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
            
        } else {
            mediaLabel.text = @"Generic Audio Sample";
        }
        
        // init the AV audio player
        
        self.audioPlayer = [[AVAudioPlayer alloc] 
                            initWithContentsOfURL:self.fileURL error:nil];
        
        [self.audioPlayer prepareToPlay];
        
        // create audio play button
        
        audioBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *playButtonNormal = [UIImage imageNamed:@"play_button.png"];
        [audioBtn setBackgroundImage:playButtonNormal forState:UIControlStateNormal];
        UIImage *playButtonPressed = [UIImage imageNamed:@"play_button_highlighted.png"];
        [audioBtn setBackgroundImage:playButtonPressed forState:UIControlStateHighlighted];
        
        // set title and action for button
        
        audioBtn.frame = CGRectMake(300.0, 120.0, 120.0, 30.0);
        [audioBtn setTitle:@"Play Audio" forState:UIControlStateNormal];
        
        [audioBtn addTarget:self
                     action:@selector(audioBtnPressed:)
           forControlEvents:UIControlEventTouchUpInside];
        
        [contentView addSubview:mediaLabel];
        [contentView addSubview:audioBtn];
    }
    
    // add video buttons if necessary
    
    if (event.mode==EventModeVideo) {
        
        mediaLabel = [[UILabel alloc] initWithFrame:CGRectMake(240.0, 60.0, 240.0, 30.0)];
        mediaLabel.textColor = [UIColor whiteColor];
        mediaLabel.backgroundColor = [UIColor clearColor];
        mediaLabel.textAlignment = UITextAlignmentCenter;
        
        // determine the correct media Label
        
        if ([[labelDict allKeys] containsObject:event.title])
        {
            mediaLabel.text = [labelDict objectForKey:event.title];
        } else {
            mediaLabel.text = @"Generic Video Sample";
        }
        
        // populate video URL
        
        self.fileURL = [NSURL URLWithString:event.dataURL];
        
        // create video PLAY button
        
        videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *playButtonNormal = [UIImage imageNamed:@"play_button.png"];
        [videoBtn setBackgroundImage:playButtonNormal forState:UIControlStateNormal];
        UIImage *playButtonPressed = [UIImage imageNamed:@"play_button_highlighted.png"];
        [videoBtn setBackgroundImage:playButtonPressed forState:UIControlStateHighlighted];
        
        
        videoBtn.frame = CGRectMake(300.0, 120.0, 120.0, 30.0);
        [videoBtn setTitle:@"Play Video" forState:UIControlStateNormal];
        
        [videoBtn addTarget:self
                     action:@selector(videoBtnPressed:)
           forControlEvents:UIControlEventTouchUpInside];
        
        
        [contentView addSubview:mediaLabel];
        [contentView addSubview:videoBtn];
    }
    
    // add image if necessary
    
    if ( event.mode == EventModeImage )
    {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:event.dataURL]];
        
        imageView.frame = CGRectMake(315,60,100,150);
        imageView.contentMode = UIViewContentModeCenter;
        
        [contentView addSubview:imageView];
    }
    
    self.view = contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rotate) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
    return YES;
}

// button actions

- (IBAction)audioBtnPressed:(id)sender
{
    NSLog(@"vedaBtn pressed");
    
    self.audioPlayer.currentTime = 0;
    
    [self.audioPlayer play];
}

- (IBAction)audioStopBtnPressed:(id)sender
{
    NSLog(@"vedaStopBtn pressed");
    
    [self.audioPlayer stop];
}

- (IBAction)videoBtnPressed:(id)sender
{
    NSLog(@"VideoBtn pressed");
    
    MPMoviePlayerViewController *theMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:self.fileURL]; 
    [self presentMoviePlayerViewControllerAnimated:theMovie];
    theMovie.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [theMovie.moviePlayer play];
}


@end
