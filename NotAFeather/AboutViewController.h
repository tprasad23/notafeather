//
//  AboutViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AboutViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *theTableView;
    NSArray *aboutArray;
    
}

@property (strong, atomic) NSArray *aboutArray;

@end
