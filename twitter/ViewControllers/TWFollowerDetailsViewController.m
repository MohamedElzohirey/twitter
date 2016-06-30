//
//  TWFollowerDetailsViewController.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWFollowerDetailsViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "TWTweetCell.h"
#import "TWFollower.h"
#import <TwitterKit/TwitterKit.h>
#import "TWFollowerDetailsViewController.h"
#import "UIImageView+twiiter.h"
#import "TWTweetObject.h"
#import "TWStretchyHeaderView.h"

#define kTWStretchyHeaderView @"TWStretchyHeaderView"

@interface TWFollowerDetailsViewController ()

@end

@implementation TWFollowerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareTable];
    [self loadFollowers:self.follower.identifierStr];
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    TWStretchyHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:kTWStretchyHeaderView
                                                                owner:self
                                                              options:nil]lastObject];
    [headerView.avatar setMediaImageURL:self.follower.profile_image_url_https placeholder:[UIImage imageNamed:@"icon"]];
    [headerView.avatar applyRoundMaskCornersOnly];
    [headerView.background setMediaImageURL:self.follower.profile_background_image_url_https placeholder:[UIImage imageNamed:@"icon"]];
    [self.tableView addSubview:headerView];
    
    // You can change the minimum and maximum content heights
    headerView.minimumContentHeight = 100;
    headerView.maximumContentHeight = 280;
    headerView.contentAnchor = GSKStretchyHeaderViewContentAnchorTop;
    
    self.cacheKey=[NSString stringWithFormat:@"Tweets-%@-Cach",self.follower.identifierStr ];

}

-(void)refreshTable {
    //TODO: refresh your data
    [self loadFollowers:self.follower.identifierStr];
    [self.refreshControl endRefreshing];
}

-(void)prepareTable{
    self.tableView.backgroundColor=[UIColor clearColor];
    self.twittesDataSource=[[SSArrayDataSource alloc]initWithItems:[[NSArray alloc]init]];
    self.twittesDataSource.emptyView =[self emptyView];
    [self.tableView registerNib:[UINib nibWithNibName:kTWTweetCell bundle:nil] forCellReuseIdentifier:kTWTweetCell];
    self.twittesDataSource.cellCreationBlock = ^id(TWTweetObject* object,
                                                     UITableView *tableView,
                                                     NSIndexPath *indexPath) {
        return [TWTweetCell cellForTableView:tableView];
    };
    self.twittesDataSource.rowAnimation = UITableViewRowAnimationFade;

    self.tableView.backgroundColor=[UIColor clearColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.twittesDataSource.tableView=self.tableView;
    @weakify(self);
    self.twittesDataSource.cellConfigureBlock = ^(TWTweetCell* cell,
                                                    TWTweetObject*item,
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
    lbl.text=@"No tweets!";
    lbl.textAlignment=NSTextAlignmentCenter;
    [emptyView addSubview:lbl];
    return emptyView;
}

#pragma mark - UITableViewDataSource
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [self.twittesDataSource.allItems count]-1  ) {
        //load next cursor (page)
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)loadFollowers:(NSString*)userID {
    // Create an API client and data source to fetch Tweets for the timeline
    // Objective-C
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    NSString *statusesShowEndpoint =[NSString stringWithFormat:kTimeLine,userID];
    NSError *clientError;
    NSURLRequest *request = [client URLRequestWithMethod:@"GET" URL:statusesShowEndpoint parameters:nil error:&clientError];
    
    if (request) {
        [client sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                NSError *jsonError;
                NSArray*tweets=[MTLJSONAdapter modelsOfClass:[TWTweetObject class] fromJSONArray:[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError] error:&jsonError];
                [self.twittesDataSource removeAllItems];
                [self.twittesDataSource appendItems:tweets];
                [[PINDiskCache sharedCache] setObject:tweets forKey:self.cacheKey block:nil];
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
                                                   if(self.twittesDataSource.allItems.count==0)
                                                       [self.twittesDataSource appendItems:(NSArray*)object];
                                               });
                                               
                                           }
                                       }];
}
- (void)configureCell:(TWTweetCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = YES;
    cell.tweet = self.twittesDataSource.allItems[indexPath.row];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:kTWTweetCell configuration:^(TWTweetCell *cell) {
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
    NSLog(@"*** LOCALIZE NOT IMPLEMENTED ***");
}

@end