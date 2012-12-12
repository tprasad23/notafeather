//
//  HinduViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HinduViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *theTableView;
    NSArray *hinduArray;   
}

@property (strong, atomic) NSArray *hinduArray;

@end
