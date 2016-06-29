//
//  UIImageView+twiiter.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "UIImageView+twiiter.h"
#import "FXImageView.h"
#import "UIImage+FX.h"
#import <AFNetworking/UIKit+AFNetworking.h>

static const NSTimeInterval kAnimationDuration = 0.2;
static const UIViewAnimationOptions kAnimationOptions = UIViewAnimationOptionBeginFromCurrentState |
UIViewAnimationOptionCurveEaseInOut |
UIViewAnimationOptionTransitionCrossDissolve;


@implementation UIImageView (twitter)

- (void)setMediaImageURL:(NSString *)URLString placeholder:(UIImage*)placeholder  {
    @autoreleasepool {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                                               cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                           timeoutInterval:60];
        [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
        [request setHTTPShouldHandleCookies:NO];
        [request setHTTPShouldUsePipelining:YES];
        
        AFImageDownloader *downloader = [[self class] sharedImageDownloader];
        id <AFImageRequestCache> imageCache = downloader.imageCache;
        
        //Use the image from the image cache if it exists
        UIImage *cachedImage = [imageCache imageforRequest:request withAdditionalIdentifier:nil];
        if (cachedImage) {
            self.image = cachedImage;
            return;
        }
        
        @weakify(self);
        [self setImageWithURLRequest:request
                    placeholderImage:placeholder
                             success:^(NSURLRequest *req, NSHTTPURLResponse *response, UIImage *image) {
                                 @strongify(self);
                                 if (image.size.width >1024||image.size.height>768)
                                     image=[image imageScaledToFillSize:CGSizeMake(1024, 768)];
                                 [UIView transitionWithView:self
                                                   duration:kAnimationDuration
                                                    options:kAnimationOptions
                                                 animations:^{
                                                     self.image = image;
                                                 }
                                                 completion:nil];
                             }
                             failure:^(NSURLRequest *req, NSHTTPURLResponse *response, NSError *error) {
                                 @strongify(self);
                                 self.image = nil;
                             }];
    }
}
-(void)applyRoundMask {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

-(void)applyRoundMaskCornersOnly {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

@end
