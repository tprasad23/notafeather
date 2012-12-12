//
//  AudioModel.h
//  NotAFeather
//
//  Created by Teju Prasad on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioModel : NSObject {

    NSString* title;
    NSString* audioURL; 

}

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *audioURL;

    
@end
