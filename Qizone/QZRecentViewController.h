//
//  QZRecentViewController.h
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-27.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZReleaseTableViewController.h"
#import "QZService.h"
@interface QZRecentViewController : QZReleaseTableViewController
@property QZService *service;
- (void)viewDidLoad;
@end
