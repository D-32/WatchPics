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

+ (void)addImage:(UIImage *)image {
    [[self sharedStore] addImage:image];
}

- (void)addImage:(UIImage *)image {
    [_images addObject:image];
}

+ (void)addImages:(NSArray *)images {
    [[self sharedStore] addImages:images];
}

- (void)addImages:(NSArray *)images {
    [_images addObjectsFromArray:images];
}

+ (id)imageAtIndex:(NSInteger)index {
    return [[self sharedStore] imageAtIndex:index];
}

- (id)imageAtIndex:(NSInteger)index {
    if (index >= _images.count) {
        return nil;
    }
    return [_images objectAtIndex:index];
}

@end
