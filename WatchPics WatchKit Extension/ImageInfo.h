//
//  ImageInfo.h
//  WatchPics
//
//  Created by Dylan Marriott on 10/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <InstagramKit/InstagramKit.h>

@interface ImageInfo : NSObject

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *profileImage;
@property (nonatomic, retain) InstagramUser *user;

@end
