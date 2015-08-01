//
//  ImageDisplayView.h
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 7/30/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDisplayView : UIView
@property (strong,nonatomic) UIImageView *imageDisplay;
- (void)setImageUrl:(NSString *)urlString;
@end
