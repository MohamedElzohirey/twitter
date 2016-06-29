//
//  TWTweetCell.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWTweetCell.h"
#import "UIImageView+twiiter.h"
#import "TWURL.h"

@interface TWTweetCell ()
@property (nonatomic, weak) IBOutlet UILabel *fullNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *bioLabel;
@property (nonatomic, weak) IBOutlet UIImageView *avatarmageView;
@end

@implementation TWTweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(TWTweetObject *)entity{
    _fullNameLabel.text=[NSString stringWithFormat:@"%@   @%@",entity.user.name,entity.user.screen_name];
    _bioLabel.text=entity.text;
    [_avatarmageView setMediaImageURL:entity.user.profile_image_url_https placeholder:[UIImage imageNamed:@"icon"]];
    [_avatarmageView applyRoundMask];
    _avatarmageView.backgroundColor=kBlueColorActive;
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
