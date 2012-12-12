//
//  Tweet.h
//  NotAFeather
//
//  Created by Denny Kwon on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSURL    *linkURL;
- (void)populate:(NSDictionary *)info;

@end
