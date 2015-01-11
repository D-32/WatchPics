//
//  NSArray+WatchPics.m
//  WatchPics
//
//  Created by Dylan Marriott on 11/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import "NSArray+WatchPics.h"

@implementation NSArray (WatchPics)

- (id)objectAtIndexOrNil:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}

@end
