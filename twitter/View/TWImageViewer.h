//
//  TWImageViewer.h
//  twitter
//
//  Created by Mohamed Elzohirey on 6/30/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWImageViewer : UIView <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mediaImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
-(IBAction)closeImage:(id)sender;
- (void) initZooming;
@end
