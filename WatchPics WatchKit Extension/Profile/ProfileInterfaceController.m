//
//  ProfileInterfaceController.m
//  WatchPics
//
//  Created by Dylan Marriott on 11/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import "ProfileInterfaceController.h"
#import "ImageInfo.h"
#import "ProfileThumbnailsRowController.h"
#import "NSArray+WatchPics.h"

@interface ProfileInterfaceController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *nameLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *icon;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *followersLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *followingLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@end

@implementation ProfileInterfaceController {
    NSMutableArray *_thumbs;
    NSMutableArray *_images;
}

- (void)awakeWithContext:(id)context {
    _thumbs = [NSMutableArray array];
    _images = [NSMutableArray array];
    ImageInfo *imageInfo = context;
    [self.table setRowTypes:@[@"ProfileHeader", @"Thumbnails"]];
    [self.nameLabel setText:imageInfo.user.username];
    [self.icon setImage:imageInfo.profileImage];
    
    [[InstagramEngine sharedEngine] getUserDetails:imageInfo.user withSuccess:^(InstagramUser *superUser) {
        [self.followersLabel setText:[NSString stringWithFormat:@"%li", superUser.followedByCount]];
        [self.followingLabel setText:[NSString stringWithFormat:@"%li", superUser.followsCount]];
    } failure:^(NSError *error) {
    }];
    
    [[InstagramEngine sharedEngine] getMediaForUser:imageInfo.user.Id count:32 maxId:nil withSuccess:^(NSArray *media, InstagramPaginationInfo *paginationInfo) {
        
        for (InstagramMedia *mediaItem in media) {
            UIImage *thumbnail = [self downloadImage:mediaItem.thumbnailURL];
            if (thumbnail) {
                [_thumbs addObject:thumbnail];
            }
//            UIImage *image = [self downloadImage:mediaItem.standardResolutionImageURL];
//            if (image) {
//                [_images addObject:image];
//            }
        }
        
        NSInteger rows = ceil(_thumbs.count / 4.f);
        [self.table setNumberOfRows:rows withRowType:@"Thumbnails"];
        int i = 0;
        for (int row = 0; row < rows; row++) {
            ProfileThumbnailsRowController *thumbnailsRowController = [self.table rowControllerAtIndex:row];
            [thumbnailsRowController.img1 setImage:[_thumbs objectAtIndexOrNil:i++]];
            [thumbnailsRowController.img2 setImage:[_thumbs objectAtIndexOrNil:i++]];
            [thumbnailsRowController.img3 setImage:[_thumbs objectAtIndexOrNil:i++]];
            [thumbnailsRowController.img4 setImage:[_thumbs objectAtIndexOrNil:i++]];
        }
        
    } failure:^(NSError *error) {
    }];
}

// yay, duplicate code
- (UIImage *)downloadImage:(NSURL *)url {
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [[UIImage alloc] initWithData:data];
}

@end
