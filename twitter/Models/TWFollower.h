//
//  TWFollower.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface TWFollower : MTLModel<MTLJSONSerializing>
@property(nonatomic, copy, readonly) NSNumber *identifier;
@property(nonatomic, copy, readonly) NSString *identifierStr;
@property(nonatomic, copy, readonly) NSString *name;
@property(nonatomic, copy, readonly) NSString *screen_name;
@property(nonatomic, copy, readonly) NSString *location;
@property(nonatomic, copy, readonly) NSString *profile_location;
@property(nonatomic, copy, readonly) NSString *url;
@property(nonatomic, copy, readonly) NSString *descriptionObj;
@property(nonatomic, copy, readonly) NSNumber *protectedFlag;
@property(nonatomic, copy, readonly) NSNumber *followers_count;
@property(nonatomic, copy, readonly) NSNumber *friends_count;
@property(nonatomic, copy, readonly) NSNumber *listed_count;
@property(nonatomic, copy, readonly) NSDate   *created_at;
@property(nonatomic, copy, readonly) NSNumber *favourites_count;
@property(nonatomic, copy, readonly) NSString *profile_background_color;
@property(nonatomic, copy, readonly) NSString *profile_background_image_url;
@property(nonatomic, copy, readonly) NSString *profile_background_image_url_https;
@property(nonatomic, copy, readonly) NSString *profile_image_url;
@property(nonatomic, copy, readonly) NSString *profile_image_url_https;
@property(nonatomic, copy, readonly) NSString *profile_sidebar_border_color;
@property(nonatomic, copy, readonly) NSString *profile_sidebar_fill_color;
@property(nonatomic, copy, readonly) NSString *profile_text_color;

@end
