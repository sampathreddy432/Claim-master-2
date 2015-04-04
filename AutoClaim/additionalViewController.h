//
//  additionalViewController.h
//  AutoClaim
//
//  Created by sampath on 2015-02-24.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface additionalViewController : UIViewController<UIActionSheetDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UIButton *additional;
- (IBAction)additional:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *information;
- (IBAction)segment:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *main;
@property (weak, nonatomic) IBOutlet UIView *info;
@property (weak, nonatomic) IBOutlet UIView *review;
@property (weak, nonatomic) IBOutlet UIView *photos;
@property (weak, nonatomic) IBOutlet UIView *Details;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *addvehicle;
- (IBAction)cancel:(id)sender;
- (IBAction)addvehicle:(id)sender;


@end
