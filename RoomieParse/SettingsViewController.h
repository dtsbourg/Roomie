//
//  SettingsViewController.h
//  RoomieParse
//
//  Created by Dylan Bourgeois on 23/02/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "FlatUIKit.h"
#import "Reachability.h"

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate,FUIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *karma;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField * tx;

@property (strong, nonatomic) IBOutlet UIButton *editButton;

@property (strong, nonatomic) IBOutlet UIButton *buttonDisconnect;
@property (strong, nonatomic) IBOutlet UIButton *buttonInvite;
@property (strong, nonatomic) NSString *userText;
@property (strong, nonatomic) NSString *userKarma;
@property (strong, nonatomic) NSMutableArray *roomies;
@end
