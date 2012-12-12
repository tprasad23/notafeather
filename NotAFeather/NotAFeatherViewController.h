//
//  NotAFeatherViewController.h
//  NotAFeather
//
//  Created by Teju Prasad on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "HinduViewController.h"
#import "AboutViewController.h"
#import "ImplicitViewController.h"
#import "TwitterViewController.h"
#import "QuizViewController.h"
#import "ImmigrantViewController.h"

@interface NotAFeatherViewController : UIViewController {
    
    // connect this scrollview outlet to the story board
    // scroll view in the view heirarchy.
    
    IBOutlet UIScrollView *theScrollview;
    IBOutlet UIImageView *titleImgView;
    
    IBOutlet UIButton *hinduBtn;
    IBOutlet UIButton *hinduTxtBtn;
    
    IBOutlet UIButton *immiBtn;
    IBOutlet UIButton *immiTxtBtn;
    
    IBOutlet UIButton *quizBtn;
    IBOutlet UIButton *quizTxtBtn;
    
    IBOutlet UIButton *twitBtn;
    IBOutlet UIButton *twitTxtBtn;

}


- (IBAction)aboutButtonClicked:(id)sender;
- (IBAction)onImmigrationClicked:(id)sender;
- (IBAction)onHinduismClicked:(id)sender;
- (IBAction)onImplicitClicked:(id)sender;
- (IBAction)onTwitterFeed:(id)sender;
- (IBAction)quizBtnTapped:(id)sender;
@end
