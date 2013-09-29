//
//  QZReleaseTableViewController.h
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-27.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QZDelegate.h"
#import "QZRelease.h"
#import "QZDummyService.h"
@protocol QZDelegate;
@interface QZReleaseTableViewController : UITableViewController <QZDelegate>
@property NSMutableArray *releases;
@end
