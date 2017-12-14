//
//  TestTableViewCell.h
//  QuizGame
//
//  Created by User on 03.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Test.h"

@interface TestTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)configureFor:(Test*)test;

@end
