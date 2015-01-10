//
//  ImageInterfaceController.m
//  WatchPics
//
//  Created by Dylan Marriott on 10/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import "ImageInterfaceController.h"
#import "ImageStore.h"
#import "ImageInfo.h"

@interface ImageInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *background;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *nameLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *profileImage;


@end


@implementation ImageInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSInteger index = [context integerValue];
    ImageInfo *imageInfo = [ImageStore imageInfoAtIndex:index];
    [self.background setBackgroundImage:imageInfo.image];
    [self.nameLabel setText:imageInfo.name];
    [self.profileImage setImage:imageInfo.profileImage];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



