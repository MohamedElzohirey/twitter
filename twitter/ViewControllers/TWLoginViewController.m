//
//  TWLoginViewController.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWLoginViewController.h"
#import <TwitterKit/TwitterKit.h>

@interface TWLoginViewController ()

@end

@implementation TWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
            // Callback for login success or failure. The TWTRSession
            // is also available on the [Twitter sharedInstance]
            // singleton.
            //
            NSString *message = [NSString stringWithFormat:@"@%@ logged in! (%@) token: %@",
                                 [session userName], [session userID],session.authToken];
            NSLog(@"%@",message);
            [TWLogedInUser sharedInstance].userName=session.userName;
            [TWLogedInUser sharedInstance].userID=session.userID;
            [TWLogedInUser sharedInstance].authToken=session.authToken;
            [TWLogedInUser setUser:[TWLogedInUser sharedInstance]];
            TWLoginViewController* controllser = [self.storyboard instantiateViewControllerWithIdentifier:kFollowersViewController];
            [self.navigationController pushViewController:controllser animated:YES];
        } else {
            NSLog(@"Login error: %@", [error localizedDescription]);
        }
    }];
    
    // TODO: Change where the log in button is positioned in your view
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Localization

- (void)localize {
    self.header_lbl.text=[MCLocalization stringForKey:@"login"];
}

@end
