//
//  QZResourceCarousel.h
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-29.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "iCarousel.h"
#import "QZResource.h"
#import "QZDelegate.h"
@interface QZResourceCarousel : iCarousel <iCarouselDataSource, iCarouselDelegate, QZDelegate>
@property NSInteger imageWidth;
@property NSInteger imageHeight;
@property (nonatomic, retain) NSMutableArray *resources;
@end
