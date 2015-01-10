//
//  InterfaceController.m
//  WatchPics WatchKit Extension
//
//  Created by Dylan Marriott on 10/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import "InterfaceController.h"
#import <MMWormhole/MMWormhole.h>
#import <InstagramKit/InstagramKit.h>
#import "ImageStore.h"

@interface InterfaceController()

@end


@implementation InterfaceController {
    MMWormhole *_wormhole;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    _wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.watchpics" optionalDirectory:@"wormhole"];
    NSString *accessToken = [[_wormhole messageWithIdentifier:@"oauth"] objectForKey:@"accessToken"];
    
    [[InstagramEngine sharedEngineConfiguration] setValue:@"673cf1e8a82340798540a2b863a4ace8" forKey:@"InstagramKitAppClientId"];
    [[InstagramEngine sharedEngineConfiguration] setValue:@"watchpics://oauth" forKey:@"InstagramKitAppRedirectURL"];
    InstagramEngine *engine = [InstagramEngine sharedEngine];
    engine.accessToken = accessToken;
    
    [engine getSelfFeedWithCount:20 maxId:nil success:^(NSArray *media, InstagramPaginationInfo *paginationInfo) {
        for (InstagramMedia *mediaItem in media) {

            ImageInfo *imageInfo = [[ImageInfo alloc] init];
            imageInfo.image = [self downloadImage:mediaItem.lowResolutionImageURL];
            imageInfo.name = mediaItem.user.username;
            imageInfo.profileImage = [self downloadImage:mediaItem.user.profilePictureURL];
            [ImageStore addImageInfo:imageInfo];
        }
        
        NSMutableArray *names = [NSMutableArray array];
        NSMutableArray *contexts = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            [names addObject:@"imageController"];
            [contexts addObject:[NSNumber numberWithInt:i]];
        }
        
        [WKInterfaceController reloadRootControllersWithNames:names contexts:contexts];
    } failure:^(NSError *error) {
        NSLog(@"");
    }];
}

- (UIImage *)downloadImage:(NSURL *)url {
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [[UIImage alloc] initWithData:data];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

@end



