//
//  PersonalInjuryViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-03-05.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "PersonalInjuryViewController.h"

@interface PersonalInjuryViewController ()

@end

@implementation PersonalInjuryViewController
@synthesize pont;
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

- (IBAction)point:(id)sender {
    if([sender tag] == 1){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"selection"
                                                        message:@"heart selected"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        //[alert release];
    }
    else if([sender tag] == 2){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"selection"
                                                        message:@"kideny selected"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"selection"
                                                        message:@"lungs selected"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
@end
