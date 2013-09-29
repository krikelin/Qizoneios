//
//  QZResourceCarousel.m
//  Qizone
//
//  Created by Alexander Forselius on 2013-09-29.
//  Copyright (c) 2013 Qizone. All rights reserved.
//

#import "QZResourceCarousel.h"

@implementation QZResourceCarousel
@synthesize resources;
@synthesize imageWidth;
@synthesize imageHeight;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setResources:[[NSMutableArray alloc] init]];
    }
    return self;

}
- (void)didReceivedListOfReleases:(NSObject *)releases {
    if ([self resources] == nil) {
        [self setResources:[[NSMutableArray alloc]init]];
    }
    [self setDelegate:self];
    [self setDataSource:self];
    [self
     setUserInteractionEnabled:YES];
    [[self resources] addObjectsFromArray:(NSArray *)releases];
    [self reloadData];

}
- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //limit the number of items views loaded concurrently (for performance reasons)
    return 7;
}
- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 0;
}
- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return YES  ;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel {
    return [self imageHeight];
}
- (NSUInteger)numberOfVisibleItemsInCarousel {
     return [[self resources] count];
}
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return [[self resources] count];
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view {
    if(view == nil) {
        view = [[UIImageView alloc] init];
    
    }
    QZResource *resource = [[self resources] objectAtIndex:index];
    UIImageView *imageView = (UIImageView *)view;
    [imageView setImage:[resource image]];
    [imageView setBounds:CGRectMake(0, 0, [self imageWidth], [self imageHeight])];
    [imageView setUserInteractionEnabled:NO];
    return view;
}
- (void)carouselDidEndScrollingAnimation:(iCarousel *)aCarousel
{
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
