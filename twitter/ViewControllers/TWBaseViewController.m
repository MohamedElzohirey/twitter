//
//  TWBaseViewController.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWBaseViewController.h"

@interface TWBaseViewController ()

@end

@implementation TWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Listen for language changes and localize accordingly...
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(localize)
                                                 name:MCLocalizationLanguageDidChangeNotification object:nil];
    [self localize];
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

#pragma mark - Localization

- (void)localize {
    NSLog(@"*****************************************************");
    NSLog(@"*****************************************************");
    NSLog(@"*** WARNING - SUBCLASS DID NOT IMPLEMENT localize ***");
    NSLog(@"*****************************************************");
    NSLog(@"*****************************************************");
}

@end
