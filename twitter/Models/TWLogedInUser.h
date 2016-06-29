//
//  TWLogedInUser.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWLogedInUser : NSObject
@property(nonatomic, copy) NSString *userID;
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *authToken;
+(instancetype)sharedInstance;
+(void)setUser:(TWLogedInUser*)user;
+(TWLogedInUser*)user;

@end
