//
//  Event.h
//  NotAFeather
//
//  Created by Denny Kwon on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    EventModeNothing = 0,
    EventModeImage,
    EventModeAudio,
    EventModeVideo,
} EventMode;

@interface Event : NSObject {
    
    EventMode mode;
    
    //required
    NSString *title;
    NSString *description;
    
    // can be nil:
    NSString *audioURL;
    NSString *videoURL;
    NSString *imageURL;
    
    NSString *dataURL;
    
//    NSData *imgData;

}

@property (nonatomic) EventMode mode;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;

//replace with singe 'url' property eventually:
@property (strong, nonatomic) NSString *audioURL;
@property (strong, nonatomic) NSString *videoURL;
@property (strong, nonatomic) NSString *imageURL;

@property (strong, nonatomic) NSString *dataURL;


@end
