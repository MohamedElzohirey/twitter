//
//  TWImageViewer.m
//  twitter
//
//  Created by Mohamed Elzohirey on 6/30/16.
//  Copyright © 2016 Eventus. All rights reserved.
//

#import "TWImageViewer.h"

@implementation TWImageViewer

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"TWImageViewer" owner:self options:nil] lastObject];
        [self setFrame:frame];
    }
    
    return self;
}

-(IBAction)closeImage:(id)sender{
    [self removeFromSuperview];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.mediaImage;
}

- (void) initZooming{
    self.scrollView.minimumZoomScale=0.5;
    self.scrollView.maximumZoomScale=6.0;
    self.scrollView.contentSize = self.mediaImage.image.size;
    self.scrollView.delegate=self;
}

@end
