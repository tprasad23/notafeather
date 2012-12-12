//
//  ImplicitViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImplicitViewController : UIViewController

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* bodyLabel;

- (IBAction) backButton:(id)sender;

@end


