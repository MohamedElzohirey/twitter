//
//  TWProgress.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWProgress : NSObject

+(void)show;
+(void)showWithStatus:(NSString*)status;
+(void)dismiss;

@end
