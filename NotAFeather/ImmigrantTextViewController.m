//
//  ImmigrantTextViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImmigrantTextViewController.h"

@interface ImmigrantTextViewController ()

@end

@implementation ImmigrantTextViewController
@synthesize labelText;
@synthesize nameString;


- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
                title:(NSString *)name

{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self.nameString setString:name];
    }
       
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [labelText setText:[self nameString]];
}

- (void)viewDidUnload
{
    [self setLabelText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
