//
//  ViewController.m
//  WatchPics
//
//  Created by Dylan Marriott on 10/01/15.
//  Copyright (c) 2015 Dylan Marriott. All rights reserved.
//

#import "ViewController.h"
#import <MMWormhole/MMWormhole.h>
#import <InstagramKit/InstagramKit.h>

@interface ViewController ()

@end

@implementation ViewController {
    MMWormhole *_wormhole;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.watchpics" optionalDirectory:@"wormhole"];
    
    [[InstagramEngine sharedEngineConfiguration] setValue:@"673cf1e8a82340798540a2b863a4ace8" forKey:@"InstagramKitAppClientId"];
    [[InstagramEngine sharedEngineConfiguration] setValue:@"watchpics://oauth" forKey:@"InstagramKitAppRedirectURL"];
    InstagramEngine *engine = [InstagramEngine sharedEngine];
    [engine loginWithBlock:^(NSError *error) {
        [_wormhole passMessageObject:@{@"accessToken" : engine.accessToken} identifier:@"oauth"];
    }];
}

@end
