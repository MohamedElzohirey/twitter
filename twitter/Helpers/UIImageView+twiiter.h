//
//  UIImageView+twiiter.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageView  (twitter)

- (void)setMediaImageURL:(NSString *)URLString placeholder:(UIImage*)placeholder ;
-(void)applyRoundMask;
-(void)applyRoundMaskCornersOnly;

@end
