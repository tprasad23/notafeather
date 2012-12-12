//
//  AudioViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "AVFoundation/AVAudioPlayer.h"
#import "Event.h"
#import "AudioModel.h"

@interface AudioViewController : UIViewController <AVAudioPlayerDelegate> {

    Event         *event;
    AudioModel    *audioData;
    AVAudioPlayer *player;
    NSTimer		  *updateTimer;
    
    UIImage		  *playBtnBG;
	UIImage		  *pauseBtnBG;
    
    CGRect        pauseFrame;
    CGRect        playFrame;
    
    NSInteger     volumeHeightVal;
    NSInteger     playBtnHeightVal;
}

@property (nonatomic, strong) Event* event;
@property (nonatomic, strong) AudioModel* audioData;

// components variables

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UISlider* progressSlider;
@property (nonatomic, strong) UISlider* volumeSlider;
@property (nonatomic, strong) UIButton* playButton;

@property (nonatomic, strong) UILabel* currentTimeLabel;
@property (nonatomic, strong) UILabel* durationLabel;
@property (nonatomic, strong) UIImageView* softerImgView;
@property (nonatomic, strong) UIImageView* louderImgView;

@property (nonatomic, strong) AVAudioPlayer *player;

@property (nonatomic, strong) NSTimer *updateTimer;
@property (nonatomic, strong) NSURL* fileURL;



- (IBAction)playButtonPressed:(UIButton*)sender;

@end

