//
//  Constants.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/28/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


#endif /* Constants_h */
/*
 View controllers keys
 */
#define kSelectLanguageViewController @"SelectLanguage"
#define kLoginViewController @"Login"
#define kFollowersViewController @"Followers"
#define kFollowerDetailsController @"FollowerDetails"
/*
 Cells keys
 */
#define kTWFollowerCell @"TWFollowerCell"
#define kTWTweetCell @"TWTweetCell"
/*
 API
 */
#define kAPIBaseURL @"https://api.twitter.com/1.1/"
#define kFollowers kAPIBaseURL @"followers/list.json?user_id=%@&count=20&cursor=%@"
#define kTimeLine kAPIBaseURL @"statuses/user_timeline.json?user_id=%@&count=10"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0f \
blue:((float)(rgbValue & 0xFF))/255.0f \
alpha:1.0f]

#define kBlueColorActive UIColorFromRGB(0x3e65cc)
