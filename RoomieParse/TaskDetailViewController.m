//
//  TaskDetailViewController.m
//  RoomieParse
//
//  Created by Dylan Bourgeois on 20/02/14.
//  Copyright (c) 2014 Dylan Bourgeois. All rights reserved.
//

#import "TaskDetailViewController.h"

@interface TaskDetailViewController ()

@end

@implementation TaskDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taskName.text = self.taskText;
    self.karma.text = self.taskKarma;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Tasks"];
    [query whereKey:@"user" equalTo:[PFUser currentUser].username];
    [query whereKey:@"taskId" equalTo:self.taskText];
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            // The find succeeded.
            self.dueDate = [object objectForKey:@"dateLimit"];
            NSDate *now = [NSDate date];
            NSTimeInterval secondsBetween = [self.dueDate timeIntervalSinceDate:now];
            
            int numberOfDays = secondsBetween / 86400;
            int numberOfHours = secondsBetween / 3600;
            int numberOfMinutes = secondsBetween / 60;
            if (secondsBetween > 0) {
                
            if (numberOfDays) {
                self.timeLeft.text = [NSString stringWithFormat:@"%i days , %i hours and %i minutes left !", numberOfDays, numberOfHours%24, numberOfMinutes%60];
            } else {
                if (numberOfHours) {
                    self.timeLeft.text = [NSString stringWithFormat:@"%i hours and %i minutes left !",numberOfHours%24, numberOfMinutes%60];
                } else {
                    self.timeLeft.text = [NSString stringWithFormat:@"%i minutes left !",numberOfMinutes%60];
                }
                
            }
            }
            
            else {
                if (numberOfDays) {
                    self.timeLeft.text = [NSString stringWithFormat:@"%i days , %i hours and %i minutes late !", abs(numberOfDays), abs(numberOfHours%24), abs(numberOfMinutes%60)];
                } else {
                    if (numberOfHours) {
                        self.timeLeft.text = [NSString stringWithFormat:@"%i hours and %i minutes late !",abs(numberOfHours%24), abs(numberOfMinutes%60)];
                    } else {
                        self.timeLeft.text = [NSString stringWithFormat:@"%i minutes late !",abs(numberOfMinutes%60)];
                    }
                    
                }

            }
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)taskIsCompleted:(id)sender {
    
    
}

- (IBAction)delayTask:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
