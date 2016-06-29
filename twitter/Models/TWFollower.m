//
//  TWFollower.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWFollower.h"
#import "NSDateFormatter+twitter.h"

@implementation TWFollower
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier" : @"id",
             @"identifierStr":@"id_str",
             @"name":@"name",
             @"screen_name":@"screen_name",
             @"location":@"location",
             @"profile_location":@"profile_location",
             @"url":@"url",
             @"descriptionObj":@"description",
             @"protectedFlag":@"protectedFlag",
             @"followers_count":@"followers_count",
             @"friends_count":@"friends_count",
             @"listed_count":@"listed_count",
             @"created_at":@"created_at",
             @"favourites_count":@"favourites_count",
             @"profile_background_color":@"profile_background_color",
             @"profile_background_image_url":@"profile_background_image_url",
             @"profile_background_image_url_https":@"profile_background_image_url_https",
             @"profile_image_url":@"profile_image_url",
             @"profile_image_url_https":@"profile_image_url_https",
             @"profile_sidebar_border_color":@"profile_sidebar_border_color",
             @"profile_sidebar_fill_color":@"profile_sidebar_fill_color",
             @"profile_text_color":@"profile_text_color"
             };
}

+ (NSValueTransformer *)created_atJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSDateFormatter dateFromtwitterString:value];
    }];
}
/*+ (NSValueTransformer *)profile_background_colorJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return UIColorFromRGB(0x3e65cc);
    }];
}*/
@end