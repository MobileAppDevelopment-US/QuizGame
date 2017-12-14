//
//  TestViewController.m
//  QuizGame
//
//  Created by User on 02.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import "TestViewController.h"
#import "Test.h"
#import "JSONParser.h"
#import "ResultViewController.h"

@interface TestViewController ()

@property (assign, nonatomic) BOOL *isEnabled;
@property (assign, nonatomic) NSInteger currentQuestionIndex;
@property (strong, nonatomic) Question *selectedQuestion;

@end

@implementation TestViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Question *question = self.test.questions[self.currentQuestionIndex];
    NSLog(@">>>>>%@", question.correctAnswers[0]);

    self.questionsCount = self.test.questions.count;
    self.currentQuestionIndex = 0;
    self.correctAnswersCount = 0;
    
    [self hidenElements];
    [self colorAnswerButtons];
    [self configure];
    [self.navigationController setNavigationBarHidden:false];
    
    [self.correctAnswersTextView setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textViewTapped)];
    [gestureRecognizer setNumberOfTapsRequired:1];
    [self.correctAnswersTextView addGestureRecognizer:gestureRecognizer];

}

#pragma mark - Actions

- (IBAction)actionAnswerButton:(id)sender {
    
    UIButton *pressedButton = (UIButton *)sender;
    self.nextQuestionButton.hidden = false;
    UIColor *greenColor = [UIColor colorWithRed:45.0/255 green:175.0/255 blue:58.0/255 alpha:0.6];
    UIColor *redColor = [UIColor colorWithRed:221.0/255 green:36.0/255 blue:32.0/255 alpha:0.6];
    
    Question *question = self.test.questions[self.currentQuestionIndex - 1];
    NSString *buttonName = [sender titleForState:UIControlStateNormal];
    NSLog(@">>>>> title - %@", buttonName);
    
    if (!self.isEnabled) {
        for (NSString *string in question.correctAnswers) {
            if ([buttonName isEqualToString:string]) {
                if (pressedButton.tag == 1) {
                    self.answerImageView1.hidden = false;
                    self.answerImageView1.image = [UIImage imageNamed:@"checkmark"];
                    self.answerButton1.backgroundColor = greenColor;
                } else if (pressedButton.tag == 2) {
                    self.answerImageView2.hidden = false;
                    self.answerImageView2.image = [UIImage imageNamed:@"checkmark"];
                    self.answerButton2.backgroundColor = greenColor;
                } else if (pressedButton.tag == 3) {
                    self.answerImageView3.hidden = false;
                    self.answerImageView3.image = [UIImage imageNamed:@"checkmark"];
                    self.answerButton3.backgroundColor = greenColor;
                } else if (pressedButton.tag == 4) {
                    self.answerImageView4.hidden = false;
                    self.answerImageView4.image = [UIImage imageNamed:@"checkmark"];
                    self.answerButton4.backgroundColor = greenColor;
                }
                [pressedButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
                self.correctAnswersCount++;

            } else {
                if (pressedButton.tag == 1) {
                    self.answerImageView1.hidden = false;
                    self.answerButton1.backgroundColor = redColor;
                    self.answerImageView1.image = [UIImage imageNamed:@"error"];
                } else if (pressedButton.tag == 2) {
                    self.answerImageView2.hidden = false;
                    self.answerImageView2.image = [UIImage imageNamed:@"error"];
                    self.answerButton2.backgroundColor = redColor;
                } else if (pressedButton.tag == 3) {
                    self.answerImageView3.hidden = false;
                    self.answerImageView3.image = [UIImage imageNamed:@"error"];
                    self.answerButton3.backgroundColor = redColor;
                } else if (pressedButton.tag == 4) {
                    self.answerImageView4.hidden = false;
                    self.answerImageView4.image = [UIImage imageNamed:@"error"];
                    self.answerButton4.backgroundColor = redColor;
                }
            }
        }
    }
    NSLog(@">>>>>%zd", self.correctAnswersCount);

    if (question.type == 2) {
        if (self.correctAnswersCount == 2) {
            [self disableAnswerButtons];
        }
    } else {
        [self disableAnswerButtons];
    }
    self.isEnabled = true;
    
}

- (IBAction)actionNextQuestionButton:(id)sender {

    if (self.currentQuestionIndex != 0) {
        Question *question = self.test.questions[self.currentQuestionIndex];
        self.isEnabled = false;
        [self hidenElements];
        
        if (question.type == 3) {
            [self hidenButtons];
            self.correctAnswersTextView.hidden = false;
            self.correctAnswersTextView.layer.borderWidth = 1;
            self.correctAnswersTextView.layer.borderColor = [[UIColor blackColor] CGColor];
            self.correctAnswersTextView.layer.cornerRadius = 5;
            self.correctAnswersTextView.selectable = true;
            
        } else {
            
            [self disableHidenButtons];
            [self enableAnswerButtons];
            [self colorAnswerButtons];
            [self colorTitleButtons];
        }
        [self configure];
        
    } else {

        [self performSegueWithIdentifier:@"toResultViewControllerSegue" sender:self];

    }
}


#pragma mark - Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toResultViewControllerSegue"]) {
        
        ResultViewController *destinationTestViewController = [segue destinationViewController];
        destinationTestViewController.test = self.test;
        destinationTestViewController.correctAnswersCount = self.correctAnswersCount;
    }
    
}

