//
//  ClockViewController.m
//  SimpleClock
//
//  Created by VA Gautham  on 9/3/14.
//  Copyright (c) 2014 Gautham. All rights reserved.
//

#import "ClockViewController.h"
#import "TimezoneViewController.h"
#import "AppDelegate.h"

@interface ClockViewController ()

@end

@implementation ClockViewController
@synthesize lbl_Clock;
@synthesize lbl_Calander;
@synthesize btn_ChangeTimezone;
@synthesize lbl_Timezone;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    btn_ChangeTimezone.layer.borderWidth = 1;
    btn_ChangeTimezone.layer.borderColor = [UIColor whiteColor].CGColor;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateClock];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(updateClock) object:nil];
}

-(void)updateClock
{
    NSString *timeZoneName = [self getAppDelegateInstance].currentTimezoneName; //set here the timezone you want
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:timeZoneName];
    
    [lbl_Timezone setText:timeZoneName];

    NSDateFormatter *tf = [[[NSDateFormatter alloc] init] autorelease];
    [tf setTimeZone:timeZone];
    [tf setDateFormat:@"hh:mm:ss a"];
    [lbl_Clock setText:[tf stringFromDate:[NSDate date]]];
    
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setTimeZone:timeZone];
    [df setDateFormat:@"yyyy-MM-dd"];
    [lbl_Calander setText:[df stringFromDate:[NSDate date]]];
    
    [self performSelector:@selector(updateClock) withObject:nil afterDelay:1.0];
}

-(IBAction)onChangeTimezone:(id)sender
{
    TimezoneViewController *mTimezoneViewController = [[TimezoneViewController alloc] initWithNibName:@"TimezoneViewController" bundle:nil];
    
    NSString *deviceType = [[self getAppDelegateInstance] getDeviceType];
    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"])
    {
        if (_timezonePopover == nil) {
            //The color picker popover is not showing. Show it.
            _timezonePopover = [[UIPopoverController alloc] initWithContentViewController:mTimezoneViewController];
            [_timezonePopover setDelegate:self];
            [_timezonePopover presentPopoverFromRect:btn_ChangeTimezone.bounds
                                              inView:btn_ChangeTimezone
                            permittedArrowDirections:UIPopoverArrowDirectionAny
                                            animated:YES];
        }
        else {
            //The color picker popover is showing. Hide it.
            [_timezonePopover dismissPopoverAnimated:YES];
        }
    }
    else
    {
        [self presentViewController:mTimezoneViewController animated:YES completion:nil];
    }
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    _timezonePopover = nil;
    return TRUE;
}

-(BOOL)prefersStatusBarHidden
{
    return TRUE;
}

- (AppDelegate *)getAppDelegateInstance
{
    return ((AppDelegate *) [UIApplication sharedApplication].delegate);
}

-(void)dealloc
{
    [super dealloc];
    
    if(lbl_Timezone)
    {
        [lbl_Timezone release];
        lbl_Timezone = nil;
    }
    if(lbl_Clock)
    {
        [lbl_Clock release];
        lbl_Clock = nil;
    }
    if(lbl_Calander)
    {
        [lbl_Calander release];
        lbl_Calander = nil;
    }
    if(btn_ChangeTimezone)
    {
        [btn_ChangeTimezone release];
        btn_ChangeTimezone = nil;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
