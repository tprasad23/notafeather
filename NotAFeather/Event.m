//
//  Event.m
//  NotAFeather
//
//  Created by Denny Kwon on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Event.h"

@implementation Event
@synthesize mode;
@synthesize title;
@synthesize description;
@synthesize imageURL;
@synthesize audioURL;
@synthesize videoURL;
@synthesize dataURL;



- (NSString *)createFilePath:(NSString *)fileName
{
	fileName = [fileName stringByReplacingOccurrencesOfString:@"/" withString:@"+"];
    
    //	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
	NSLog(@"EVENT - createFilePath: filepath = %@", filePath);
	return filePath;
}

- (void)save:(NSData *)file name:(NSString *)fName
{
    NSString *path = [self createFilePath:fName];
    [file writeToFile:path atomically:YES];
    
//    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//    if (data==nil){
//        //cant find!
//    }
//    else {
//        // do what you want!
//    }
}



/*
- (void)dealloc
{
    [title release];
    [description release];
    [super dealloc];
} */

@end
