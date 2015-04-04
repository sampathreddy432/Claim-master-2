//
//  DriverViewController.h
//  AutoClaim
//
//  Created by sampath on 2015-03-03.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DriverViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *company;
@property (weak, nonatomic) IBOutlet UITextField *policy;
@property (weak, nonatomic) IBOutlet UITextField *license;
- (IBAction)save:(id)sender;

@end
