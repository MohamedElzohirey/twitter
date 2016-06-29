//
//  TWTweetObject.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "TWFollower.h"
#import "TWEntities.h"

@interface TWTweetObject :  MTLModel<MTLJSONSerializing>
@property(nonatomic, copy, readonly) NSNumber *identifier;
@property(nonatomic, copy, readonly) NSString *id_str;
@property(nonatomic, copy, readonly) NSNumber *favorited;
@property(nonatomic, copy, readonly) NSNumber *truncated;
@property(nonatomic, copy, readonly) NSDate *created_at;
@property(nonatomic, copy, readonly) NSString *text;
@property(nonatomic, copy, readonly) NSNumber *retweet_count;
@property(nonatomic, copy, readonly) NSNumber *retweeted;
@property(nonatomic, copy, readonly) TWFollower *user;
@property(nonatomic, copy, readonly) TWEntities *entities;
@end
