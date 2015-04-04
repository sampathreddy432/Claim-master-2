//
//  addPhotosViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-03-16.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "addPhotosViewController.h"

@interface addPhotosViewController ()

@end

@implementation addPhotosViewController
{
    NSArray *list;
    NSArray *lists;
    NSArray *lis;
}
@synthesize tableView = _tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    list = [NSArray arrayWithObjects:@"Start New Claim", @"Quick Claim", @"Claim Status",nil];
    lists = [NSArray arrayWithObjects:@"Service Providers", @"Deals", nil];
    lis = [NSArray arrayWithObjects:@"Add Friends", @"Settings", nil];
    
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

    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
    {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        if(tableView == self.tableView){
           return [list count];
        }
        
        if(tableView == self.tableview1){
            return [lists count];
        }
        if(tableView == self.tableview2){
            return [lis count];
        }
        //return [list count];
        //return [lists count];
        //return [lis count];
        else{
            return nil;
        }
    }

    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        
        if(tableView == self.tableView)
        {
            static NSString *simpleTableIdentifier = @"RecipeCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            }
            //cell.backgroundColor = [UIColor clearColor];
            cell.textLabel.text = [list objectAtIndex:indexPath.row];
            [cell.textLabel setTextColor:[UIColor whiteColor]];
            return cell;
        }
        if(tableView == self.tableview1)
        {
            static NSString *simplestTableIdentifier = @"Reccell";
            UITableViewCell *celll = [tableView dequeueReusableCellWithIdentifier:simplestTableIdentifier];
            if (celll == nil) {
                celll = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simplestTableIdentifier];
            }
            //celll.backgroundColor = [UIColor clearColor];
            celll.textLabel.text = [lists objectAtIndex:indexPath.row];
            [celll.textLabel setTextColor:[UIColor whiteColor]];
            return celll;
        }
        
        if(tableView == self.tableview2)
        {
            static NSString *simplyTableIdentifier = @"Recell";
            UITableViewCell *cel = [tableView dequeueReusableCellWithIdentifier:simplyTableIdentifier];
            if (cel == nil) {
                cel = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simplyTableIdentifier];
            }
            //cel.backgroundColor = [UIColor clearColor];
            cel.textLabel.text = [lis objectAtIndex:indexPath.row];
            
            [cel.textLabel setTextColor:[UIColor whiteColor]];

            return cel;
        }
        else
        {
            return nil;
        }

    }

        
    
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check Row and Select Next View controller
    if (indexPath.row == 0)
    {
        // Push Selected View
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"StartNewClaim"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
    
@end

