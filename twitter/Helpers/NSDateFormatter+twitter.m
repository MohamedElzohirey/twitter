//
//  NSDateFormatter+twitter.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "NSDateFormatter+twitter.h"

@implementation NSDateFormatter (twitter)

+ (NSDate *)dateFromtwitterString:(NSString *)dateString {
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
    });
    return [dateFormatter dateFromString:dateString];
}

@end
