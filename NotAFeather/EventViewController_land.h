//
//  EventViewController_land.h
//  NotAFeather
//
//  Created by Teju Prasad on 8/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVAudioPlayer.h"
#import <MediaPlayer/MediaPlayer.h>
#import "Event.h"

@interface EventViewController_land : UIViewController {

    Event *event;
    UIScrollView *theScrollview;

}

@property (nonatomic, strong) Event *event;
@property (nonatomic, strong) NSString* titleString;
@property (nonatomic, strong) NSString* bodyString;
@property (nonatomic, strong) NSString* filePath;


@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* bodyLabel;

@property (nonatomic, strong) UILabel* mediaLabel;
@property (nonatomic, strong) UIButton* audioBtn;
@property (nonatomic, strong) UIButton* audioStopBtn;
@property (nonatomic, strong) UIButton* videoBtn;

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;


@property NSURL* movieURL;
@property (nonatomic, strong) NSURL* fileURL;

@property (nonatomic, strong) UIImageView *imageView; // for image event mode
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImageView *backImage;


@property (nonatomic, strong) NSDictionary* labelDict;


- (IBAction)audioBtnPressed:(id)sender;
- (IBAction)audioStopBtnPressed:(id)sender;
- (IBAction)videoBtnPressed:(id)sender;


@end
