//
//  HinduViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HinduViewController.h"
#import "EventViewController.h"
#import "EventViewController_land.h"
#import "Event.h"

@interface HinduViewController ()

@end

@implementation HinduViewController

@synthesize hinduArray;

- (id)init
{
    self = [super init];
    if (self) {
        
        // - load hindu top level list -
        // break each line into a different element in the array
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hindu_events" ofType:@"txt"];
        NSError *error = nil;
                       
        NSString *contents = [[NSString alloc] initWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
        NSArray *titleArray = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\r\n"]];
        
        // load title files
        
        // NSError *error = nil;
        // NSString *desc = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        if (error){
            NSLog(@"Error loadingtitle file!");
        }
        else {
            NSLog(@"Title file loaded");
        }
      
        // load individual files
        
        NSMutableArray *hinArray = [NSMutableArray array];
        NSMutableString *fileName = [NSMutableString string];
        NSMutableString *descContents = [NSMutableString string];
        
        for (int i=0; i < [titleArray count]; i++) {
            
            Event *event = [[Event alloc] init];
            event.title = [titleArray objectAtIndex:i];
            
            // Load data file corresponding to event
            
            fileName = [NSString stringWithFormat:@"hindu_event_%d", i];
            path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
            descContents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
            
            if (error) {
                NSLog(@"Error loading file");
            }
            
            event.description = descContents;
            
            // Add video/audio/image URLS
            
            if ( [event.title isEqualToString:@"Yoga"] )
            {
                event.mode = EventModeVideo;
                event.dataURL = @"http://www.notafeather.info/appvideo/yoga.m4v";
            } 
            else if ( [event.title isEqualToString:@"The word Hindu"] )
            {
                event.mode = EventModeVideo;
                event.dataURL = @"http://www.notafeather.info/appvideo/wordhindu.m4v";
            }
            else if ( [event.title isEqualToString:@"Swastika"] )
            {
                event.mode = EventModeImage;
                event.dataURL = @"hindu-swastika";
            }
            else if ( [event.title isEqualToString:@"Many Gods"] )
            {
                event.mode = EventModeImage;
                event.dataURL = @"manygods";
            }
            else if ( [event.title isEqualToString:@"Dharmic faiths"] )
            {
                event.mode = EventModeImage;
                event.dataURL = @"dharmic_faiths";
            }
            else if ( [event.title isEqualToString:@"Vedas"] )
            {
                event.mode = EventModeAudio;
                event.dataURL = @"chanting_sample";
            }
            else if ( [event.title isEqualToString:@"Bhagavad Gita"] )
            {
                event.mode = EventModeAudio;
                event.dataURL = @"gita";
            }
            
            [hinArray addObject:event];
            
        }
        self.hinduArray = hinArray;
    }
    return self;
}

- (NSString *)getStringFromDefaults:(NSString *)key
{
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    NSString *string = [defautls objectForKey:key];
    
    if (string==nil){
        string = @"NOT FOUND";
    }
    return string;
}


- (void)saveStringToDefaults:(NSString *)string key:(NSString *)k
{
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    [defautls setObject:string forKey:k];
    [defautls synchronize];
}


- (void)loadView
{
    
    // constructing the view (as you would in a storyboard)
    
    // constructing the background 
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor greenColor];
    contentView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    // construct a bar button item to move backwards.
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(backButton:)];

    self.navigationItem.leftBarButtonItem = backButton;
//    self.navigationItem.rightBarButtonItem = backButton;
    
    // set frame size and origin
    
    frame.origin.y = 0.0f;
    
    // set the table view here.
    
    theTableView = [[UITableView alloc] initWithFrame:frame];
    theTableView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    theTableView.delegate = self;
    theTableView.dataSource = self;
    [contentView addSubview:theTableView];
    
    // setting the view of the view controller to the constructed 'view'
    
    self.view = contentView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"Hinduism 101";
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.title = @"Back";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Hinduism 101";
    [theTableView deselectRowAtIndexPath:[theTableView indexPathForSelectedRow] animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
    return YES;
}

- (IBAction) backButton:(id)sender
{
    NSLog(@"Back Button clicked");
    
    [self dismissModalViewControllerAnimated:YES];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [hinduArray count];
    //return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ID";
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
        
    Event *event = (Event*) [self.hinduArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = event.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // grab the event element corresponding to the cell selected.
    Event *event = (Event *)[self.hinduArray objectAtIndex:indexPath.row];

    EventViewController *hinduTextViewController = [[EventViewController alloc] init];
    hinduTextViewController.event = event;
    [self.navigationController pushViewController:hinduTextViewController animated:YES];

}

@end
