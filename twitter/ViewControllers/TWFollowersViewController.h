//
//  TWFollowersViewController.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSDataSources/SSDataSources.h>
#import "TWFollowerResult.h"

@interface TWFollowersViewController : TWBaseViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SSArrayDataSource *followersDataSource;
@property (strong, nonatomic) TWFollowerResult *result;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSString* cacheKey;

@property (weak, nonatomic) IBOutlet UILabel *header_lbl;

@end
