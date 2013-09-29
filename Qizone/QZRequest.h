//
//  QZRequest.h
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-27.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QZRequest : NSObject
@property NSString *tag;
@property NSString *type;
@property NSString *query;
@property NSInteger page;
@end
