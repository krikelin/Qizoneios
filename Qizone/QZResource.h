//
//  QZResource.h
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-24.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QZResource : NSObject
@property (strong) NSString *name;
@property (strong) NSString *identifier;
@property (strong) NSString *description;
@property (strong) UIImage *image;
-(id)initWithDictionary:(NSDictionary *)dictionary;
-(void)setImageFromUrl:(NSString *)url;
@end
