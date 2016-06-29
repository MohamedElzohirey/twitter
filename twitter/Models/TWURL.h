//
//  TWURL.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface TWURL :  MTLModel<MTLJSONSerializing>
@property(nonatomic, copy, readonly) NSString *expanded_url;
@property(nonatomic, copy, readonly) NSString *url;
@property(nonatomic, copy, readonly) NSString *display_url;
@end
