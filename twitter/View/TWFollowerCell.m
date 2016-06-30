//
//  TWFollowerCell.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWFollowerCell.h"
#import "UIImageView+twiiter.h"

@interface TWFollowerCell ()


@end

@implementation TWFollowerCell
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Fix the bug in iOS7 - initial constraints warning
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setFollower:(TWFollower *)entity{
    self.fullNameLabel.text=[NSString stringWithFormat:@"%@   @%@",entity.name,entity.screen_name];
    self.bioLabel.text=entity.descriptionObj;
    [self.avatarmageView setMediaImageURL:entity.profile_image_url_https placeholder:[UIImage imageNamed:@"icon"]];
    [self.avatarmageView applyRoundMask];
    self.avatarmageView.backgroundColor=kBlueColorActive;
}

-(void)prepareForReuse{

}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.fullNameLabel sizeThatFits:size].height;
    totalHeight += [self.bioLabel sizeThatFits:size].height;
    totalHeight += 100; // margins
    return CGSizeMake(size.width, totalHeight);
}

@end
