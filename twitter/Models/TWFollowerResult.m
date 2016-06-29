//
//  TWFollowerResult.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWFollowerResult.h"
#import "TWFollower.h"

@implementation TWFollowerResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"users" : @"users",
             @"next_cursor":@"next_cursor",
             @"next_cursor_str":@"next_cursor_str",
             @"previous_cursor":@"previous_cursor",
             @"previous_cursor_str":@"previous_cursor_str"
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[TWFollower class]];
}
@end
