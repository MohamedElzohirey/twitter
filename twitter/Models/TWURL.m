//
//  TWURL.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWURL.h"

@implementation TWURL

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"expanded_url" : @"expanded_url",
             @"url":@"url",
             @"display_url":@"display_url"
             };
}

@end
