//
//  JSONParser.h
//  QuizGame
//
//  Created by User on 05.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
#import "Question.h"

@interface JSONParser : NSObject

+ (Test*)parse:(NSData *)JSONObject;

@end
