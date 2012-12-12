//
//  ImmigrantViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImmigrantViewController : UITableViewController

@property (strong, atomic) NSArray *immigrantArray;
@property (strong, atomic) NSDictionary *immigrantTextDict;


- (IBAction)backButtonPressed:(id)sender;

@end
