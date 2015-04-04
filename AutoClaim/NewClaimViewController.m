//
//  NewClaimViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-02-24.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "NewClaimViewController.h"
#import "SWRevealViewController.h"
@interface NewClaimViewController ()
@property (nonatomic, strong) UIPopoverController *userDataPopover;
@end

@implementation NewClaimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
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

- (IBAction)newclaim:(id)sender {
   /* UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Type Of Accident"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Collision with other Vechile", @"Hit an Object", @"Hit an Animal", @"Hail", @"Fire", @"Wind Strom", @"Theft", @"Vandalism",nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
    }
    else{
        // In this case the device is an iPhone/iPod Touch.
        [actionSheet showInView:self.view];
    }
    
    actionSheet.tag = 100;
*/
}


/*- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:NSLocalizedString(@"Collision with other Vechile", nil)]) {
        [self claim];
    } else if ([buttonTitle isEqualToString:NSLocalizedString(@"Hit an Object", nil)]) {
        [self claim];
    }
    
}
- (void)claim
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"FourViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
    }
 */

@end
