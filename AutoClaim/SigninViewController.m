//
//  SigninViewController.m
//  AutoClaim
//
//  Created by sampath on 2015-02-23.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "SigninViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>
#import <TwitterKit/TwitterKit.h>

@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UIButton *signin;

@end

@implementation SigninViewController
@synthesize email;
@synthesize password;
@synthesize facebookButton;
@synthesize googleButton;
@synthesize twitterButton;

- (void) facebookLoginAction
{
    [FBSession openActiveSessionWithReadPermissions:@[@"public_profile", @"user_birthday", @"email"]
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session, FBSessionState state, NSError *error) {
         
         if (session.state == FBSessionStateOpen)
         {
             NSLog(@"token: %@", session.accessTokenData.accessToken);
             [self loginSuccessAction];
         }
     }];
}

- (void) twitterLoginAction
{
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session) {
             NSLog(@"signed in as %@", [session userName]);
             
             [self loginSuccessAction];
             
         } else {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];
}

- (void) googlePlusLoginAction
{
    NSLog(@"Here");
    [[GPPSignIn sharedInstance] setDelegate:self];
    
    if ([[GPPSignIn sharedInstance] authentication]) {

        // The user is signed in.
        // Perform other actions here, such as showing a sign-out button
    } else {
        // Perform other actions here
    }


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //FBLoginView *loginView = [[FBLoginView alloc] init];
    self.email.delegate = self;
    self.password.delegate = self;
    
    [self.facebookButton addTarget:self action:@selector(facebookLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.twitterButton addTarget:self action:@selector(twitterLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.googleButton addTarget:self action:@selector(googlePlusLoginAction) forControlEvents:UIControlEventTouchUpInside];
    
    //if statement to check if there is a registered user or not
   

}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; //create instance of NSUSerDefaults
    if (![defaults boolForKey:@"registered"]) {
        NSLog(@"No user registered");
        _signin.hidden = YES; //hide login button because no user is regsitered
    }
    else {
        NSLog(@"user is registered");
        _confirm.hidden = YES;
        _signup.hidden = YES;
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"TabViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void) loginSuccessAction
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; //create instance of NSUSerDefaults
    [defaults setObject:email.text forKey:@"username"];
    [defaults setObject:password.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    [defaults synchronize];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"TabViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - GPPSignInDelegate

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth
                   error:(NSError *)error {
    
    if (error) {
        NSLog(@"%@",
        [NSString stringWithFormat:@"Status: Authentication error: %@", error]);
        return;
    }
    [self loginSuccessAction];
    NSLog(@"Here22");
}

- (void)didDisconnectWithError:(NSError *)error {
    if (error) {
        NSLog(@"%@", [NSString stringWithFormat:@"Status: Failed to disconnect: %@", error]);
    } else {
        NSLog(@"%@",[NSString stringWithFormat:@"Status: Disconnected"]);
    }
}

/*- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error {
    NSLog(@"Received error %@ and auth object %@",error, auth);
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    NSLog(@"email address %@",[user objectForKey:@"email"]);
    NSLog(@"Token Return %@",[FBSession activeSession].accessTokenData);
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"TabViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void) loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"%@", user.name);
}
 
-(void) loginViewShowingLoggedInUser:(FBLoginView *) loginView
{
    NSLog(@"you are logged in");
    
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"TabViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    
}*/



- (IBAction)btn:(id)sender {
    [[GPPSignIn sharedInstance] authenticate];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"TabViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
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


- (IBAction)signin:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //check that username and password match stored values
    if ([email.text isEqualToString:[defaults objectForKey:@"username"]] && [password.text isEqualToString:[defaults objectForKey:@"password"]]) {
        email.text = nil;
        password.text = nil;
        //[self performSegueWithIdentifier:@"login" sender:self]; //perform segue to next view controller
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"TabViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    
    }
    
    else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Oooops" message:@"Your username and password does not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error show];
    }

    
   /*if ([email.text isEqualToString:@""] || [password.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Please Fill all the field" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    else
    {
        
        NSString *strURL = [NSString stringWithFormat:@"http:localhost:8888/validate.php?username=%@&password=%@",email.text, password.text];
        
        // to execute php code
        NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
        
        // to receive the returend value
        NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
        if ([strResult isEqualToString:@"{\"success\":0,\"message\":\" One or both of the fields are empty \"}"])
        {
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"TabViewController"];
            [self presentViewController:vc animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Invalide Information" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
    }}
    */
}
- (void) checkPasswordsMatch {
    
    //check that the two apssword fields are identical
    if ([password.text isEqualToString:_confirm.text]) {
        NSLog(@"passwords match!");
        [self registerNewUser];
    }
    else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Oooops" message:@"Your entered passwords do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error show];
    }
    
}

- (void) registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //write the username and password and set BOOL value in NSUserDefaults
    [defaults setObject:email.text forKey:@"username"];
    [defaults setObject:password.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    [defaults synchronize];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have registered a new user" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [success show];
    
    //[self performSegueWithIdentifier:@"login" sender:self];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"LogViewController"];
    [self presentViewController:vc animated:YES completion:nil];}



- (IBAction)signup:(id)sender {
    if ([email.text isEqualToString:@""] || [password.text isEqualToString:@""] || [_confirm.text isEqualToString:@""]) {
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Oooops" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error show];
    }
    else {
        [self checkPasswordsMatch];
    }

}
@end
