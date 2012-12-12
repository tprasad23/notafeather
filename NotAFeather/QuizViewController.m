//
//  QuizViewController.m
//  NotAFeather
//
//  Created by Denny Kwon on 8/21/12.
//
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
@synthesize firstBtn;
@synthesize secondBtn;
@synthesize thirdBtn;
@synthesize fourthBtn;

@synthesize firstTxtBtn;
@synthesize secondTxtBtn;
@synthesize thirdTxtBtn;
@synthesize fourthTxtBtn;

@synthesize prevBtn;
@synthesize nextBtn;

@synthesize questionLabel;
@synthesize detailArray;
@synthesize wrongArray;
@synthesize correctArray;
@synthesize detailLabel;
@synthesize contentView;
@synthesize tapView;
@synthesize dismissBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        
        buttons = [[NSMutableArray alloc] init];
        textButtons = [[NSMutableArray alloc] init];
        quizData = [[NSMutableArray alloc] init];
        currentDisplayed = 0;
        
        // Initialize the "wrong answer" array
        
        wrongArray = [[NSArray alloc] initWithObjects:@"Nope, try again.",
                                                      @"Sorry, that's not it",
                                                      @"Not quite",
                                                      @"Give it another try",
                                                      @"Make another choice",
                                                      @"Wrong answer",
                                                      @"Not exactly, try again",
                                                      @"That's incorrect",
                                                      @"No, sorry",
                                                      @"Guess again",
                                                      @"Keep trying",
                                                      @"Incorrect",
                                                      @"Keep trying", nil];
        
        // Initialize the "right answer" array
        
        correctArray = [[NSArray alloc] initWithObjects:@"Correct, ",
                                                      @"Yes, ",
                                                      @"Exactly, ",
                                                      @"You got it, ",
                                                      @"Right answer, ",
                                                      @"Precisely, ",
                                                      @"Nice job, ",
                                                      @"You're right, ",
                                                      @"That's it, ",
                                                      @"Bingo, ",
                                                      @"Yep, ",
                                                      @"Great work, ", nil];

    }
    return self;
}


-(void) DumpFrame:(CGRect)theFrame
{
    NSLog(@"");
    NSLog(@"frame origin x = %f",theFrame.origin.x);
    NSLog(@"frame origin y = %f",theFrame.origin.x);
    NSLog(@"frame size width = %f",theFrame.size.width);
    NSLog(@"frame size height = %f",theFrame.size.height);
    NSLog(@"");
}

