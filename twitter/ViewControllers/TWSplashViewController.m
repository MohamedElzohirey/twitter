//
//  TWSplashViewController.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWSplashViewController.h"
#import "TWLoginViewController.h"

@interface TWSplashViewController ()

@end

@implementation TWSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView*view = [[[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:self options:nil] lastObject];
    view.frame=self.view.frame;
    [self.view addSubview:view];
}

-(void)viewWillAppear:(BOOL)animated{
    if ([TWLogedInUser user].userID.length>0) {
        //logged in
        [TWProgress showWithStatus:@"Authenticating...."];
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            TWLoginViewController* controllser = [self.storyboard instantiateViewControllerWithIdentifier:kFollowersViewController];
            [self.navigationController pushViewController:controllser animated:YES];
            [TWProgress dismiss];
        });
    }else{
            TWLoginViewController* controllser = [self.storyboard instantiateViewControllerWithIdentifier:kLoginViewController];
            [self.navigationController pushViewController:controllser animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Localization

- (void)localize {
    NSLog(@"*** LOCALIZE NOT IMPLEMENTED ***");
}

@end
