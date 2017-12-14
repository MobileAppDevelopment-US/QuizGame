//
//  Question.h
//  QuizGame
//
//  Created by User on 06.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, QuestionType) {
    SimpleQuestion = 1,
    ChooseQuestion,
    WriteQuestion
};

@interface Question : NSObject

@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSArray *correctAnswers;
@property (strong, nonatomic) NSArray *availableAnswers;
@property (assign, nonatomic) QuestionType type;


@end

