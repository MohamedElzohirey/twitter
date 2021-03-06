//
//  TWFollowersViewController.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWFollowersViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "TWFollowerCell.h"
#import "TWFollower.h"
#import <TwitterKit/TwitterKit.h>
#import "TWFollowerDetailsViewController.h"

#define kInitialCursor @"-1"

@implementation TWFollowersViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.fd_debugLogEnabled = NO;
    
    // Cache by index path initial
    [self prepareTable];
    [self loadFollowers:kInitialCursor];
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    
    self.cacheKey=[NSString stringWithFormat:@"Followers-%@-Cach",[TWLogedInUser user].userID ];
}

-(void)refreshTable {
    //TODO: refresh your data
    [self loadFollowers:@"-1"];
    [self.refreshControl endRefreshing];
}
-(void)prepareTable{
    self.tableView.backgroundColor=[UIColor clearColor];
    self.tableView.scrollEnabled=YES;
    self.followersDataSource=[[SSArrayDataSource alloc]initWithItems:[[NSArray alloc]init]];
    self.followersDataSource.emptyView =[self emptyView];
    [self.tableView registerNib:[UINib nibWithNibName:kTWFollowerCell bundle:nil] forCellReuseIdentifier:kTWFollowerCell];
    self.followersDataSource.cellCreationBlock = ^id(TWFollower* object,
                                                      UITableView *tableView,
                                                      NSIndexPath *indexPath) {
        return [TWFollowerCell cellForTableView:tableView];
    };
    self.followersDataSource.rowAnimation = UITableViewRowAnimationFade;
    self.followersDataSource.tableActionBlock = ^BOOL(SSCellActionType actionType,
                                                       UITableView *tableView,
                                                       NSIndexPath *indexPath) {
        // we allow both moving and deleting.
        // You could instead do something like
        return (actionType == SSCellActionTypeMove);
        // to only allow moving and disallow deleting.
        return NO;
    };
    self.followersDataSource.tableDeletionBlock = ^(SSSectionedDataSource *aDataSource,
                                                     UITableView *tableView,
                                                     NSIndexPath *indexPath) {
        [aDataSource removeItemAtIndexPath:indexPath];
    };
    self.tableView.backgroundColor=[UIColor clearColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.followersDataSource.tableView=self.tableView;
    @weakify(self);
    self.followersDataSource.cellConfigureBlock = ^(TWFollowerCell* cell,
                                                     TWFollower*item,
                                                     UITableView *tableView,
                                                     NSIndexPath *indexPath){
        @strongify(self);
        [self configureCell:cell atIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
    };
    
}
-(UIView*)emptyView{
    UIView*emptyView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame),50)];
    UILabel*lbl=[[UILabel  alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame),50)];
    lbl.text=[MCLocalization stringForKey:@"nofollowers"];
    lbl.textAlignment=NSTextAlignmentCenter;
    [emptyView addSubview:lbl];
    return emptyView;
}


#pragma mark - UITableViewDataSource
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [self.followersDataSource.allItems count]-1  ) {
      //load next cursor (page)
        [self loadFollowers:self.result.next_cursor_str];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     TWFollowerDetailsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:kFollowerDetailsController];
    controller.follower=self.followersDataSource.allItems[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)loadFollowers:(NSString*)cursor {
    // Create an API client and data source to fetch Tweets for the timeline
    // Objective-C
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    NSString *statusesShowEndpoint =[NSString stringWithFormat:kFollowers,[TWLogedInUser user].userID,cursor];
    NSError *clientError;
    NSURLRequest *request = [client URLRequestWithMethod:@"GET" URL:statusesShowEndpoint parameters:nil error:&clientError];
    
    if (request) {
        [client sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                NSError *jsonError;
                self.result=[MTLJSONAdapter modelOfClass:[TWFollowerResult class] fromJSONDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError] error:&jsonError];
                if ([cursor isEqualToString:kInitialCursor]) {
                    [self.followersDataSource removeAllItems];
                }
                [self.followersDataSource appendItems:self.result.users];
                [[PINDiskCache sharedCache] setObject:self.result forKey:self.cacheKey block:nil];
            }
            else {
                NSLog(@"Error: %@", connectionError);
                [self loadCachedVersion];
            }
        }];
    }
    else {
        NSLog(@"Error: %@", clientError);
    }
}

-(void)loadCachedVersion{
    @weakify(self)
    [[PINDiskCache sharedCache] objectForKey:self.cacheKey
                                       block:^(PINDiskCache * _Nonnull cache, NSString * _Nonnull key, id<NSCoding>  _Nullable object, NSURL * _Nullable fileURL) {
                                           if (object == nil) {
                                           } else {
                                               dispatch_async(dispatch_get_main_queue(), ^{
                                                   @strongify(self)
                                                   self.result=(TWFollowerResult*)object;
                                                   if(self.followersDataSource.allItems.count==0)
                                                       [self.followersDataSource appendItems:self.result.users];
                                               });
                                               
                                           }
                                       }];
}

- (void)configureCell:(TWFollowerCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.follower = self.followersDataSource.allItems[indexPath.row];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:kTWFollowerCell configuration:^(TWFollowerCell *cell) {
        [self configureCell:cell atIndexPath:indexPath];
    }];
}

#pragma mark - Actions

- (IBAction)refreshControlAction:(UIRefreshControl *)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
        [sender endRefreshing];
    });
}


- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Localization

- (void)localize {
    //set the header text according to user's selected language
    self.header_lbl.text=[MCLocalization stringForKey:@"followers_header"];
}

@end

