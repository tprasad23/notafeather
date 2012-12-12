//
//  EventViewController.h
//  NotAFeather
//
//  Created by Denny Kwon on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVAudioPlayer.h"
#import <MediaPlayer/MediaPlayer.h>
#import "Event.h"
#import "EventViewController_land.h"
#import "AudioViewController.h"
#import "AudioModel.h"

@interface EventViewController : UIViewController <UIGestureRecognizerDelegate> {
    Event *event;
    bool isLandscape;
    bool isPortrait;
    UIScrollView *theScrollview;
    UIView *theMainView;
    UIView *contentView;
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


@property NSURL* movieURL;
@property (nonatomic, strong) NSURL* fileURL;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImageView *backImage;

@property (nonatomic, strong) NSDictionary* labelDict;

@property (nonatomic, strong) MPMoviePlayerViewController* theMovie;


- (IBAction)audioBtnPressed:(id)sender;
- (IBAction)audioStopBtnPressed:(id)sender;
- (IBAction)videoBtnPressed:(id)sender;
- (void)rotate;

- (void) createPinchRecognizer;
- (void) handlePinchEvent:(UIPinchGestureRecognizer *)recognizer;


@end

