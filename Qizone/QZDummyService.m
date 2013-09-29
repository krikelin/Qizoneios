//
//  QZDummyService.m
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-24.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZDummyService.h"


@implementation QZDummyService : QZInterface
- (NSArray *)latestReleases:(NSInteger)page {
    sleep(1);
    QZRelease *release = [[QZRelease alloc] init];
    [release setIdentifier:@"spotify:user:drsounds:playlist:03YXQVTICl8iO5baAwbVAB‎"];
    [release setName:@"30 Grader i Februari"];
    NSArray *result = [NSArray arrayWithObject:release];
    return result;
}
- (NSArray *)releasesByTag:(NSString *)tag page:(NSInteger)page {
    sleep(1);
    QZRelease *release = [[QZRelease alloc] init];
    [release setIdentifier:@"spotify:user:drsounds:playlist:03YXQVTICl8iO5baAwbVAB‎"];
    [release setName:@"30 Grader i Februari"];
    NSArray *result = [NSArray arrayWithObject:release];
    return result;

}

- (NSArray *)tags {
    sleep(10);
    NSArray *tags = @[@"ambient", @"goa", @"meditative"];
    return tags;
}
@end
