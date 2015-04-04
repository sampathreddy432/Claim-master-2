//
//  DriverViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-03-03.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "DriverViewController.h"

@interface DriverViewController ()

@end

@implementation DriverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    [_name resignFirstResponder];
    [_phone resignFirstResponder];
    [_email resignFirstResponder];
    [_company resignFirstResponder];
    [_policy resignFirstResponder];
    [_license resignFirstResponder];
    
    // Create strings and integer to store the text info
    NSString *Name = [_name text];
    NSString *email  = [_email text];
    NSString *company  = [_company text];
    NSString *license  = [_license text];
    int phone = [[_phone text] integerValue];
    
    
    
    
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:Name forKey:@"name"];
    [defaults setObject:email forKey:@"email"];
    [defaults setInteger:phone forKey:@"phone"];
    [defaults setObject:company forKey:@"company"];
    [defaults setObject:license forKey:@"license"];
    
    [defaults synchronize];
    
    NSLog(@"Data saved");
}
@end
