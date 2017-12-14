//
//  JSONParser.m
//  QuizGame
//
//  Created by User on 05.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

NSString *testNameKey = @"name";
NSString *testDescriptionKey = @"description";
NSString *testPassingScore = @"passing_score";
NSString *testQuestions = @"questions";

NSString *questionKey = @"question";
NSString *questionTypeKey = @"type";
NSString *questionCorrectAnswersKey = @"correct_answers";
NSString *questionAnswersKey = @"answers";

+ (Test*)parse:(NSData *)JSONObject {

    NSError *localError = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:JSONObject options:0 error:&localError];
    
    if (localError != nil) {
        return nil;
    }
    
    Test *test = [[Test alloc] init];
    
    test.name = dictionary[testNameKey];
    test.testDescription = dictionary[testDescriptionKey];
    test.passingScore = [dictionary[testPassingScore] intValue];
    NSLog(@">>>%@", test.name);
    NSLog(@">>>%@", test.testDescription);
    NSLog(@">>>%d", test.passingScore);

    NSArray *questionsDict = dictionary[testQuestions];
    NSMutableArray *questions = [[NSMutableArray alloc] init];

    for (NSDictionary* dict in questionsDict) {
        Question *question = [JSONParser parseQuestionFor:dict];
        if (question != nil) {
            [questions addObject:question];
        }
    }
    test.questions = questions;
    
    return test;
}

+ (Question*)parseQuestionFor:(NSDictionary*)dictionary {
    
    Question *question = [[Question alloc] init];
    
    question.question = dictionary[questionKey];
    NSInteger type = [dictionary[questionTypeKey] integerValue];
    question.type = type;
 
    switch (question.type) {
        case SimpleQuestion: {
            NSString *correctAnswer = dictionary[questionCorrectAnswersKey] ;
            NSMutableArray *correctAnswers = [[NSMutableArray alloc] init];
            [correctAnswers addObject:correctAnswer];
            question.correctAnswers = correctAnswers;
            question.availableAnswers = (NSArray*)dictionary[questionAnswersKey];
        }
            break;
            
        case ChooseQuestion:{
            question.correctAnswers = (NSArray*)dictionary[questionCorrectAnswersKey];
            question.availableAnswers = (NSArray*)dictionary[questionAnswersKey];
        }
            break;
            
        case WriteQuestion: {
            NSString *correctAnswer = dictionary[questionCorrectAnswersKey] ;
            NSMutableArray *correctAnswers = [[NSMutableArray alloc] init];
            [correctAnswers addObject:correctAnswer];
            question.correctAnswers = correctAnswers;
            question.availableAnswers = nil;
        }
            break;

        default:
            return nil;
    }
    return question;
}

@end
