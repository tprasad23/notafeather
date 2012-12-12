//
//  QuizModel.m
//  NotAFeather
//
//  Created by Teju Prasad on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuizModel.h"

@implementation QuizModel

@synthesize question;
@synthesize answers;
@synthesize correct;
@synthesize detail;


- (id)init {
    self = [super init];
    if (self) {

        // Custom initialization.
        
        question = [[NSMutableString alloc] init];
        answers = [[NSMutableArray alloc] init];
        detail = [[NSMutableString alloc] init];
        correct = [[NSMutableString alloc] init];
        
    }
    return self;
}


@end
