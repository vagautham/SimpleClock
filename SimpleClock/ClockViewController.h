//
//  ClockViewController.h
//  SimpleClock
//
//  Created by VA Gautham  on 9/3/14.
//  Copyright (c) 2014 Gautham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockViewController : UIViewController<UIPopoverControllerDelegate>
{
    IBOutlet UILabel *lbl_Timezone;
    IBOutlet UILabel *lbl_Clock;
    IBOutlet UILabel *lbl_Calander;
    IBOutlet UIButton *btn_ChangeTimezone;

}

@property(nonatomic, retain) UILabel *lbl_Timezone;
@property(nonatomic, retain) UILabel *lbl_Clock;
@property(nonatomic, retain) UILabel *lbl_Calander;
@property(nonatomic, retain) UIButton *btn_ChangeTimezone;

@property (nonatomic, strong) UIPopoverController *timezonePopover;

-(void)updateClock;

-(IBAction)onChangeTimezone:(id)sender;

@end
