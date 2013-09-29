//
//  QZRecentViewController.m
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-27.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZRecentViewController.h"

@interface QZRecentViewController ()

@end

@implementation QZRecentViewController
@synthesize service;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setService:[[QZService alloc] init]];
        [[self service] setDelegator:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setReleases:[[NSMutableArray alloc] init]];
    [self setService:[[QZService alloc] initWithDelegator:self]];
    [[self service] setDelegator:self];

    [[self service] beginFetchLatestReleases:0];
}
- (void)didReceivedListOfReleases:(NSObject *)releases {
    
    [[self releases] addObjectsFromArray:(NSArray *)releases];
    [[self tableView] reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
