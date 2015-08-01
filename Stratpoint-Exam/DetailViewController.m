//
//  DetailViewController.m
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 7/29/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        // Fill up Labels and Images
        self.detailDescriptionLabel.text = self.detailItem.overview;
        self.titleLabel.text = self.detailItem.title;
        self.yearLabel.text = [self.detailItem.year stringValue];
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setPositiveFormat:@"##,##,###.#"];
        self.ratingLabel.text = [numberFormatter stringFromNumber:self.detailItem.rating];
        self.coverImage.imageUrl = [self.detailItem getCoverUrl];
        self.backdropImage.imageUrl = [self.detailItem getBackdropUrl];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
