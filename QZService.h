//
//  QZService.h
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-27.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QZDelegate.h"
#import "QZRESTService.h"
#import "QZService.h"
#import "QZRequest.h"
#import "QZInterface.h"
@interface QZService : NSObject
@property QZInterface *qizone;
@property id<QZDelegate> delegator;
- (id)initWithDelegator:(id<QZDelegate>)delegator;
- (void)beginFetchLatestReleases:(NSInteger)page;
- (void)beginFetchReleasesForTag:(NSString *)tag page:(NSInteger)page;
- (void)fetchFeatured:(QZRequest *)request;
- (void)beginFetchFeatured:(NSString *)type page:(NSInteger)page;
@end
