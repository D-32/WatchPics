//
//  ImageStore.h
//  WatchPics
//
//  Created by Dylan Marriott on 10/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageStore : NSObject

+ (void)addImage:(UIImage *)image;
+ (void)addImages:(NSArray *)images;
+ (UIImage *)imageAtIndex:(NSInteger)index;

@end
