//
//  AppDelegate.h
//  SimpleClock
//
//  Created by VA Gautham  on 9/3/14.
//  Copyright (c) 2014 Gautham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController  *navigationController;
@property (strong, nonatomic) NSString *currentTimezoneName;

-(NSString *)getDeviceType;

@end
