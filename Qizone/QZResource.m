//
//  QZResource.m
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-24.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZResource.h"

@implementation QZResource
@synthesize name;
@synthesize identifier;
@synthesize image;
@synthesize description;
-(id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setName:[dictionary valueForKey:@"title"]];
        [self setImageFromUrl:[dictionary valueForKey: @"image"]];
        [self setIdentifier:[dictionary valueForKey:@"identifier"]];
        [self setDescription:[dictionary valueForKey:@"description"]];
        // Download image
    }
    return self;
}
-(void)setImageFromUrl:(NSString *)url {
    NSString *ImageURL = url;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    [self setImage: [UIImage imageWithData:imageData]];
}
@end
