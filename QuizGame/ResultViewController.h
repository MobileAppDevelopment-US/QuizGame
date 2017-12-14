//
//  ResultViewController.h
//  QuizGame
//
//  Created by User on 02.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Test.h"

@interface ResultViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultYesLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *passingScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (strong, nonatomic) Test *test;
@property (assign, nonatomic) NSInteger correctAnswersCount;

@end
