//
//  Movie.m
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 7/30/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import "Movie.h"

@implementation Movie
- (instancetype)init {
    self = [super init];
    if (self) {
        self.rating = 0;
        self.movieId = 0;
        self.runtime = 0;
    }
    return self;
}

- (NSString *)getBackdropUrl {
    // Create the Backdrop URL from the spec
    return [NSString stringWithFormat:@"https://dl.dropboxusercontent.com/u/5624850/movielist/images/​%@​-backdrop.jpg", self.slug];
    // TestValue
//    return @"http://screenrant.com/wp-content/uploads/deadpool-movie-filming-locations.jpg";
}

- (NSString *)getCoverUrl {
    // Create the Cover URL from the spec
    return [NSString stringWithFormat:@"https://dl.dropboxusercontent.com/u/5624850/movielist/images/​%@-cover.jpg", self.slug];
    // Test value
//    return @"http://img08.deviantart.net/d0ac/i/2010/227/3/b/deadpool_cover_by_mufc10.jpg";
}

+ (Movie *)movieWithJsonDict:(NSDictionary *)json {
    
    if(!json) {
        return nil;
    }
    // Parse the JSON and store the values
    Movie *movie = [[Movie alloc] init];
    movie.rating = [json objectForKey:@"rating"];
    movie.movieId = [json objectForKey:@"id"];
    movie.runtime = [json objectForKey:@"runtime"];
    movie.year = [json objectForKey:@"year"];
    movie.genre = [json objectForKey:@"genre"];
    movie.title = [json objectForKey:@"title"];
    movie.longTitle = [json objectForKey:@"title_long"];
    movie.language = [json objectForKey:@"language"];
    movie.url = [json objectForKey:@"url"];
    movie.imdbCode = [json objectForKey:@"imdb_code"];
    movie.state = [json objectForKey:@"state"];
    movie.overview = [json objectForKey:@"overview"];
    movie.slug = [json objectForKey:@"slug"];
    movie.mpaRating = [json objectForKey:@"mpa_rating"];
    
    return movie;
}

@end
