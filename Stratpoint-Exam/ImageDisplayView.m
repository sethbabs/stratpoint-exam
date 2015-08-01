//
//  ImageDisplayView.m
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 7/30/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import "ImageDisplayView.h"

@implementation ImageDisplayView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initViews];
}
- (void)initViews {
    CGFloat imageWidth = CGRectGetWidth(self.frame);
    CGFloat imageHeight = CGRectGetHeight(self.frame);
    CGRect imageFrame = CGRectMake(0, 0, imageWidth, imageHeight);
    self.backgroundColor = [UIColor greenColor];
    self.imageDisplay = [[UIImageView alloc] initWithFrame:imageFrame];
    self.imageDisplay.contentMode = UIViewContentModeScaleToFill;
    self.imageDisplay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.imageDisplay];
}

- (void)setImageUrl:(NSString *)urlString
{
    [self fetchImageUrl:urlString];
}

- (void)fetchImageUrl:(NSString *)urlString {
    dispatch_async(dispatch_get_global_queue(
                                             DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [NSData dataWithContentsOfURL:
                        url];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)data {
    
    // Create UI Image Here from the fetched data
    if (!data) {
        return;
    }
    [self.imageDisplay setImage:[UIImage imageWithData:data]];
    [self setNeedsDisplay];
}
@end
