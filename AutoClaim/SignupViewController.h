//
//  SignupViewController.h
//  AutoClaim
//
//  Created by sampath on 2015-02-23.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailid;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UITextField *passw;
- (IBAction)Save:(id)sender;

@end