- (void)configure {
    
    Question *question = self.test.questions[self.currentQuestionIndex];
    
    [self.questionLabel setText:question.question];
    [self.answerButton1 setTitle:question.availableAnswers[0] forState:UIControlStateNormal];
    [self.answerButton2 setTitle:question.availableAnswers[1] forState:UIControlStateNormal];
    [self.answerButton3 setTitle:question.availableAnswers[2] forState:UIControlStateNormal];
    [self.answerButton4 setTitle:question.availableAnswers[3] forState:UIControlStateNormal];

    self.currentQuestionIndex++;

    if (self.currentQuestionIndex > self.questionsCount - 1) {
        self.currentQuestionIndex = 0;
    }
    
}
- (void) textViewTapped {
    self.nextQuestionButton.hidden = false;
}

- (void) hidenElements {
    
    self.correctAnswersTextView.hidden = true;
    self.nextQuestionButton.hidden = true;
    self.answerImageView1.hidden = true;
    self.answerImageView2.hidden = true;
    self.answerImageView3.hidden = true;
    self.answerImageView4.hidden = true;
}

- (void) hidenButtons {

    self.answerButton1.hidden = true;
    self.answerButton2.hidden = true;
    self.answerButton3.hidden = true;
    self.answerButton4.hidden = true;
}

- (void) disableHidenButtons {
    
    self.answerButton1.hidden = false;
    self.answerButton2.hidden = false;
    self.answerButton3.hidden = false;
    self.answerButton4.hidden = false;
}

- (void) disableAnswerButtons {
    
    self.answerButton1.enabled = false;
    self.answerButton2.enabled = false;
    self.answerButton3.enabled = false;
    self.answerButton4.enabled = false;
}

- (void) enableAnswerButtons {
    
    self.answerButton1.enabled = true;
    self.answerButton2.enabled = true;
    self.answerButton3.enabled = true;
    self.answerButton4.enabled = true;
}

- (void) colorAnswerButtons {
    
    UIColor *colorButtons = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:1];
    
    self.answerButton1.backgroundColor = colorButtons;
    self.answerButton1.layer.borderWidth = 1;
    self.answerButton2.backgroundColor = colorButtons;
    self.answerButton2.layer.borderWidth = 1;
    self.answerButton3.backgroundColor = colorButtons;
    self.answerButton3.layer.borderWidth = 1;
    self.answerButton4.backgroundColor = colorButtons;
    self.answerButton4.layer.borderWidth = 1;
    self.nextQuestionButton.layer.borderWidth = 1;
}

- (void) colorTitleButtons {
    
    [self.answerButton1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.answerButton2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.answerButton3 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.answerButton4 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
}

@end
