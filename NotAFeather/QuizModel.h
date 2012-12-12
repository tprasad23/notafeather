//
//  QuizModel.h
//  NotAFeather
//
//  Created by Teju Prasad on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizModel : NSObject {
    
    NSMutableString *question;
    NSMutableArray *answers;
    NSMutableString *correct;
    NSMutableString *detail;
}

@property (nonatomic, strong) NSMutableString *question;
@property (nonatomic, strong) NSMutableArray *answers;
@property (nonatomic, strong) NSMutableString *correct;
@property (nonatomic, strong) NSMutableString *detail; 

@end
