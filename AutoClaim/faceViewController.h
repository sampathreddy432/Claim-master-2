//
//  faceViewController.h
//  AutoClaim
//
//  Created by sampath on 2015-03-07.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface faceViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *webview;

}
@property (nonatomic, retain) IBOutlet UIWebView *webview;
@property (nonatomic, retain) NSString *isLogin;
@end
