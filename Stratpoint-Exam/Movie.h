//
//  Movie.h
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 7/30/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong,nonatomic) NSNumber *rating;
@property (strong,nonatomic) NSNumber *movieId;
@property (strong,nonatomic) NSNumber *runtime;
@property (strong,nonatomic) NSNumber *year;
@property (strong,nonatomic) NSArray *genre;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *longTitle;
@property (strong,nonatomic) NSString *language;
@property (strong,nonatomic) NSString *url;
@property (strong,nonatomic) NSString *imdbCode;
@property (strong,nonatomic) NSString *state;
@property (strong,nonatomic) NSString *overview;
@property (strong,nonatomic) NSString *slug;
@property (strong,nonatomic) NSString *mpaRating;

- (NSString *)getCoverUrl;
- (NSString *)getBackdropUrl;
+ (Movie *)movieWithJsonDict:(NSDictionary *)json;

@end
