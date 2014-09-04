//
//  TimezoneViewController.m
//  SimpleClock
//
//  Created by VA Gautham  on 9/4/14.
//  Copyright (c) 2014 Gautham. All rights reserved.
//

#import "TimezoneViewController.h"
#import "AppDelegate.h"

@interface TimezoneViewController ()

@end

@implementation TimezoneViewController
@synthesize tbl_Timezone;
@synthesize btn_Back;

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
   
    btn_Back.layer.borderWidth = 1;
    btn_Back.layer.borderColor = [UIColor whiteColor].CGColor;
    
    tbl_Timezone.layer.borderWidth = 1;
    tbl_Timezone.layer.borderColor = [UIColor whiteColor].CGColor;
    
    NSString *deviceType = [[self getAppDelegateInstance] getDeviceType];
    
    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"])
        [btn_Back setHidden:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[NSTimeZone knownTimeZoneNames] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"timezoneTableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.textLabel.text = [[NSTimeZone knownTimeZoneNames] objectAtIndex:indexPath.row];
    
    if ([[self getAppDelegateInstance].currentTimezoneName isEqualToString:[[NSTimeZone knownTimeZoneNames] objectAtIndex:indexPath.row]])
        [cell.textLabel setTextColor:[UIColor colorWithRed:(135.0/255.0) green:(206.0/255.0) blue:(250.0/255.0) alpha:1.0]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self getAppDelegateInstance].currentTimezoneName = [[NSTimeZone knownTimeZoneNames] objectAtIndex:indexPath.row];
    [tableView reloadData];
}

-(IBAction)onBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    if (tbl_Timezone)
    {
        [tbl_Timezone release];
        tbl_Timezone = nil;
    }
    if (btn_Back)
    {
        [btn_Back release];
        btn_Back = nil;
    }
    
}
@end
