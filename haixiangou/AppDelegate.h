//
//  AppDelegate.h
//  haixiangou
//
//  Created by 博睿精实 on 2016/12/29.
//  Copyright © 2016年 博睿精实. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

