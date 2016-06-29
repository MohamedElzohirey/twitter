//
//  TWTweetCell.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSDataSources/SSDataSources.h>
#import "TWTweetObject.h"

@interface TWTweetCell : SSBaseTableCell
@property (nonatomic, strong) TWTweetObject *tweet;
- (void)setTweet:(TWTweetObject *)entity;
-(void)prepareForReuse;



@end
