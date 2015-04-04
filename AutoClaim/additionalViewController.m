//
//  additionalViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-02-24.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "additionalViewController.h"
#import "HSDatePickerViewController.h"
@interface additionalViewController ()
@property (nonatomic, strong) UIPopoverController *userDataPopover;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) NSDate *selectedDate;
@end

@implementation additionalViewController
{
    NSArray *list;
}
@synthesize tableView = _tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
   list = [NSArray arrayWithObjects:@"Number of Vehicles", @"Driver Information", @"Witness", @"Passenger", @"Property Owner", @"Police Report", @"People on My Policy",nil];
}
-(void)viewDidUnload
{
    
   }
- (IBAction)showDatePicker:(id)sender {
    HSDatePickerViewController *hsdpvc = [HSDatePickerViewController new];
    hsdpvc.delegate = self;
    if (self.selectedDate) {
        hsdpvc.date = self.selectedDate;
    }
    [self presentViewController:hsdpvc animated:YES completion:nil];
}

#pragma mark - HSDatePickerViewControllerDelegate
- (void)hsDatePickerPickedDate:(NSDate *)date {
    NSLog(@"Date picked %@", date);
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = @"yyyy.MM.dd HH:mm:ss";
    self.dateLabel.text = [dateFormater stringFromDate:date];
    
    self.selectedDate = date;
}

//optional
- (void)hsDatePickerDidDismissWithQuitMethod:(HSDatePickerQuitMethod)method {
    NSLog(@"Picker did dismiss with %lu", method);
}

//optional
- (void)hsDatePickerWillDismissWithQuitMethod:(HSDatePickerQuitMethod)method {
    NSLog(@"Picker will dismiss with %lu", method);
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

- (IBAction)additional:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Type Of Accident"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Number of Vehicles", @"Driver Information", @"Witness", @"Passenger", @"Property Owner", @"Police Report", @"People on My Policy",nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
    }
    else{
        // In this case the device is an iPhone/iPod Touch.
        [actionSheet showInView:self.view];
    }
    
    actionSheet.tag = 100;
    
}





- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:NSLocalizedString(@"Driver Information", nil)]) {
        [self auto];
    } else if ([buttonTitle isEqualToString:NSLocalizedString(@"Passenger", nil)]) {
        [self auto];
    }
    
}
-(void)auto
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"additionViewController"];
    [self presentViewController:vc animated:YES completion:nil];

}



- (IBAction)segment:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.info.hidden = YES;
            self.photos.hidden = YES;
            self.review.hidden = YES;
            self.main.hidden = YES;
            self.Details.hidden = YES;


                        break;
        case 1:
            self.info.hidden = YES;
            self.photos.hidden = NO;
            self.review.hidden = YES;
            self.main.hidden = NO;
            self.Details.hidden = YES;

            break;
        case 2:
            self.info.hidden = NO;
            self.photos.hidden = YES;
            self.review.hidden = YES;
            self.main.hidden = NO;
            self.Details.hidden = YES;

            break;
        case 3:
            self.info.hidden = YES;
            self.photos.hidden = YES;
            self.review.hidden = NO;
            self.main.hidden = NO;
            self.Details.hidden = YES;
            break;
        default:
            break;
    }
    
}

    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [list objectAtIndex:indexPath.row];
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check Row and Select Next View controller
    if (indexPath.row == 0)
    {
        /*
        UIViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"CollectViewController"];
        [self.navigationController pushViewController:view1 animated:YES];
         */
        self.info.hidden = YES;
        self.photos.hidden = YES;
        self.review.hidden = YES;
        self.main.hidden = NO;
        self.Details.hidden = NO;

    }
}


- (IBAction)cancel:(id)sender {
    self.info.hidden = YES;
    self.photos.hidden = YES;
    self.review.hidden = YES;
    self.main.hidden = YES;
    self.Details.hidden = YES;
    
}

- (IBAction)addvehicle:(id)sender {
}
@end
