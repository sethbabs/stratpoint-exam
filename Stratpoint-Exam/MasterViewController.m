//
//  MasterViewController.m
//  Stratpoint-Exam
//
//  Created by Seth Ephraim Mercadal on 7/29/15.
//  Copyright (c) 2015 Seth Ephraim Mercadal. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ImageDisplayView.h"
#import "MovieCell.h"
#import "Movie.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
//        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    // Set URLString
    NSString *urlString = @"https://dl.dropboxusercontent.com/u/5624850/movielist/list_movies_page1.json";
    [self fetchURLData:urlString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        // Process segue and call the detailview controller
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Movie *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Movie *object = self.objects[indexPath.row];
    cell.titleLabel.text = object.title;
    cell.yearLabel.text = [object.year stringValue];
    cell.backgroundImage.imageUrl = [object getBackdropUrl];
    
    return cell;
}

- (void)fetchURLData:(NSString *)urlString {
    if (self.objects) {
        // Clear all objects for a fresh load
        [self.objects removeAllObjects];
    }
    else {
        self.objects = [[NSMutableArray alloc] init];
    }
    dispatch_async(dispatch_get_global_queue(
                                             DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Load the Data from the url
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [NSData dataWithContentsOfURL:
                        url];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)data {
    // Parse JSON Data
    NSError* error;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:data //1
                          
                          options:kNilOptions
                          error:&error];
    if (json) {
        NSDictionary *dataDictionary = [json objectForKey:@"data"];
        if (dataDictionary) {
            NSArray *movies = [dataDictionary objectForKey:@"movies"];
            for (NSDictionary *movieJson in movies) {
                [self.objects addObject:[Movie movieWithJsonDict:movieJson]];
            }
        }
        [self.tableView reloadData];
        // Preload the first object for Ipads
        self.detailViewController.detailItem = self.objects.firstObject;
    }
    else{
        NSLog(@"Error:%@",[error localizedDescription]);
    }
}

@end
