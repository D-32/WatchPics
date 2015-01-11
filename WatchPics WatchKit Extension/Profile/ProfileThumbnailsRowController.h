//
//  ProfileThumbnailsRowController.h
//  WatchPics
//
//  Created by Dylan Marriott on 11/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface ProfileThumbnailsRowController : NSObject
@property (weak, nonatomic) IBOutlet WKInterfaceImage *img1;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *img2;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *img3;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *img4;

@end
