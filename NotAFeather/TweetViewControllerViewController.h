//
//  TweetViewControllerViewController.h
//  NotAFeather
//
//  Created by Denny Kwon on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TweetWebViewController.h"

@interface TweetViewControllerViewController : UIViewController {
    //IBOutlet UILabel *tweetLabel;
    
    UILabel *tweetLabel;
    Tweet *tweet;
    
    UIButton *linkButton;
}

@property (strong, nonatomic) UILabel *tweetLabel;
@property (strong, nonatomic) Tweet *tweet;


- (IBAction)onLinkClicked:(id)sender;

@end
