//
//  QZRESTService.h
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-28.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QZInterface.h"
#import "QZResource.h"
@interface QZRESTService : QZInterface
- (NSArray *)latestReleases:(NSInteger)page;
- (NSArray *)releasesByTag:(NSString *)tag page:(NSInteger)page;
- (NSArray *)tags;
- (NSArray *)featured:(NSString *)type;
@end
