//
//  ImmigrantTextViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImmigrantTextViewController : UIViewController 

@property (strong, nonatomic) NSMutableString *nameString;
@property (weak, nonatomic) IBOutlet UILabel *labelText;


- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
                title:(NSString *)name;


@end
