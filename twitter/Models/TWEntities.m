//
//  TWEntities.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWEntities.h"
#import "TWURL.h"

@implementation TWEntities

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"urls" : @"urls",
             @"hashtags":@"hashtags",
             @"user_mentions":@"user_mentions"
             };
}

+ (NSValueTransformer *)urlsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[TWURL class]];
}

@end
