//
//  TWFollowerCell.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWFollower.h"
#import <SSDataSources/SSDataSources.h>

@interface TWFollowerCell : SSBaseTableCell
@property (nonatomic, strong) TWFollower *follower;
- (void)setFollower:(TWFollower *)entity;
-(void)prepareForReuse;

///remove
@property (nonatomic, weak) IBOutlet UILabel *fullNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *bioLabel;
@property (nonatomic, weak) IBOutlet UIImageView *avatarmageView;
@end
