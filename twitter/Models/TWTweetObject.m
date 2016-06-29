//
//  TWTweetObject.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWTweetObject.h"
#import "NSDateFormatter+twitter.h"

@implementation TWTweetObject
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier" : @"id",
             @"id_str":@"id_str",
             @"favorited":@"favorited",
             @"truncated":@"truncated",
             @"created_at":@"created_at",
             @"text":@"text",
             @"retweet_count":@"retweet_count",
             @"retweeted":@"retweeted",
             @"user":@"user",
             @"entities":@"entities"
             };
}

+ (NSValueTransformer *)created_atJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSDateFormatter dateFromtwitterString:value];
    }];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[TWFollower class]];
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[TWEntities class]];
}
@end
