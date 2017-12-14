//
//  ResultViewController.m
//  QuizGame
//
//  Created by User on 02.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import "ResultViewController.h"
#import "TestViewController.h"
#import "Test.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configure];

}

#pragma mark - Actions

- (IBAction)actionStartButton:(id)sender {
    
    [self.navigationController setNavigationBarHidden:false];
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (void)configure {
    
    NSInteger questionsCount = self.test.questions.count;
    NSInteger passingScore = self.test.passingScore;
    
    [self.navigationController setNavigationBarHidden:true];
    self.backButton.layer.borderWidth = 1;
    
    self.resultYesLabel.text = [NSString stringWithFormat:@"%zd", self.correctAnswersCount];
    NSLog(@">>>>> res %zd", self.correctAnswersCount);
    
    NSInteger resaltNo = questionsCount - self.correctAnswersCount;
    self.resultNoLabel.text = [NSString stringWithFormat:@"%zd", resaltNo];
    self.passingScoreLabel.text = [NSString stringWithFormat:@"%zd", passingScore];
    
    if (self.correctAnswersCount >= passingScore) {
        self.resultTextLabel.text = @"Поздравляем! Вы прошли этот тест";
    } else {
        self.resultTextLabel.text = @"Teст не пройден";
    }
    
}

@end
