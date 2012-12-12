//
//  TweetWebViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "LoadingIndicator.h"

@interface TweetWebViewController : UIViewController <UIWebViewDelegate> {
    Tweet* tweet;
    LoadingIndicator *loading;
}

@property (nonatomic, strong) Tweet* tweet;    

@end
