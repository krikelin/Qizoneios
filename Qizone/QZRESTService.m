//
//  QZRESTService.m
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-28.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZRESTService.h"

@implementation QZRESTService

- (NSArray *)featured:(NSString *)type {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:@"http://ws2.qizone.se/index.php/features/playlist.json"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSDictionary *publicTimeline = [NSJSONSerialization JSONObjectWithData:response
                                                                   options:0 error:&jsonParsingError];
    NSArray *_releases = [publicTimeline objectForKey:@"features"];
    NSMutableArray *releases = [[NSMutableArray alloc] init];
    for(int i = 0; i < [_releases count]; i++) {
        NSDictionary *release = [_releases objectAtIndex:i];
        QZResource *resource = [[QZResource alloc] initWithDictionary:release];
        [releases addObject:resource];
    }
    return releases;
}
- (NSArray *)latestReleases:(NSInteger)page {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:@"http://ws2.qizone.se/index.php/resources/playlist.json"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSDictionary *publicTimeline = [NSJSONSerialization JSONObjectWithData:response
                                                              options:0 error:&jsonParsingError];
    NSArray *_releases = [publicTimeline objectForKey:@"resources"];
    NSMutableArray *releases = [[NSMutableArray alloc] init];
    for(int i = 0; i < [_releases count]; i++) {
        NSDictionary *release = [_releases objectAtIndex:i];
        QZResource *resource = [[QZResource alloc] initWithDictionary:release];
        [releases addObject:resource];
    }
    return releases;
}
- (NSArray *)releasesByTag:(NSString *)tag page:(NSInteger)page{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:@"http://ws2.qizone.preview.citynetwork.se/index.php/resources/release.json?tag="]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSDictionary *publicTimeline = [NSJSONSerialization JSONObjectWithData:response
                                                                   options:0 error:&jsonParsingError];
    NSArray *_releases = [publicTimeline objectForKey:@"resources"];
    NSMutableArray *releases = [[NSMutableArray alloc] init];
    for(int i = 0; i < [_releases count]; i++) {
        NSDictionary *release = [_releases objectAtIndex:i];
        QZResource *resource = [[QZResource alloc] initWithDictionary:release];
        [releases addObject:resource];
    }
    return releases;
}
- (NSArray *)tags {
    return [NSArray arrayWithObjects:@"Ambient", "New Age", nil];
}
@end
