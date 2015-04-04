//
//  bounceViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-03-06.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "bounceViewController.h"

@interface bounceViewController ()

@end

@implementation bounceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.btnn.hidden = YES;
    // Do any additional setup after loading the view.
  /* _imgView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    //imgView is your UIImageView where you set an image
    
    [self.view addSubview:_imgView];
    
    [UIView animateWithDuration:0.5/1.5 animations:^{
        _imgView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 3.1, 3.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.9/2 animations:^{
            _imgView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _imgView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
   */
    /*[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.8];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(myCallback:finished:context:)];
    
    CGRect frame = _imgView.frame;
    frame.origin = CGPointMake(0, 480);
        _imgView.frame = frame;
    
    
    [UIView commitAnimations];
   */
    /*self.imgeview.frame = CGRectMake(67, 900, 240, 165);
    [UIView animateWithDuration:0.9
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         self.imgeview.frame = CGRectMake(67, 187, 240, 176);
                     }
                     completion:^(BOOL finished){
                     }];
    [self.view addSubview:self.imgeview];
    }
     */
    [UIView animateWithDuration:2.0f animations:^{
        
        [_btnn setAlpha:0.0f];
        
    } completion:^(BOOL finished) {
        
        //fade out
        [UIView animateWithDuration:2.0f animations:^{
            
            [_btnn setAlpha:1.0f];
            
        } completion:nil];
        
    }];
    
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

@end
