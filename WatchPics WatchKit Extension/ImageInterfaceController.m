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
#import "OverlayRowController.h"

@interface ImageInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *background;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *nameLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *profileImage;
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;


@end


@implementation ImageInterfaceController {
    NSDate* _lastTouch;
    BOOL _liked;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSInteger index = [context integerValue];
    ImageInfo *imageInfo = [ImageStore imageInfoAtIndex:index];
    [self.background setBackgroundImage:imageInfo.image];
    [self.nameLabel setText:imageInfo.name];
    [self.profileImage setImage:imageInfo.profileImage];
    
    [self.table setNumberOfRows:1 withRowType:@"row"];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    OverlayRowController *rowController = [table rowControllerAtIndex:rowIndex];
    if (_lastTouch && [[NSDate date] timeIntervalSinceDate:_lastTouch] < 0.4) {
        _liked = !_liked;
        NSTimeInterval duration;
        if (_liked) {
            [rowController.icon setImageNamed:@"heart-"];
            duration = 3;
        } else {
            [rowController.icon setImageNamed:@"broken-"];
            duration = 2;
        }
        
        [rowController.icon setAlpha:1.0];
        NSRange range = {0,226};
        [rowController.icon startAnimatingWithImagesInRange:range duration:duration repeatCount:1];
    } else {
        [rowController.icon stopAnimating];
        [rowController.icon setAlpha:0.0];
    }
    _lastTouch = [NSDate date];
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



