//
//  NewClaimViewController.h
//  AutoClaim
//
//  Created by sampath on 2015-02-24.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewClaimViewController : UIViewController<UIActionSheetDelegate>
- (IBAction)newclaim:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
