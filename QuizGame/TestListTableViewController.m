//
//  TestListTableViewController.m
//  QuizGame
//
//  Created by User on 02.09.17.
//  Copyright © 2017 Serik_Klement. All rights reserved.
//

#import "TestListTableViewController.h"
#import "TestTableViewCell.h"
#import "TestViewController.h"
#import "JSONParser.h"

@interface TestListTableViewController ()

@property (strong, nonatomic) NSArray * imageArray;
@property (strong, nonatomic) NSArray * testArray;
@property (assign,nonatomic) NSUInteger cellNumber;

@end

@implementation TestListTableViewController

const NSString *toTestViewControllerSegue = @"toTestViewControllerSegue";

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDataAsset *asset1 = [[NSDataAsset alloc] initWithName:@"test1" bundle:NSBundle.mainBundle];
    Test *test1 = [JSONParser parse:asset1.data];
    
    NSDataAsset *asset2 = [[NSDataAsset alloc] initWithName:@"test2" bundle:NSBundle.mainBundle];
    Test *test2 = [JSONParser parse:asset2.data];
    
    NSDataAsset *asset3 = [[NSDataAsset alloc] initWithName:@"test3" bundle:NSBundle.mainBundle];
    Test *test3 = [JSONParser parse:asset3.data];
    
    self.testArray = [NSArray arrayWithObjects: test1, test2, test3, test1, test2, test3, nil];

    self.imageArray = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"poisk"],
                       [UIImage imageNamed:@"slon"],
                       [UIImage imageNamed:@"artist"],
                       [UIImage imageNamed:@"poisk"],
                       [UIImage imageNamed:@"slon"],
                       [UIImage imageNamed:@"artist"],
                       nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.testArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"TestList";
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [cell configureFor:[self.testArray objectAtIndex:indexPath.row]];
    cell.testImageView.image = self.imageArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cellNumber = (NSUInteger)indexPath.row;
    
    [self performSegueWithIdentifier:@"toTestViewControllerSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toTestViewControllerSegue"]) {
 
        TestViewController *destinationTestViewController = [segue destinationViewController];
        destinationTestViewController.test = self.testArray[self.cellNumber];
    }
    
}

@end
