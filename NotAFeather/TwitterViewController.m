//
//  TwitterViewController.m
//  NotAFeather
//
//  Created by Teju Prasad on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterViewController.h"

@interface TwitterViewController ()

@end

@implementation TwitterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        tweets = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = [UIColor redColor];
    
    // set resizing mask to stretch to fit new orientation
    
    contentView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    frame.origin.x = 0.0f;
    frame.origin.y = 0.0f;
    theTableview = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    // set resizing mask to stretch to fit new orientation
    
    theTableview.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    theTableview.dataSource = self;
    theTableview.delegate = self;
    [contentView addSubview:theTableview];
    
    // construct a bar button item to move backwards.
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(backButton:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    // set view
    
    self.view = contentView;
    
}

- (void)viewDidLoad
{
    self.title = @"Loading...";
    
    
    [super viewDidLoad];
    
    loading = [[LoadingIndicator alloc] initWithFrame:self.view.frame];
    [self.view addSubview:loading];
    [loading show];
    
    
    req = [[URLRequest alloc] initWithAddress:@"http://api.twitter.com/1/statuses/user_timeline.json?screen_name=notafeather&count=100" parameters:nil];
    [req setHttpMethod:@"GET"];
    req.delegate = self;
    [req sendRequest]; //this makes the actual request
    
}

- (void)viewWillAppear:(BOOL)animated
{
    // Unselect the selected row if any
	NSIndexPath*	selection = [theTableview indexPathForSelectedRow];
	if (selection) {
        [theTableview deselectRowAtIndexPath:selection animated:YES];
    }
    
	[theTableview reloadData];
    
}

- (IBAction) backButton:(id)sender
{
    NSLog(@"Back Button clicked");
    
    [self dismissModalViewControllerAnimated:YES];
    
}

// must implement this requestData method when using the URLRequest

- (void)requestData:(NSArray *)pkg //returns [address, data]
{
    if (pkg!=nil){
        
        // the 'pkg' is an array of address and data - with 2nd element, aka "data" being the URL
        
        NSString *json = [[NSString alloc] initWithData:[pkg objectAtIndex:1] encoding:NSUTF8StringEncoding];
        
        NSArray *t = [json JSONValue];
       
        // NSLog(@"TWEETS = %@", [t description]);
        
        for (NSDictionary *tweet in t) {
            Tweet *tt = [[Tweet alloc] init];
            [tt populate:tweet];
            
            // add individual tweet model object to 
            // mutable array member variable 'tweets'
            
            [tweets addObject:tt];
            
        }
        
        // Must reload table after tweets are loaded
        
        [theTableview reloadData];
        
        self.title = @"Twitter Feed";
        [loading hide];
        
        NSLog(@"%d TWEETS", [tweets count]);
    } else {
        
        [loading hide];
        
        // present UIAlert
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:@"No internet connection"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
        // dismiss the view controller
        
        [self dismissModalViewControllerAnimated:YES];
        
    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ID";
    UITableViewCell *cell = [theTableview dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    Tweet *tweet = [tweets objectAtIndex:indexPath.row];
    
    // set cell arrow
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // set the cell text & detail text
    
    NSRange range = NSMakeRange(0, 16);
    NSString *truncDate = [tweet.date substringWithRange:range];
    
    cell.textLabel.text = tweet.text;
    cell.detailTextLabel.text = truncDate;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Tweet *tweet = [tweets objectAtIndex:indexPath.row];
    NSLog(@"%@", tweet.text);
    
    /* TweetViewControllerViewController *tweetView = [[TweetViewControllerViewController alloc] initWithNibName:@"TweetViewControllerViewController" bundle:nil]; */
    
    TweetViewControllerViewController *tweetView = [[TweetViewControllerViewController alloc] init];
    tweetView.tweet = tweet;
    
    [self.navigationController pushViewController:tweetView animated:YES];

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

@end
