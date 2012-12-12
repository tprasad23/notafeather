//
//  TwitterViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URLRequest.h"
#import "JSON.h"
#import "Tweet.h"
#import "TweetViewControllerViewController.h"
#import "LoadingIndicator.h"

@interface TwitterViewController : UIViewController <URLRequestDelegate, UITableViewDelegate, UITableViewDataSource> {
    URLRequest *req;
    NSMutableArray *tweets;
    
    UITableView *theTableview;
    LoadingIndicator *loading;
}

@end
