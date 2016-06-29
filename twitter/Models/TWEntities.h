//
//  TWEntities.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface TWEntities :  MTLModel<MTLJSONSerializing>
@property(nonatomic, copy, readonly) NSArray *urls;
@property(nonatomic, copy, readonly) NSArray *hashtags;
@property(nonatomic, copy, readonly) NSArray *user_mentions;

@end
