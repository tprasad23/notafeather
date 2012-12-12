//
//  AudioViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AudioViewController.h"

@interface AudioViewController ()

@end

@implementation AudioViewController

@synthesize event;
@synthesize audioData;
@synthesize titleLabel;
@synthesize progressSlider;
@synthesize volumeSlider;
@synthesize currentTimeLabel;
@synthesize durationLabel;
@synthesize playButton;
@synthesize player;
@synthesize updateTimer;
@synthesize fileURL;
@synthesize softerImgView;
@synthesize louderImgView;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    updateTimer = nil;

    // load the URL
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:audioData.audioURL ofType:@"mp3"];
    
    // Use fileURLWithPath to handle internal file path
    
    self.fileURL = [NSURL fileURLWithPath:filePath];

    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];

    if (self.player)
    {
        //fileName.text = [NSString stringWithFormat: @"%@ (%d ch.)", [[player.url relativePath] lastPathComponent], player.numberOfChannels, nil];
        [self updateViewForPlayerInfo:player];
        [self updateViewForPlayerState:player];
        player.numberOfLoops = 0;
        player.delegate = self;
        
        // set volume to 50%
        
        player.volume = .5;
        
        // because slider is set to 0 to 50 range
        
        volumeSlider.value = 50 * (player.volume);
        [self.player prepareToPlay];
    }
    
    // for orientations
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rotate) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];

    
}

