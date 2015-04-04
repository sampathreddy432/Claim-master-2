//
//  submitViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-02-24.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "submitViewController.h"

@interface submitViewController ()

@end

@implementation submitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"name"];
    NSString *email = [defaults objectForKey:@"email"];
     NSString *company = [defaults objectForKey:@"company"];
     NSString *license = [defaults objectForKey:@"license"];

    int phone = [defaults integerForKey:@"phone"];
    NSString *phonestrng = [NSString stringWithFormat:@"%i",phone];
    
    _nam.text = name;
    _emai.text = email;
    _phon.text = phonestrng;
    _compan.text = company;
    _licens.text = license;
    
}

    // Update the UI elements with the saved data

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

@end
