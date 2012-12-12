//
//  Tweet.m
//  NotAFeather
//
//  Created by Denny Kwon on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

@synthesize text;
@synthesize user;
@synthesize date;
@synthesize linkURL;

- (void)populate:(NSDictionary *)info
{
    
    // here we get pick off from the tweet dictionary item, the 
    // info we need
    
    if ([info objectForKey:@"text"]){
        self.text = [info objectForKey:@"text"];
    }
    NSDictionary *userInfo = [info objectForKey:@"user"];
    if (userInfo){
        self.user = [userInfo objectForKey:@"name"];
    }
    
    if ([info objectForKey:@"created_at"]){
        self.date = [info objectForKey:@"created_at"];
    }
}


@end
