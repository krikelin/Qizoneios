//
//  QZService.m
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-27.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZService.h"

@implementation QZService
@synthesize delegator;
@synthesize qizone;
- (id)initWithDelegator:(id<QZDelegate>)delegator {
    if (self = [super init]) {
        self.delegator = delegator;
        self.qizone = [[QZRESTService alloc] init];
    }
    return self;
}
- (void)fetchFeatured:(QZRequest *)request {
    NSArray *result = [[self qizone] featured:@"playlist"];
    [self performSelectorOnMainThread:@selector(didReceivedFeatured:) withObject:result waitUntilDone:YES];
}
- (void)fetchLatestReleases:(QZRequest *)request {
    NSArray *result = [[self qizone] latestReleases:[request page]];
    [self performSelectorOnMainThread:@selector(didReceivedResource:) withObject:result waitUntilDone:YES];
}
- (void)didReceivedFeatured:(NSObject *)result{
    [[self delegator]didReceivedListOfReleases:result];
}
- (void)didReceivedResource:(NSObject *)resource {
    [[self delegator] didReceivedListOfReleases:resource];
}
- (void)beginFetchFeatured:(NSString *)type page:(NSInteger)page {
    QZRequest *request = [[QZRequest alloc] init];
    [request setPage:page];
    [request setType:type];
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(fetchFeatured:) object:request];
    [thread start];
}
- (void)beginFetchLatestReleases:(NSInteger)page {
    QZRequest *request = [[QZRequest alloc] init];
    [request setPage:page];
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(fetchLatestReleases:) object:request];
    [thread start];
}
- (void)beginFetchReleasesForTag:(NSInteger)page tag:(NSString *)tag {
    
}
@end