- (void)rotate
{

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    // Rotate TO Landscape
    
    if (orientation==UIInterfaceOrientationLandscapeLeft || 
        orientation==UIInterfaceOrientationLandscapeRight)
    {
        
        titleLabel.frame = CGRectMake(100, 22, 275, 21);
        progressSlider.frame = CGRectMake(90, 75, 300, 23);
        volumeSlider.frame = CGRectMake(90, 175, 300, 23);
        
        currentTimeLabel.frame = CGRectMake(30, 75, 30, 21);
        durationLabel.frame = CGRectMake(420, 75, 30, 21);
        
        softerImgView.frame = CGRectMake(45, 180, 9, 15);
        louderImgView.frame = CGRectMake(420, 175, 22, 21);
        
        playButton.frame = CGRectMake(220, 220, 35, 35);
    }
    else 
    {
        titleLabel.frame = CGRectMake(22, 60, 275, 21);
        progressSlider.frame = CGRectMake(39, 125, 241, 23);
        volumeSlider.frame = CGRectMake(39, volumeHeightVal, 241, 23);
        
        currentTimeLabel.frame = CGRectMake(8, 126, 30, 21);
        durationLabel.frame = CGRectMake(285, 126, 30, 21);

        softerImgView.frame = CGRectMake(20, volumeHeightVal+3, 9, 15);
        louderImgView.frame = CGRectMake(285, volumeHeightVal, 22, 21);
    
        playButton.frame = CGRectMake(130, playBtnHeightVal, 50, 50);
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) viewWillDisappear:(BOOL)animated
{
    
    // stop audio if we are in "mid play" and user its back button for any reason.
    
    if (player.playing)
    {
        [player stop];
    }
}

- (void)loadView
{

    // View Construction
    
    // Get the orientation
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        
    
    // constructing the background 
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor clearColor];
    
    volumeHeightVal = 280;
    playBtnHeightVal = volumeHeightVal + 30;
    
    // create frames for components
    
    CGRect labelFrame = CGRectMake(22, 60, 275, 21);
    CGRect progressSliderFrame = CGRectMake(39, 125, 241, 23);
    CGRect volumeSliderFrame = CGRectMake(39, volumeHeightVal, 241, 23);
    CGRect currentTimeFrame = CGRectMake(8, 126, 30, 21);
    CGRect durationFrame = CGRectMake(285, 126, 30, 21);
    
    CGRect softerFrame = CGRectMake(20, volumeHeightVal+3, 9, 15);
    CGRect louderFrame = CGRectMake(285, volumeHeightVal, 22, 21);
    
    playFrame = CGRectMake(130, playBtnHeightVal, 50, 50);
    
    // change frame details if its  landscape orientation.
    
    if (orientation==UIInterfaceOrientationLandscapeLeft || 
        orientation==UIInterfaceOrientationLandscapeRight) 
    {
        
        
        labelFrame = CGRectMake(100, 22, 275, 21);
        progressSliderFrame = CGRectMake(90, 75, 300, 23);
        volumeSliderFrame = CGRectMake(90, 175, 300, 23);
        
        currentTimeFrame = CGRectMake(30, 75, 30, 21);
        durationFrame = CGRectMake(420, 75, 30, 21);
        
        softerFrame = CGRectMake(45, 180, 9, 15);
        louderFrame = CGRectMake(420, 175, 22, 21);
        
        playFrame = CGRectMake(220, 220, 35, 35);
        
    }
    
    // CREATE LABELS
    
    titleLabel = [[UILabel alloc] initWithFrame:labelFrame];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.frame = labelFrame;
    titleLabel.text = self.audioData.title;
    
    durationLabel = [[UILabel alloc] initWithFrame:durationFrame];
    durationLabel.textColor = [UIColor whiteColor];
    durationLabel.backgroundColor = [UIColor clearColor];
    durationLabel.textAlignment = UITextAlignmentCenter;
    durationLabel.text = @"0:00";
    durationLabel.font = [UIFont systemFontOfSize:12.0];
    durationLabel.frame = durationFrame;
    
    currentTimeLabel = [[UILabel alloc] initWithFrame:currentTimeFrame];
    currentTimeLabel.textColor = [UIColor whiteColor];
    currentTimeLabel.backgroundColor = [UIColor clearColor];
    currentTimeLabel.textAlignment = UITextAlignmentCenter;
    currentTimeLabel.text = @"0:00";
    currentTimeLabel.font = [UIFont systemFontOfSize:12.0];
    currentTimeLabel.frame = currentTimeFrame;
    
        
    
    [contentView addSubview:titleLabel];
    [contentView addSubview:durationLabel];
    [contentView addSubview:currentTimeLabel];
    
    // CREATE PROGRESS SLIDER
    
    progressSlider = [[UISlider alloc] initWithFrame:progressSliderFrame];
    [progressSlider setBackgroundColor:[UIColor clearColor]];
    progressSlider.minimumValue = 0.0;
    progressSlider.maximumValue = 50.0;
    progressSlider.continuous = YES;
    progressSlider.value = 0.0;
    
        
    // CREATE VOLUME SLIDER
    
    volumeSlider = [[UISlider alloc] initWithFrame:volumeSliderFrame];
    [volumeSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [volumeSlider setBackgroundColor:[UIColor clearColor]];
    volumeSlider.minimumValue = 0.0;
    volumeSlider.maximumValue = 50.0;
    volumeSlider.continuous = YES;
    volumeSlider.value = 25.0;

    [contentView addSubview:progressSlider];
    [contentView addSubview:volumeSlider];

    // IMAGES
    
    softerImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"volume_down.png"]];
    softerImgView.frame = softerFrame;
    
    louderImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"volume_up.png"]];
    louderImgView.frame = louderFrame;
    
    
    
    [contentView addSubview:softerImgView];
    [contentView addSubview:louderImgView];
    
    // PLAY BUTTON
    
    playBtnBG = [UIImage imageNamed:@"play.png"];
    pauseBtnBG = [UIImage imageNamed:@"pause.png"];
    
    playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = playFrame;
    
    [playButton addTarget:self
                   action:@selector(playButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    
    // don't set the play button resizing mask because we have to redraw the view.
    
        
    [contentView addSubview:playButton];
    
    
    self.view = contentView;
}

- (void)sliderAction:(UISlider *)slider
{
    double v = slider.value/50.0f;
    
    player.volume = v;
}

# pragma mark Audio Player Support Functions


// updates the progress bar display.

-(void)updateCurrentTimeForPlayer:(AVAudioPlayer *)p
{
    
    // update the current time label
    
	currentTimeLabel.text = [NSString stringWithFormat:@"%d:%02d", (int)p.currentTime / 60, (int)p.currentTime % 60, nil];
	progressSlider.value = p.currentTime;
}

- (void)updateCurrentTime
{
	[self updateCurrentTimeForPlayer:self.player];
}

-(void)updateViewForPlayerInfo:(AVAudioPlayer*)p
{
	durationLabel.text = [NSString stringWithFormat:@"%d:%02d", (int)p.duration / 60, (int)p.duration % 60, nil];
	progressSlider.maximumValue = p.duration;
	volumeSlider.value = p.volume;
    
}

- (void)updateViewForPlayerState:(AVAudioPlayer *)p
{
	[self updateCurrentTimeForPlayer:p];
    
	if (updateTimer) 
		[updateTimer invalidate];
    
	if (p.playing)
	{
        [playButton setBackgroundImage:pauseBtnBG forState:UIControlStateNormal];
		updateTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(updateCurrentTime) userInfo:p repeats:YES];
	}
	else
	{
        [playButton setBackgroundImage:playBtnBG forState:UIControlStateNormal];
		updateTimer = nil;
	}
	
}

-(void)pausePlaybackForPlayer:(AVAudioPlayer*)p
{
	[p pause];
	[self updateViewForPlayerState:p];
}

-(void)startPlaybackForPlayer:(AVAudioPlayer*)p
{
	if ([p play]) {
		[self updateViewForPlayerState:p];
	}
	else
		NSLog(@"Could not play %@\n", p.url);
}

- (IBAction)playButtonPressed:(UIButton *)sender
{
    
	if (player.playing == YES)
		[self pausePlaybackForPlayer: player];
        
	else
		[self startPlaybackForPlayer: player];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
    // reset the audio play button to "play" after finishing.
    
    if ( flag == YES )
    {
        [playButton setBackgroundImage:playBtnBG forState:UIControlStateNormal];
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;

}

@end
