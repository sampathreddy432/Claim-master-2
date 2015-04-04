//
//  addPhotosViewController.h
//  AutoClaim
//
//  Created by sampath on 2015-03-16.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
@interface addPhotosViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableview1;
@property (weak, nonatomic) IBOutlet UITableView *tableview2;
@end
