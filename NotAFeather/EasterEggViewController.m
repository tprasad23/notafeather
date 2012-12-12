//
//  EasterEggViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EasterEggViewController.h"

@interface EasterEggViewController ()

@end

@implementation EasterEggViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
        
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor purpleColor];
    
    // load text view
    
    UITextField *codeEntry = [[UITextField alloc] initWithFrame:CGRectMake(0,0,150,35)];
    codeEntry.center = CGPointMake(160,100);
    codeEntry.delegate = self;
    codeEntry.borderStyle = UITextBorderStyleRoundedRect;
    codeEntry.textColor = [UIColor blackColor];
    codeEntry.backgroundColor = [UIColor clearColor];
    codeEntry.font = [UIFont systemFontOfSize:17.0];
    codeEntry.autocorrectionType = UITextAutocorrectionTypeNo;
    codeEntry.keyboardType = UIKeyboardTypeDefault;
    codeEntry.returnKeyType = UIReturnKeyDone;
    codeEntry.clearButtonMode = UITextFieldViewModeWhileEditing;  
    
    [contentView addSubview:codeEntry];

    // add button to go back
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backBtn.frame = CGRectMake(300.0, 120.0, 150.0, 30.0);
    backBtn.center = CGPointMake(160,300);
    [backBtn setTitle:@"Get Serious" forState:UIControlStateNormal];
    
    [backBtn addTarget:self
                 action:@selector(backBtnPressed:)
       forControlEvents:UIControlEventTouchUpInside];
    
    [contentView addSubview:backBtn];

    self.view = contentView;
    
    
}

- (IBAction) backBtnPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];    
}

#pragma code to handle dismissal of keyboard

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


#pragma mark text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    if ([textField.text isEqualToString:@"abu"] ||
        [textField.text isEqualToString:@"wpil"] ||
        [textField.text isEqualToString:@"bbt"] ) {
        
        NSLog(@"Inside hello branch");
        
        [textField resignFirstResponder];
        
        NSString *eggURLString;
        
        if ( [textField.text isEqualToString:@"abu"] )
        {
            
            eggURLString = @"http://www.notafeather.info/appvideo/cosby2.m4v";
            
        } else if ( [textField.text isEqualToString:@"bbt"] )
        {
            eggURLString = @"http://www.notafeather.info/appvideo/bbt.m4v";
            
        } else
        {
            eggURLString = @"http://www.notafeather.info/appvideo/wpil.m4v";
        }
        
        NSURL *eggURL = [NSURL URLWithString:eggURLString];
        
        MPMoviePlayerViewController *theMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:eggURL]; 
        [self presentMoviePlayerViewControllerAnimated:theMovie];
        theMovie.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        [theMovie.moviePlayer play];
        
        //textField.backgroundColor = [UIColor redColor];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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

@end
