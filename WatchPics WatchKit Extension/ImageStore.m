//
//  ImageStore.m
//  WatchPics
//
//  Created by Dylan Marriott on 10/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import "ImageStore.h"

static ImageStore *instance;

@implementation ImageStore {
    NSMutableArray *_images;
}

+ (ImageStore *)sharedStore {
    if (!instance) {
        instance = [[ImageStore alloc] init];
    }
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _images = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (void)addImageInfo:(ImageInfo *)imageInfo {
    [[self sharedStore] addImageInfo:imageInfo];
}

- (void)addImageInfo:(ImageInfo *)imageInfo {
    [_images addObject:imageInfo];
}

+ (id)imageInfoAtIndex:(NSInteger)index {
    return [[self sharedStore] imageInfoAtIndex:index];
}

- (id)imageInfoAtIndex:(NSInteger)index {
    if (index >= _images.count) {
        return nil;
    }
    return [_images objectAtIndex:index];
}

@end
