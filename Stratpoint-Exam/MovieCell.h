//
//  MovieCell.h
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 8/1/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDisplayView.h"
@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UIView *mainContent;
@property (weak, nonatomic) IBOutlet ImageDisplayView *backgroundImage;

@end
