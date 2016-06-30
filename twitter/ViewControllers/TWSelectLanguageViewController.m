//
//  TWSelectLanguageViewController.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/30/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWSelectLanguageViewController.h"

@interface TWSelectLanguageViewController ()

@end

@implementation TWSelectLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)arabic:(id)sender {
    [[MCLocalization sharedInstance]setLanguage:@"ar"];
    [self openLogin];
}

- (IBAction)english:(id)sender {
    [[MCLocalization sharedInstance]setLanguage:@"en"];
    [self openLogin];
}

-(void)openLogin{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:kLoginViewController];
                       [self.navigationController pushViewController:controller animated:YES];
                   });
}
#pragma mark - Localization

- (void)localize {
    //no need for localization here!
}


@end
