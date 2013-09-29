//
//  QZCategoryViewController.m
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-29.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZCategoryViewController.h"
#import "QZResourceCarousel.h"
@interface QZCategoryViewController ()

@property (weak, nonatomic) IBOutlet QZResourceCarousel *featuredView;
@property (weak, nonatomic) IBOutlet QZResourceCarousel *bigFeaturedView;

@end

@implementation QZCategoryViewController
@synthesize service;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self featuredView] setImageHeight:130];
    [[self featuredView] setImageWidth:130];
    [[self featuredView] setType:iCarouselTypeCoverFlow2];
    [[self bigFeaturedView] setImageHeight:258];
    [[self bigFeaturedView] setImageWidth:368];
    [self setService:[[QZService alloc] initWithDelegator:[self featuredView]]];
    [[self service] setDelegator:[self featuredView]];
    
    [[self service] beginFetchLatestReleases:0];
    
    QZService *fs = [[QZService alloc]initWithDelegator:[self bigFeaturedView]];
    [fs beginFetchFeatured:@"playlist" page:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
