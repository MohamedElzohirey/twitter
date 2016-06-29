//
//  TWFollowerResult.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface TWFollowerResult : MTLModel<MTLJSONSerializing>
@property(nonatomic, copy, readonly) NSArray *users;
@property(nonatomic, copy, readonly) NSNumber *next_cursor;
@property(nonatomic, copy, readonly) NSString *next_cursor_str;
@property(nonatomic, copy, readonly) NSNumber *previous_cursor;
@property(nonatomic, copy, readonly) NSString *previous_cursor_str;

@end
