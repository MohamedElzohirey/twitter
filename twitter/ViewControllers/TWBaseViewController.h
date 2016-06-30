//
//  TWBaseViewController.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCLocalization.h"

/*
 This will be the base for all view controllers
 The main resason now is localization
 using the 'localize' method
 */
@interface TWBaseViewController : UIViewController

-(void)localize;

@end
