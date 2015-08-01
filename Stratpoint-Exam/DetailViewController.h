//
//  DetailViewController.h
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 7/29/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "ImageDisplayView.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic)  Movie *detailItem;
@property (weak, nonatomic) IBOutlet UITextView *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet ImageDisplayView *backdropImage;
@property (weak, nonatomic) IBOutlet ImageDisplayView *coverImage;

@end

