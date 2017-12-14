//
//  TestViewController.h
//  QuizGame
//
//  Created by User on 02.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Test.h"

@interface TestViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerButton1;
@property (weak, nonatomic) IBOutlet UIButton *answerButton2;
@property (weak, nonatomic) IBOutlet UIButton *answerButton3;
@property (weak, nonatomic) IBOutlet UIButton *answerButton4;
@property (weak, nonatomic) IBOutlet UIImageView *answerImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *answerImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *answerImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *answerImageView4;
@property (weak, nonatomic) IBOutlet UITextView *correctAnswersTextView;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionButton;

@property (assign, nonatomic) NSInteger correctAnswersCount;
@property (assign, nonatomic) NSInteger questionsCount;
@property (strong, nonatomic) Test *test;

@end
