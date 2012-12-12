//
//  ListViewController.h
//  NotAFeather
//
//  Created by Denny Kwon on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImmigrantTextViewController.h"
#import "EventViewController.h"
#import "Event.h"

// build with the protocol

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *theTableView;
    NSArray *immigrantArray;
}

@property (strong, atomic) NSArray *immigrantArray;

- (IBAction) backButton:(id)sender;

@end
