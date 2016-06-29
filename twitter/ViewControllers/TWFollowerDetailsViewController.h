//
//  TWFollowerDetailsViewController.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWFollower.h"
#import <SSDataSources/SSDataSources.h>

@interface TWFollowerDetailsViewController : UIViewController
@property (strong, nonatomic) TWFollower *follower;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SSArrayDataSource *twittesDataSource;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end
