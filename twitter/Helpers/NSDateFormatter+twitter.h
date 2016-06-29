//
//  NSDateFormatter+twitter.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (twitter)

+ (NSDate *)dateFromtwitterString:(NSString *)dateString;
@end

