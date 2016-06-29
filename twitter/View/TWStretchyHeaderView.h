//
//  TWStretchyHeaderView.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/29/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSKStretchyHeaderView.h"

@interface TWStretchyHeaderView : GSKStretchyHeaderView
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@end
