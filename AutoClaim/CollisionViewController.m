//
//  CollisionViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-02-24.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "CollisionViewController.h"

@interface CollisionViewController ()

@end

@implementation CollisionViewController
{
NSArray *list;
}
@synthesize tableView = _tableView;
    - (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        list = [NSArray arrayWithObjects:@"Collision with other Vehicle", @"Hit an Object", @"Hit an Animal", @"Hail", @"Fire", @"Wind Strom", @"Theft", @"Vandalism",nil];
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
        // Push Selected View
        /*UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"CollectViewController"];
        [self presentViewController:vc animated:YES completion:nil];
         */
        UIViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"CollectViewController"];
        [self.navigationController pushViewController:view1 animated:YES];
    }
}





@end
