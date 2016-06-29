//
//  TWLogedInUser.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWLogedInUser.h"

@implementation TWLogedInUser

+ (instancetype)sharedInstance{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        
    });
    return _sharedObject;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if( self != nil )
    {
        self.userID = [decoder decodeObjectForKey:@"userID"];
        self.userName = [decoder decodeObjectForKey:@"userName"];
        self.authToken = [decoder decodeObjectForKey:@"authToken"];
}
    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.userID forKey:@"userID"];
    [encoder encodeObject:self.userName forKey:@"userName"];
    [encoder encodeObject:self.authToken forKey:@"authToken"];
}
+(TWLogedInUser*)user{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"TWLogedInUser"]) {
        return [TWLogedInUser sharedInstance];
    } else {
        NSData *ecodedObject = [[NSUserDefaults standardUserDefaults] objectForKey: [NSString stringWithFormat:@"TWLogedInUser"]];
        TWLogedInUser *user =[NSKeyedUnarchiver unarchiveObjectWithData: ecodedObject];
        return user;
    }
}

+(void)setUser:(TWLogedInUser*)user{
    if (user) {
        NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
        [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:@"TWLogedInUser"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TWLogedInUser"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
