//
//  Test.h
//  QuizGame
//
//  Created by User on 05.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *testDescription;
@property (assign, nonatomic) int passingScore;
@property (strong, nonatomic) NSArray *questions;

@end
