//
//  EventViewController.m
//  NotAFeather
//
//  Created by Denny Kwon on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController

@synthesize titleLabel;
@synthesize titleString;
@synthesize bodyString;
@synthesize bodyLabel;
@synthesize audioBtn;
@synthesize videoBtn;
@synthesize audioStopBtn;
@synthesize event;
@synthesize mediaLabel;
@synthesize movieURL;
@synthesize filePath;
@synthesize fileURL;
@synthesize labelDict;
@synthesize imageView;
@synthesize backgroundImage;
@synthesize backImage;
@synthesize theMovie;


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
                                                  @"Director's Statement", 
                                                  @"Bhagavad Gita", nil];
        
        NSArray *objs = [NSArray arrayWithObjects:@"Learn about Yoga", 
                                                  @"Vedic Chanting Sample",
                                                  @"History of 'Hindu'",
                                                  @"Learn about the Act",
                                                  @"Learn about the Act",
                                                  @"Words from the Director", 
                                                  @"Bhagavad Gita Singing", nil];
                                                
        labelDict = [NSDictionary dictionaryWithObjects:objs forKeys:keys];

        
        
    }
    return self;
}

- (void)rotate
{
        
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
    
    
    if (orientation==UIInterfaceOrientationPortrait || orientation==UIInterfaceOrientationPortraitUpsideDown){
        
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

#pragma mark loadView function

- (void)loadView
{
    NSString *mode = nil;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation==UIInterfaceOrientationPortrait || orientation==UIInterfaceOrientationPortraitUpsideDown){
        mode = @"Portrait";
        isPortrait = 1;
    }
    else{
        mode = @"Landscape";
        isPortrait = 0;
    }


    self.title = event.title;

    CGRect frame = [UIScreen mainScreen].applicationFrame;
    contentView = [[UIView alloc] initWithFrame:frame];
    
    // Load the main scroll text window based on event mode
    
    backgroundImage = nil;
    CGPoint imgCenter;
    
    if ( isPortrait )
    {
    
        if ( event.mode == EventModeNothing ) {
            
            theScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,300,400)];
            theScrollview.center = CGPointMake(160,210);
            
            frame = CGRectMake(0,30,320,frame.size.height-30);
            imgCenter = CGPointMake(160,210);
            backgroundImage = [UIImage imageNamed:@"scroll_back_none.png"];
            
        } else if (event.mode == EventModeImage) {
            
            theScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,150,320,240)];
            theScrollview.center = CGPointMake(170,280);
            
            backgroundImage = [UIImage imageNamed:@"scroll_back_img.png"];
            imgCenter = CGPointMake(160,280);
            frame = CGRectMake(0,150,320,240);

        } else {
            
            // It's either a video or audio screen
            
            theScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,30,320,240)];
            theScrollview.center = CGPointMake(170,205);
            
            frame = CGRectMake(0,30,320,300);
            imgCenter = CGPointMake(160,210);
            backgroundImage = [UIImage imageNamed:@"scroll_back.png"];
            
        }
    }
    else {
        
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
            backgroundImage = [UIImage imageNamed:@"scroll_back_lands_some.png"];
            
        }
    }
    
    backImage = [[UIImageView alloc] initWithImage:backgroundImage];
    backImage.frame = frame;
    backImage.center = imgCenter;
    
    //theMainView = [[UIView alloc] initWithFrame:frame];
    
    [contentView addSubview:backImage];
    
    if ( isPortrait )
    {
        // create the scrollview content size
        
        theScrollview.backgroundColor = [UIColor clearColor];
        theScrollview.contentSize = CGSizeMake(300, 9500);

        // add body label here
        
        bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300.0, 9550.0)];
        bodyLabel.textColor = [UIColor whiteColor];
        bodyLabel.backgroundColor = [UIColor clearColor];
        bodyLabel.textAlignment = UITextAlignmentLeft;
        bodyLabel.text = event.description;
        bodyLabel.font=[UIFont systemFontOfSize:16.0];
        
        // if numberOfLines is set to 0, then it is unlimited
        
        bodyLabel.numberOfLines = 0;
        bodyLabel.lineBreakMode = UILineBreakModeWordWrap;

        CGSize available;
        available = CGSizeMake(300, INFINITY);
        CGSize sizeToFit = [bodyLabel sizeThatFits:available];
        
        frame = bodyLabel.frame; // to get the width
        frame.size.height = sizeToFit.height;    
        bodyLabel.frame = frame;

        theScrollview.contentSize = CGSizeMake(bodyLabel.frame.size.width, bodyLabel.frame.size.height + 20);
        theScrollview.bounces = NO;

    } else {
        
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
    
    }

    [theScrollview addSubview:bodyLabel];

    [contentView addSubview:theScrollview];

    // Create Buttons if Audio URL is included
    
    if ( isPortrait )
        
    {
        if (event.mode==EventModeAudio){
            
            /// do stuff...
            
            mediaLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 330.0, 300.0, 30.0)];
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
            
          //  self.audioPlayer = [[AVAudioPlayer alloc] 
            //                    initWithContentsOfURL:self.fileURL error:nil];
            
          //  [self.audioPlayer prepareToPlay];
            
            // create audio play button
            
            audioBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            UIImage *playButtonNormal = [UIImage imageNamed:@"play_button.png"];
            [audioBtn setBackgroundImage:playButtonNormal forState:UIControlStateNormal];
            UIImage *playButtonPressed = [UIImage imageNamed:@"play_button_highlighted.png"];
            [audioBtn setBackgroundImage:playButtonPressed forState:UIControlStateHighlighted];
            
            // set title and action for button
            
            audioBtn.frame = CGRectMake(100.0, 370.0, 120.0, 30.0);
            [audioBtn setTitle:@"Play Audio" forState:UIControlStateNormal];
            
            [audioBtn addTarget:self
                         action:@selector(audioBtnPressed:)
               forControlEvents:UIControlEventTouchUpInside];
            
            [contentView addSubview:mediaLabel];
            [contentView addSubview:audioBtn];
        }
        
        // add video buttons if necessary
        
        if (event.mode==EventModeVideo) {
            
            mediaLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 330.0, 300.0, 30.0)];
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
            
            
            videoBtn.frame = CGRectMake(100.0, 370.0, 120.0, 30.0);
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
                
            imageView.frame = CGRectMake(110,0,100,150);
            imageView.contentMode = UIViewContentModeCenter;
              
            [contentView addSubview:imageView];
                
        }
        
    } // end isPortrait
    else {
        
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
                
            } else {
                
                mediaLabel.text = @"Generic Audio Sample";
                
            }
            
            // init the audio button
            
                        
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
        
    }
    
    
    
    self.view = contentView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rotate) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    
    // register for movie notification object
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myMovieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];

    [self becomeFirstResponder];
    [self createPinchRecognizer];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.title = @"Back";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = event.title;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
    
    /* return (interfaceOrientation == UIInterfaceOrientationPortrait || 
            interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown); */
}


