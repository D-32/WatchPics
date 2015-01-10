//
//  ImageStore.h
//  WatchPics
//
//  Created by Dylan Marriott on 10/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageInfo.h"

@interface ImageStore : NSObject

+ (void)addImageInfo:(ImageInfo *)imageInfo;
+ (ImageInfo *)imageInfoAtIndex:(NSInteger)index;

@end
