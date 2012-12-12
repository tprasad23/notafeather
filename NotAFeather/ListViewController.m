//
//  ListViewController.m
//  NotAFeather
//
//  Created by Denny Kwon on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController
@synthesize immigrantArray;

- (id)init
{
    self = [super init];
    if (self) {
        
        // load immigrant top list
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"immigrant_events" ofType:@"txt"];
        NSError *error = nil;
        
        // reads the actual file.
        
        NSString *contents = [[NSString alloc] initWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
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
        
        
        NSMutableArray *immArray = [NSMutableArray array];
        NSMutableString *fileName = [NSMutableString string];
        NSMutableString *descContents = [NSMutableString string];
                
        for (int i=0; i < [titleArray count]; i++) {
            
            Event *event = [[Event alloc] init];
            event.title = [titleArray objectAtIndex:i];
            
            // Load data file corresponding to event
            
            fileName = [NSString stringWithFormat:@"immi_event_%d", i];
            path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
            descContents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
            
            if (error) {
                NSLog(@"Error loading file");
            }
            
            event.description = descContents;
            
            // Add Image, Audio and Video URLS
            
            if ( [event.title isEqualToString:@"Dalip Singh Saund, 1955"] )
            {
                event.mode = EventModeImage;
                event.dataURL = @"dalip";
            } else if ( [event.title isEqualToString:@"Luce Celler Act, 1946"] )
            {
                event.mode = EventModeImage;
                event.dataURL = @"luce";
            } else if ( [event.title isEqualToString:@"Bhagat Singh Thind v US, 1923"] )
            {
                event.mode = EventModeImage;
                event.dataURL = @"thind";
            } else if ( [event.title isEqualToString:@"Alien Land Act, 1913"] )
            {
                event.mode  = EventModeVideo;
                event.dataURL = @"http://www.notafeather.info/appvideo/alienland.m4v";
            } else if ( [event.title isEqualToString:@"Immigration Act, 1965"] )
            {
                event.mode = EventModeVideo;
                event.dataURL = @"http://www.notafeather.info/appvideo/1965.m4v";
            }
            
            
            [immArray addObject:event];
            
        }
        self.immigrantArray = immArray;
    }
    return self;
}

- (void)loadView
{
    
    // constructing the view (as you would in a storyboard)
    
    // constructing the background 
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor redColor];
    
    // construct a bar button item to move backwards.
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(backButton:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    // set the frame height 60 points less.
    
//  frame.origin.y = 60.0f;
    frame.origin.y = 0.0f;
    // frame.size.height -= frame.origin.y;
    
    // set the table view.
    
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
    self.title = @"Indian Immigrant Timeline";
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.title = @"Back";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Indian Immigrant Timeline";
}

- (IBAction) backButton:(id)sender
{
    NSLog(@"Back Button clicked");
    
    [self dismissModalViewControllerAnimated:YES];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [immigrantArray count];
//    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ID";
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    Event *event = (Event *)[self.immigrantArray objectAtIndex:indexPath.row];

    cell.textLabel.text = event.title;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Event *event = (Event *)[self.immigrantArray objectAtIndex:indexPath.row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    EventViewController *immigrantTextViewController = [[EventViewController alloc] init];
    immigrantTextViewController.event = event;

    //  Call the appropriate view Controller
    
    [self.navigationController pushViewController:immigrantTextViewController animated:YES];
           
    
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

@end