- (void)loadView
{
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor clearColor];
   //  contentView.alpha = .7f;

    int tag = 1000;
    
    // Set to display first set of question & answers
    
    QuizModel *tempQM = [[QuizModel alloc] init];
    
    if ( [quizData count] > 0 )
    {
        tempQM = [quizData objectAtIndex:0];
    } else {
        tempQM = Nil;
    }
     
    
    // Load the image backgrounds.
    
    UIImageView *backTopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,5,300,285)];
    backTopImageView.image = [UIImage imageNamed:@"quiz_back_top.png"];

    UIImageView *backBotImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,300,300,110)];
    backBotImageView.image = [UIImage imageNamed:@"quiz_back_bottom.png"];
    
    [contentView addSubview:backTopImageView];
    [contentView addSubview:backBotImageView];
        
    // Add Question Label
    
    questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 30.0)];
    questionLabel.textColor = [UIColor whiteColor];
    questionLabel.backgroundColor = [UIColor clearColor];
    questionLabel.textAlignment = UITextAlignmentCenter;
    questionLabel.text = tempQM.question;
    
    // size question label accordingly
    
    questionLabel.numberOfLines = 0;
    questionLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    CGRect questionFrame = [self GetLabelFrame:questionLabel];
    questionLabel.frame = questionFrame;

    [contentView addSubview:questionLabel];
    
    
    // set detail label information
    
    NSInteger detailLabelX = 15;
    NSInteger detailLabelY = 300;
    NSInteger detailLabelWidth = 290;
    NSInteger detailLabelHeight = 10;
    
    
    detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(detailLabelX, 
                                                            detailLabelY, 
                                                            detailLabelWidth, 
                                                            detailLabelHeight)];
    detailLabel.textColor = [UIColor whiteColor];
    detailLabel.backgroundColor = [UIColor clearColor];
    detailLabel.textAlignment = UITextAlignmentLeft;
    detailLabel.font=[UIFont systemFontOfSize:14.0];
    
    detailLabel.text = @"";
    
    [contentView addSubview:detailLabel];
    
    // button variables
    
    NSInteger buttonOffset = 50;
    NSInteger buttonWidth = 50;
    NSInteger buttonHeight = 50;
    NSInteger buttonDistance = 60;
    NSInteger textOffset = 65;
    NSInteger answerFontSize = 14;

    // give a button offset of 50 (to make room for the label)
    
    
    frame = CGRectMake(10, 10, buttonWidth, buttonHeight);
    frame.origin.y += buttonOffset;
    
    UIImage *answerButton = [UIImage imageNamed:@"answer_btn.png"];
    
    // First Button
    
    self.firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.firstBtn.tag = tag;
    [self.firstBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
    self.firstBtn.frame = frame;
    //[self.firstBtn setTitle:@"B1" forState:UIControlStateNormal];
    [contentView addSubview:self.firstBtn];
    frame.origin.y += buttonDistance;
    [buttons addObject:self.firstBtn];
    
    CGRect textFrame = CGRectMake(80, 10, 150, 30);
    textFrame.origin.y += textOffset;
    
    self.firstTxtBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.firstTxtBtn.tag = tag;
    [self.firstTxtBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstTxtBtn setTitle:[tempQM.answers objectAtIndex:0] forState:UIControlStateNormal];
    self.firstTxtBtn.frame = textFrame;
    self.firstTxtBtn.titleLabel.font=[UIFont systemFontOfSize:answerFontSize];
    self.firstTxtBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    textFrame.origin.y += buttonDistance;
    
    [contentView addSubview:self.firstTxtBtn];
    [textButtons addObject:self.firstTxtBtn];
    
    tag++;
    
    // Second Button
    
    self.secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.secondBtn.tag = tag;
    [self.secondBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
    self.secondBtn.frame = frame;
    //[self.secondBtn setTitle:@"B2" forState:UIControlStateNormal];
    [contentView addSubview:self.secondBtn];
    frame.origin.y += buttonDistance;
    [buttons addObject:self.secondBtn];
    
    self.secondTxtBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.secondTxtBtn.tag = tag;
    [self.secondTxtBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];   
    [self.secondTxtBtn setTitle:[tempQM.answers objectAtIndex:1] forState:UIControlStateNormal];
    self.secondTxtBtn.frame = textFrame;
    self.secondTxtBtn.titleLabel.font=[UIFont systemFontOfSize:answerFontSize];
    self.secondTxtBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    textFrame.origin.y += buttonDistance;

    [contentView addSubview:self.secondTxtBtn];
    [textButtons addObject:self.secondTxtBtn];
    
    tag++;
    
    // Third Button
        
    self.thirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.thirdBtn.tag = tag;
    [self.thirdBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
    self.thirdBtn.frame = frame;
    //[self.thirdBtn setTitle:@"B3" forState:UIControlStateNormal];
    [contentView addSubview:self.thirdBtn];
    frame.origin.y += buttonDistance;
    [buttons addObject:self.thirdBtn];
    
    self.thirdTxtBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.thirdTxtBtn.tag = tag;
    [self.thirdTxtBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdTxtBtn setTitle:[tempQM.answers objectAtIndex:2] forState:UIControlStateNormal];
    self.thirdTxtBtn.frame = textFrame;
    self.thirdTxtBtn.titleLabel.font=[UIFont systemFontOfSize:answerFontSize];
    self.thirdTxtBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    textFrame.origin.y += buttonDistance;

    [contentView addSubview:self.thirdTxtBtn];
    [textButtons addObject:self.thirdTxtBtn];
    
    tag++;
    
    // Fourth Button

    self.fourthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.fourthBtn.tag = tag;
    [self.fourthBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.fourthBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
    self.fourthBtn.frame = frame;
    [contentView addSubview:self.fourthBtn];
    [buttons addObject:self.fourthBtn];

    self.fourthTxtBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.fourthTxtBtn.tag = tag;
    [self.fourthTxtBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.fourthTxtBtn.frame = textFrame;
    [self.fourthTxtBtn setTitle:[tempQM.answers objectAtIndex:3] forState:UIControlStateNormal];
    self.fourthTxtBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.fourthTxtBtn.titleLabel.font=[UIFont systemFontOfSize:answerFontSize];

    [contentView addSubview:self.fourthTxtBtn];
    [textButtons addObject:self.fourthTxtBtn];

    // Generate PREV and NEXT buttons

    CGRect frame2 = CGRectMake(10, 410, buttonWidth, buttonHeight);
    UIImage *prevButton = [UIImage imageNamed:@"prevbtn_button.png"];
    UIImage *prevButtonHigh = [UIImage imageNamed:@"prevbtn_button_highlight.png"];
    
    self.prevBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.prevBtn addTarget:self action:@selector(prevTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.prevBtn setBackgroundImage:prevButton forState:UIControlStateNormal];
    [self.prevBtn setBackgroundImage:prevButtonHigh forState:UIControlStateHighlighted];
    self.prevBtn.frame = frame2;
    [self.prevBtn setTitle:@"prev" forState:UIControlStateNormal];
    self.prevBtn.hidden = YES;
    [contentView addSubview:self.prevBtn];
    
    frame2.origin.x += 250;
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn addTarget:self action:@selector(nextTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn setBackgroundImage:prevButton forState:UIControlStateNormal];
    [self.nextBtn setBackgroundImage:prevButtonHigh forState:UIControlStateHighlighted];
    self.nextBtn.frame = frame2;
    [self.nextBtn setTitle:@"next" forState:UIControlStateNormal];
    [contentView addSubview:self.nextBtn];
    
    
    // Generate tap view
    
    UIImage *blackBtnImg = [UIImage imageNamed:@"black_button.png"];
    self.tapView = [[UIImageView alloc] initWithImage:blackBtnImg ];
    self.tapView.frame = CGRectMake(210, 410, buttonWidth, buttonHeight);
    self.tapView.userInteractionEnabled = YES;
    //tapView.backgroundColor = [UIColor redColor];
    tapView.hidden = YES;
    
    [contentView addSubview:self.tapView];
    
    // generate dismiss button
    
    CGRect frame3 = CGRectMake(10, 410, buttonWidth+50, buttonHeight);
    UIImage *dismissButton = [UIImage imageNamed:@"dismissbtn_button.png"];
    UIImage *dismissButtonHigh = [UIImage imageNamed:@"dismissbtn_button_highlight.png"];
    
    self.dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.dismissBtn addTarget:self action:@selector(dismissTapped:) 
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.dismissBtn setBackgroundImage:dismissButton forState:UIControlStateNormal];
    [self.dismissBtn setBackgroundImage:dismissButtonHigh forState:UIControlStateHighlighted];
    
    self.dismissBtn.frame = frame3;
    [self.dismissBtn setTitle:@"back to main" forState:UIControlStateNormal];
    self.dismissBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    self.dismissBtn.center = CGPointMake(160, 435);
    [contentView addSubview:self.dismissBtn];
    
    loading = [[LoadingIndicator alloc] initWithFrame:contentView.frame];
    [contentView addSubview:loading];
    [loading show];

    self.view = contentView;
}

- (void)btnTapped:(UIButton *)btn
{
    QuizModel *currentQuestion;

    // get the current questions data
    
    currentQuestion = [[QuizModel alloc] init];
    
    NSInteger tempIndex;
    tempIndex = [[quizIndex objectAtIndex:currentDisplayed] intValue];
    currentQuestion = [quizData objectAtIndex:tempIndex];
    
    // currentQuestion = [quizData objectAtIndex:currentDisplayed];
    
    NSInteger correctAnswerInt = [currentQuestion.correct intValue];
    
    // set button image information
    
    UIImage *answerButton = [UIImage imageNamed:@"answer_btn.png"];
    UIImage *answerButtonHigh = [UIImage imageNamed:@"answer_btn_high.png"];
    
    
    for (int i=0; i<[buttons count]; i++) {
        
        UIButton *button = [buttons objectAtIndex:i];
        
        if (button){

            // if the we're at the button we've pressed.
            
            if (btn.tag==button.tag){
                
                // set the button highlight for the selected button
                
                [button setBackgroundImage:answerButtonHigh forState:UIControlStateNormal];
                
                // sizing variables for detail label
                
                CGRect detailLabelFrame; 
                
                // If we've selected the correct answer
                
                if ( btn.tag == (correctAnswerInt + 1000) )
                {
                    // present correct answer
                    
                    NSInteger maxCount = [correctArray count];
                    NSInteger correctIndex = ((currentDisplayed * arc4random()) + arc4random()) % maxCount;
                    NSString *correctAnswer = [correctArray objectAtIndex:correctIndex];
                    
                    // create answer from answer array and correct answer from xml file.
                    
                    correctAnswer = [correctAnswer stringByAppendingString:currentQuestion.detail];
                   
                    // ensure detailLabel is properly formatted
                
                    detailLabel.text = correctAnswer;
                   
                    // if numberOfLines is set to 0, then it is unlimited
                    
                    detailLabelFrame = [self GetLabelFrame:detailLabel];                    
                    
                }
                else {
                    
                    NSInteger maxCount = [wrongArray count];
                    NSInteger wrongIndex = ((currentDisplayed * arc4random()) + arc4random()) % maxCount;
                    
                    //detailLabel.text = @"Nope sorry, try again";
                    
                    detailLabel.text = [wrongArray objectAtIndex:wrongIndex];
                    
                    // if numberOfLines is set to 0, then it is unlimited
                    
                    detailLabelFrame = [self GetLabelFrame:detailLabel];
                                        
                }
                
                // set detail label frame
                
                detailLabel.frame = detailLabelFrame;

            }
            else{
                // NSString *title = [NSString stringWithFormat:@"B%d", (i+1)];
                
                [button setBackgroundImage:answerButton forState:UIControlStateNormal];
            }
        }
        
        
    }
}

- (void)prevTapped:(id)sender
{

    if ( currentDisplayed > 0)
    {
        currentDisplayed--;
        
        if ( currentDisplayed == 0 )
        {
            self.prevBtn.hidden = YES;
            self.tapView.hidden = YES;
        } else {
            self.prevBtn.hidden = NO;
            self.nextBtn.hidden = NO;
            self.tapView.hidden = YES;
        }
        
        // Update the question view based on the new question
        
        NSInteger tempIndex;
        tempIndex = [[quizIndex objectAtIndex:currentDisplayed] intValue];
        QuizModel *tempQM = [quizData objectAtIndex:tempIndex];

        // QuizModel *tempQM = [quizData objectAtIndex:currentDisplayed];
        
        // update question label
        
        self.questionLabel.text = tempQM.question;
        
        // resize question label if necessary
                
        CGRect questionFrame = [self GetLabelFrame:questionLabel];
        
        questionLabel.frame = questionFrame;
        
        // reset radio buttons
        
        UIImage *answerButton = [UIImage imageNamed:@"answer_btn.png"];

        [self.firstBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
        [self.secondBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
        [self.thirdBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
        [self.fourthBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
        
        // present new text information

        CGRect textButtonFrame;
        
        for (int i=0; i<[textButtons count]; i++) {
            
            UIButton *button = [textButtons objectAtIndex:i];
            
            [button setTitle:[tempQM.answers objectAtIndex:i] forState:UIControlStateNormal];
            
            textButtonFrame = [self GetLabelFrame:button.titleLabel];
            
            button.titleLabel.frame = textButtonFrame;
            
        }
        
        // clear detail label
        
        self.detailLabel.text = @"";

    }

}

- (void)nextTapped:(id)sender
{
    NSInteger maxQuestions = [quizData count];

    if ( currentDisplayed < (maxQuestions-1) )
    {
        currentDisplayed++;
        
        if (currentDisplayed == (maxQuestions-1))
        {
            self.nextBtn.hidden = YES;
            self.tapView.hidden = NO;
        } else {
            self.nextBtn.hidden = NO;
            self.prevBtn.hidden = NO;
            self.tapView.hidden = YES;
        }
        
        // Update the question view based on the new question
        
        NSInteger tempIndex;
        tempIndex = [[quizIndex objectAtIndex:currentDisplayed] intValue];

        QuizModel *tempQM = [quizData objectAtIndex:tempIndex];

        //QuizModel *tempQM = [quizData objectAtIndex:currentDisplayed];
        
        // update question label
        
        self.questionLabel.text = tempQM.question;
        
        // resize question label if necessary
        
        CGSize available;
        CGSize sizeToFit;
        
        CGRect questionFrame = questionLabel.frame;
        
        available = CGSizeMake(questionFrame.size.width, INFINITY);
        sizeToFit = [questionLabel sizeThatFits:available];
        
        questionFrame.size.height = sizeToFit.height;    
        questionLabel.frame = questionFrame;
        
        // reset radio buttons
        
        UIImage *answerButton = [UIImage imageNamed:@"answer_btn.png"];

        [self.firstBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
        [self.secondBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
        [self.thirdBtn setBackgroundImage:answerButton forState:UIControlStateNormal];
        [self.fourthBtn setBackgroundImage:answerButton forState:UIControlStateNormal];

        // present new text information
        
        CGRect textButtonFrame;
        
        for (int i=0; i<[textButtons count]; i++) {
            
            UIButton *button = [textButtons objectAtIndex:i];
            
            [button setTitle:[tempQM.answers objectAtIndex:i] forState:UIControlStateNormal];
            
            textButtonFrame = [self GetLabelFrame:button.titleLabel];
            
            button.titleLabel.frame = textButtonFrame;            
            
        }

        // clear detail label
        
        self.detailLabel.text = @"";
    }

}

-(CGRect) GetLabelFrame:(UILabel *)label
{
    CGSize available;
    CGSize sizeToFit;
    
    CGRect tempFrame = label.frame;
    
    if ( label.text == Nil )
    {
        NSLog(@"No text information provided in the label");
    }
        
    label.numberOfLines = 0;
    label.lineBreakMode = UILineBreakModeWordWrap;
    
    available = CGSizeMake(tempFrame.size.width, INFINITY);
    sizeToFit = [label sizeThatFits:available];
    
    // function returns minimum height to accomodate label.
    
    tempFrame.size.height = sizeToFit.height;

    return tempFrame;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (IBAction) dismissTapped:(id)sender
{
        
    [self dismissModalViewControllerAnimated:YES];
    
}

#pragma mark RSS Parsing functions
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
	
    [loading hide];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	NSLog(@"found the xml file");	
}


-(void) parseTheURL:(NSString *)URL;
{
   	
    // convert path to URL
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // alloc the NSXML Parser 
    
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
    
    [rssParser parse];

}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
	NSString * errorString = [NSString stringWithFormat:@"No internet connection"];

	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
    
    // hide the loading spinner
    
    [loading hide];
    
    // dismiss the view controller
    
    //[self dismissModalViewControllerAnimated:YES];
    
    
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    // store the current element for the foundCharacters
    // function.
    
	currentElement = [elementName copy];
    
    // get the first character, to see if its an answer element
    
    NSString *firstChar = [currentElement substringWithRange:NSMakeRange(0, 1)];
	
    if ([elementName isEqualToString:@"question"]) {
        
        if ( currentEntry != Nil )
        {
            currentEntry = Nil;
        }
        
        currentEntry = [[QuizModel alloc] init];

	}
    
    if ([firstChar isEqualToString:@"a"]) {
        
        if ( currentAnswer != Nil )
        {
            currentAnswer = Nil;
        }

        currentAnswer = [[NSMutableString alloc] init];

	}
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
                                      namespaceURI:(NSString *)namespaceURI 
                                     qualifiedName:(NSString *)qName{
    
    NSString *firstChar = [currentElement substringWithRange:NSMakeRange(0, 1)];
    
	
	if ([elementName isEqualToString:@"question"]) {
        

		// add one quiz model entry into larger array
		
        if ( currentEntry != Nil )
        {
            [quizData addObject:currentEntry];
        }
        
    }
    
    if ( [firstChar isEqualToString:@"a"] ) {
    
        NSString *secondChar = [currentElement substringWithRange:NSMakeRange(1, 1)];
        NSInteger answerIndex = [secondChar intValue];
        
        [currentEntry.answers insertObject:currentAnswer atIndex:answerIndex];
    }
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	// save the characters for the current item...
	
    if ([currentElement isEqualToString:@"q"]) {
        
		[currentEntry.question appendString:string];
        
	} else if ( [currentElement isEqualToString:@"a0"] ||
                [currentElement isEqualToString:@"a1"] ||
                [currentElement isEqualToString:@"a2"] ||
                [currentElement isEqualToString:@"a3"] ) {
        
            [currentAnswer appendString:string];
        
	} else if ([currentElement isEqualToString:@"correct"]) {
        
		[currentEntry.correct appendString:string];
        
	} else if ([currentElement isEqualToString:@"detail"]) {

		[currentEntry.detail appendString:string];
        
	}

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Initialize to first quiz question
    
    // Initializing with URL Request
    
    NSString *path = @"http://www.notafeather.info/appvideo/naf_quiz.xml";
    [self parseTheURL:path];
    
    // if it's parsed ok - load with first question information:
    
    QuizModel *tempQM;
    
    // Call function to create random order array
    
    NSInteger numQuestions;
    numQuestions = [quizData count];
    quizIndex = [[NSMutableArray alloc] init];
    quizIndex = [self getRandomInts:numQuestions];
    
    // if parsed ok then quizData will have more than 1 entry
    if ( [quizData count] > 0 )
    {
        // tempQM = [quizData objectAtIndex:0];
        
        NSInteger tempIndex = [[quizIndex objectAtIndex:0] intValue];
        tempQM = [quizData objectAtIndex:tempIndex];
        
        [self.firstTxtBtn setTitle:[tempQM.answers objectAtIndex:0] forState:UIControlStateNormal];
        [self.secondTxtBtn setTitle:[tempQM.answers objectAtIndex:1] forState:UIControlStateNormal];
        [self.thirdTxtBtn setTitle:[tempQM.answers objectAtIndex:2] forState:UIControlStateNormal];
        [self.fourthTxtBtn setTitle:[tempQM.answers objectAtIndex:3] forState:UIControlStateNormal];
        
        // set the text label alignment
        
        self.secondTxtBtn.titleLabel.textAlignment = UITextAlignmentLeft;
        
        self.questionLabel.text = tempQM.question;
        
        // size question label accordingly
        
        CGSize available;
        CGSize sizeToFit;
        
        CGRect questionFrame = questionLabel.frame;
        available = CGSizeMake(questionFrame.size.width, INFINITY);
        sizeToFit = [questionLabel sizeThatFits:available];
        
        questionFrame.size.height = sizeToFit.height;    
        questionLabel.frame = questionFrame;
        
    } else {
                
        [self dismissModalViewControllerAnimated:YES];
    }
    
    [self becomeFirstResponder];
    [self createTripleTapRecognizer];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
            interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

// Generate random unique random integers

-(NSMutableArray *)getRandomInts:(int)amount {
    
    NSMutableArray *startingSet = [[NSMutableArray alloc] initWithCapacity:amount];
    NSMutableArray *endingSet = [[NSMutableArray alloc] init];
    
    for(int i = 0; i <= amount; i++)
    {
		[startingSet insertObject:[NSNumber numberWithInt:i]  atIndex:i];
    }
    
    int r;
    int modSize = amount;
    int j = 0;
    
    while (j < amount) {
        
        r = (arc4random() % modSize);
        
        [endingSet insertObject:[startingSet objectAtIndex:r] atIndex:j];
        [startingSet removeObjectAtIndex:r];
        
        // increment the index, decrement the max size
        
        j++;
        modSize--;

    }
    return endingSet;
}


# pragma mark Alert View Delegate Callback

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self dismissModalViewControllerAnimated:YES];
}

# pragma mark - Create Gesture Recognizers

- (void) createTripleTapRecognizer
{
       
    UITapGestureRecognizer *recognizer = 
    [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(handleTripleTapEvent:)];
    
    [tapView addGestureRecognizer:recognizer];
    [recognizer setDelegate:self];
    [recognizer setNumberOfTapsRequired:3];
    
}


# pragma mark - Event Handlers

- (void) handleTripleTapEvent:(UITapGestureRecognizer *) recognizer
{
    
        
    // Present the text field view controller
    EasterEggViewController *eeVC = [[EasterEggViewController alloc] init];
    
    [self presentModalViewController:eeVC animated:YES];
}



@end