# pragma mark - Create Gesture Recognizers

- (void) createPinchRecognizer
{
    UIPinchGestureRecognizer *recognizer = 
        [[UIPinchGestureRecognizer alloc]
            initWithTarget:self
         action:@selector(handlePinchEvent:)];
    
    [contentView addGestureRecognizer:recognizer];
    [recognizer setDelegate:self];

}


# pragma mark - Event Handlers

- (void) handlePinchEvent:(UIPinchGestureRecognizer *) recognizer
{
    CGFloat scale = [(UIPinchGestureRecognizer *)recognizer scale];
    
    if ([recognizer state] == UIGestureRecognizerStateEnded) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.10];
        [contentView setTransform:CGAffineTransformIdentity];
        [backImage setTransform:CGAffineTransformIdentity];
        [UIView commitAnimations];
    } else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.10];
        [contentView setTransform:CGAffineTransformMakeScale(scale, scale)];
        [backImage setTransform:CGAffineTransformMakeScale(scale, scale)];
        [UIView commitAnimations];
    }
}

#pragma mark Button Handlers

- (IBAction)audioBtnPressed:(id)sender
{

    AudioViewController* audioVC = [[AudioViewController alloc] init];
    AudioModel *audioModel = [[AudioModel alloc] init];
    
    audioModel.title = self.title;
    audioModel.audioURL = event.dataURL;
    
    audioVC.audioData = audioModel;
    
    [self.navigationController pushViewController:audioVC animated:YES];
    
}

- (IBAction)audioStopBtnPressed:(id)sender
{
   
   //  [self.audioPlayer stop];
}

- (IBAction)videoBtnPressed:(id)sender
{
    
    theMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:self.fileURL];
    
    // play the video
    
    [self presentMoviePlayerViewControllerAnimated:theMovie];
    theMovie.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [theMovie.moviePlayer play];
    
}

- (void) myMovieFinishedCallback:(NSNotification*)notification {
    
    NSNumber* reason = [[notification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    NSInteger intReason = [reason intValue];
    
    if (intReason == MPMovieFinishReasonPlaybackError)
    {
        UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [errorAlert show];
    }
}

- (BOOL) canBecomeFirstResponder {

    return YES;

}

@end
