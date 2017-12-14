//
//  TestTableViewCell.m
//  QuizGame
//
//  Created by User on 03.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configureFor:(Test *)test {
    [self.nameLabel setText:test.name];
    [self.descriptionLabel setText:test.testDescription];

}

@end
