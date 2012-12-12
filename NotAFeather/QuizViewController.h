//
//  QuizViewController.h
//  NotAFeather
//
//  Created by Denny Kwon on 8/21/12.
//
//

#import <UIKit/UIKit.h>
#import "QuizModel.h"
#import "EasterEggViewController.h"
#import "LoadingIndicator.h"


@interface QuizViewController : UIViewController <NSXMLParserDelegate, UIAlertViewDelegate, UIGestureRecognizerDelegate> {
    NSMutableArray *buttons;
    NSMutableArray *textButtons;
    
    NSArray *detailArray;
    NSArray *wrongArray;
    NSArray *correctArray;
    
    NSMutableArray *quizData;
    NSMutableArray *quizIndex;  // array to store random order
    NSInteger currentDisplayed;
    NSInteger currentIndex;     // index to random order array
    
    UIView *contentView;
    UIImageView *tapView;
    NSXMLParser *rssParser;
    
    NSString *currentElement;
    NSMutableString *currentAnswer;
    QuizModel *currentEntry;
    
    LoadingIndicator *loading;
}


@property (strong, nonatomic) UIButton *firstBtn;
@property (strong, nonatomic) UIButton *secondBtn;
@property (strong, nonatomic) UIButton *thirdBtn;
@property (strong, nonatomic) UIButton *fourthBtn;

@property (strong, nonatomic) UIButton *firstTxtBtn;
@property (strong, nonatomic) UIButton *secondTxtBtn;
@property (strong, nonatomic) UIButton *thirdTxtBtn;
@property (strong, nonatomic) UIButton *fourthTxtBtn;

@property (strong, nonatomic) UIButton *prevBtn;
@property (strong, nonatomic) UIButton *nextBtn;
@property (strong, nonatomic) UIButton *dismissBtn;
@property (strong, nonatomic) UILabel *questionLabel;
@property (strong, nonatomic) NSArray *wrongArray;
@property (strong, nonatomic) NSArray *correctArray;
@property (strong, nonatomic) NSArray *detailArray;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *tapView;

- (void)prevTapped:(id)sender;
- (void)nextTapped:(id)sender;
- (IBAction) dismissTapped:(id)sender;

-(void) parseTheURL:(NSString *)URL;
-(CGRect) GetLabelFrame:(UILabel *)label;
-(void) DumpFrame:(CGRect)theFrame;
-(NSMutableArray *) getRandomInts:(int)amount;



@end
