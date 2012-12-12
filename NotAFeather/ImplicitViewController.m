//
//  ImplicitViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImplicitViewController.h"

@interface ImplicitViewController ()

@end

@implementation ImplicitViewController

@synthesize titleLabel;
@synthesize bodyLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    
    // Load the main scroll text window   
    
    UIScrollView *theScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,30,320,300)];
    
    // create the scrollview size
    
    theScrollview.backgroundColor = [UIColor grayColor];
    theScrollview.contentSize = CGSizeMake(320, 1500);
    
    // add title label here.
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 30.0)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor blackColor];
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.text = @"Implicit Stereotypes";
    
    [contentView addSubview:titleLabel];
    
    // construct a bar button item to move backwards.
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(backButton:)];
    
    self.navigationItem.rightBarButtonItem = backButton;
    
    
    // add body label

    NSString *tempBodyStr = @"Description for Implicit Stereotypes";
    
    bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10, 300.0, 50.0)];
    
    // if numberOfLines is set to 0, then it is unlimited
    
    bodyLabel.numberOfLines = 0;
    bodyLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    CGSize size = [tempBodyStr sizeWithFont:bodyLabel.font constrainedToSize:CGSizeMake(320, 1500) lineBreakMode:bodyLabel.lineBreakMode];
    
    frame = bodyLabel.frame; // to get the width
    frame.size.height = size.height;    
    bodyLabel.frame = frame;
    
    bodyLabel.textColor = [UIColor whiteColor];
    bodyLabel.backgroundColor = [UIColor clearColor];
    bodyLabel.textAlignment = UITextAlignmentLeft;
    bodyLabel.text = tempBodyStr;
    
    [theScrollview addSubview:bodyLabel];
    [contentView addSubview:theScrollview];

    self.view = contentView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"'Stereotyping'";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) backButton:(id)sender
{
    NSLog(@"Back Button clicked");
    
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
