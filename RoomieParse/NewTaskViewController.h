//
//  NewTaskViewController.h
//  RoomieParse
//
//  Created by Dylan Bourgeois on 19/02/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

@interface NewTaskViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *taskAssign;
@property (strong, nonatomic) IBOutlet UILabel *karmaValue;
@property (strong, nonatomic) IBOutlet UITextField *taskText;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePick;
@property (strong, nonatomic) IBOutlet UIStepper *karmaStepper;

@end