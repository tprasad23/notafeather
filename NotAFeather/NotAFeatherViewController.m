//
//  NotAFeatherViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NotAFeatherViewController.h"


@interface NotAFeatherViewController ()

@end

@implementation NotAFeatherViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // remove the vertical scroll bar because it appears in the center.
    
    theScrollview.showsVerticalScrollIndicator = NO;
    
    // register a rotate function for the notification center.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rotate) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];

}

- (void)rotate
{
    NSLog(@"ROTATE! - NotAFeather View Controller");
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGRect frame;
    NSInteger xOffset = 100;


    if ( orientation==UIDeviceOrientationLandscapeLeft ||
         orientation==UIDeviceOrientationLandscapeRight ){
        
        theScrollview.frame = CGRectMake(0,0,480,450);
        
        theScrollview.contentSize = CGSizeMake(theScrollview.frame.size.width, 450);
        
        // return;
        
        // move elements over to the right
        
        frame = titleImgView.frame;
        frame.origin.x += xOffset;
        titleImgView.frame = frame;
        
        frame = hinduBtn.frame;
        frame.origin.x += xOffset;
        hinduBtn.frame = frame;
        
        frame = hinduTxtBtn.frame;
        frame.origin.x += xOffset;
        hinduTxtBtn.frame = frame;
        
        frame = immiBtn.frame;
        frame.origin.x += xOffset;
        immiBtn.frame = frame;
        
        frame = immiTxtBtn.frame;
        frame.origin.x += xOffset;
        immiTxtBtn.frame = frame;
        
        frame = quizBtn.frame;
        frame.origin.x += xOffset;
        quizBtn.frame = frame;
        
        frame = quizTxtBtn.frame;
        frame.origin.x += xOffset;
        quizTxtBtn.frame = frame;
        
        frame = twitBtn.frame;
        frame.origin.x += xOffset;
        twitBtn.frame = frame;
        
        frame = twitTxtBtn.frame;
        frame.origin.x += xOffset;
        twitTxtBtn.frame = frame;

        

    }
    else
    {
        
        // adjust the frame size back to the portrait mode
        
        theScrollview.frame = CGRectMake(0,0,320,480);
        theScrollview.contentSize = CGSizeMake(320, theScrollview.frame.size.height);
        
        // move elements back
        
        frame = titleImgView.frame;
        frame.origin.x -= xOffset;
        titleImgView.frame = frame;
        
        frame = hinduBtn.frame;
        frame.origin.x -= xOffset;
        hinduBtn.frame = frame;
        
        frame = hinduTxtBtn.frame;
        frame.origin.x -= xOffset;
        hinduTxtBtn.frame = frame;
        
        frame = immiBtn.frame;
        frame.origin.x -= xOffset;
        immiBtn.frame = frame;
        
        frame = immiTxtBtn.frame;
        frame.origin.x -= xOffset;
        immiTxtBtn.frame = frame;
        
        frame = quizBtn.frame;
        frame.origin.x -= xOffset;
        quizBtn.frame = frame;
        
        frame = quizTxtBtn.frame;
        frame.origin.x -= xOffset;
        quizTxtBtn.frame = frame;
        
        frame = twitBtn.frame;
        frame.origin.x -= xOffset;
        twitBtn.frame = frame;
        
        frame = twitTxtBtn.frame;
        frame.origin.x -= xOffset;
        twitTxtBtn.frame = frame;

    }

}

- (void)viewDidUnload
{
    
    hinduBtn = nil;
    hinduTxtBtn = nil;
    immiBtn = nil;
    immiTxtBtn = nil;
    quizBtn = nil;
    quizTxtBtn = nil;
    twitBtn = nil;
    twitTxtBtn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)aboutButtonClicked:(id)sender {
    
    NSLog(@"aboutButtonClicked");
    
    AboutViewController *aboutVC = [[AboutViewController alloc] init];
    
    UINavigationController *navCtr = [[UINavigationController alloc] initWithRootViewController:aboutVC];
    //    navCtr.navigationBarHidden = TRUE;
    navCtr.navigationBar.barStyle = UIBarStyleBlack;    
    
    [self presentModalViewController:navCtr animated:YES];

}

- (IBAction)onImmigrationClicked:(id)sender
{
    NSLog(@"onImmigrationClicked");
    
    ListViewController *list = [[ListViewController alloc] init];
    
    UINavigationController *navCtr = [[UINavigationController alloc] initWithRootViewController:list];
//    navCtr.navigationBarHidden = TRUE;
    navCtr.navigationBar.barStyle = UIBarStyleBlack;    
              
    [self presentModalViewController:navCtr animated:YES];


}

- (IBAction)onHinduismClicked:(id)sender {
    NSLog(@"onHinduismClicked");
    
    HinduViewController *hinduVC = [[HinduViewController alloc] init];
    
    UINavigationController *navCtr = [[UINavigationController alloc] initWithRootViewController:hinduVC];
    //    navCtr.navigationBarHidden = TRUE;
    navCtr.navigationBar.barStyle = UIBarStyleBlack;
    
    [self presentModalViewController:navCtr animated:YES];

 }

- (IBAction)onImplicitClicked:(id)sender {
    NSLog(@"onImplicitClicked");
    
    /* ImplicitViewController *impVC = [[ImplicitViewController alloc] init];
    
    UINavigationController *navCtr = [[UINavigationController alloc] initWithRootViewController:impVC];
    //    navCtr.navigationBarHidden = TRUE;
    navCtr.navigationBar.barStyle = UIBarStyleBlack; */
    
    QuizViewController *quiz = [[QuizViewController alloc] init];
    [self presentModalViewController:quiz animated:YES];

}

- (IBAction)onTwitterFeed:(id)sender {
    NSLog(@"onImplicitClicked");
    
    TwitterViewController *tvc = [[TwitterViewController alloc] init];
    
    UINavigationController *navCtr = [[UINavigationController alloc] initWithRootViewController:tvc];
    //    navCtr.navigationBarHidden = TRUE;
    navCtr.navigationBar.barStyle = UIBarStyleBlack;
    
    [self presentModalViewController:navCtr animated:YES];
    
}

- (IBAction)quizBtnTapped:(id)sender
{
    NSLog(@"from main screen, quizBtnTapped:");
    QuizViewController *quiz = [[QuizViewController alloc] init];
    [self presentModalViewController:quiz animated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSLog(@"prepareForSegue");
//    if ([segue.identifier isEqualToString:@"immigrant"]) {
//        ImmigrantViewController* detailView = segue.destinationViewController;
//    }
}


@end
