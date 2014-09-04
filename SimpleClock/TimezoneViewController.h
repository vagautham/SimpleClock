//
//  TimezoneViewController.h
//  SimpleClock
//
//  Created by VA Gautham  on 9/4/14.
//  Copyright (c) 2014 Gautham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimezoneViewController : UIViewController<UITabBarDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tbl_Timezone;
    IBOutlet UIButton *btn_Back;
}

@property(nonatomic, retain) UITableView *tbl_Timezone;
@property(nonatomic, retain) UIButton *btn_Back;

-(IBAction)onBack:(id)sender;

@end
