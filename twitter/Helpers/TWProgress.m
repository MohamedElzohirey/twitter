//
//  TWProgress.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWProgress.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation TWProgress

+(void)show{
    if (![SVProgressHUD isVisible]) {
        [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:69.0f/255.0f green:103.0f/255.0f blue:255.0f/255.0f alpha:1.0]];
        UIOffset offset;
        offset.horizontal=0.0;
        offset.vertical=-0.0;
        [SVProgressHUD setOffsetFromCenter:offset];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
        [SVProgressHUD show];
    }
    
}
+(void)showWithStatus:(NSString*)status{
    if (![SVProgressHUD isVisible]) {
        [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:69.0f/255.0f green:103.0f/255.0f blue:255.0f/255.0f alpha:1.0]];
        UIOffset offset;
        offset.horizontal=0.0;
        offset.vertical=-0.0;
        [SVProgressHUD setOffsetFromCenter:offset];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
        [SVProgressHUD showWithStatus:status];
    }
}
+(void)dismiss{
    [SVProgressHUD dismiss];
}

@end
