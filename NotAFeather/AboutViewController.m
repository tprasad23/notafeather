//
//  AboutViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"
#import "EventViewController.h"
#import "Event.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize aboutArray;

- (id)init
{
    self = [super init];
    if (self) {
        
        // - load about top list -
        // break each line into a different element in the array
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"about_events" ofType:@"txt"];
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
        
        NSMutableArray *abtArray = [NSMutableArray array];
        NSMutableString *fileName = [NSMutableString string];
        NSMutableString *descContents = [NSMutableString string];
        
        for (int i=0; i < [titleArray count]; i++) {
            
            Event *event = [[Event alloc] init];
            event.title = [titleArray objectAtIndex:i];
            
            // Load data file corresponding to event
            
            fileName = [NSString stringWithFormat:@"about_event_%d", i];
            path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
            descContents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
            
            if (error) {
                NSLog(@"Error loading file");
            }
            
            event.description = descContents;
            
            // add video & image URLS
            
            if ( [event.title isEqualToString:@"Director's Statement"] )
            {
                event.mode = EventModeVideo;
                event.dataURL = @"http://www.notafeather.info/appvideo/statement2.m4v";
            }
            
            [abtArray addObject:event];
            
        }
        self.aboutArray = abtArray;
    }
    return self;
}


- (void)loadView
{
    
    // constructing the view (as you would in a storyboard)
    
    // constructing the background 
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor yellowColor];
    contentView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    // construct a bar button item to move backwards.
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(backButton:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    // set frame size and origin
    
    frame.origin.y = 0.0f;
    
    // set the table view here.
    
    theTableView = [[UITableView alloc] initWithFrame:frame];
    theTableView.delegate = self;
    theTableView.dataSource = self;
    theTableView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    [contentView addSubview:theTableView];
    
    // setting the view of the view controller to the constructed 'view'
    
    self.view = contentView;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"About the Film";
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.title = @"Back";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"About the Film";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
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
    return [aboutArray count];
    //return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ID";
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    Event *event = (Event*) [self.aboutArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = event.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // create local "event" placeholder to set to the current cell selected
    
    Event *event = (Event *)[self.aboutArray objectAtIndex:indexPath.row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    EventViewController *aboutTextViewController = [[EventViewController alloc] init];
    
    // send data through "push" command to the next view-controller.
    
    aboutTextViewController.event = event;
    
    [self.navigationController pushViewController:aboutTextViewController animated:YES];
    //    [self presentModalViewController:immigrantTextViewController animated:YES];
    
}


@end
