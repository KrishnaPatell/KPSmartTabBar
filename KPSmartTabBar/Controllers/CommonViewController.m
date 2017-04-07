//
//  CommonViewController.m
//  SmartNews
//
//  Created by Yahya Bagia on 19/04/16.
//  Copyright © 2016 YahyaBagia. All rights reserved.
//

#import "CommonViewController.h"
#import "AppDelegate.h"
@interface CommonViewController ()

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lbl.text = self.title;
    
    if([self.title isEqualToString:@"+"])
    {
        _lbl.text=@"Add New Tab";
        _txtTab.hidden = NO;
        _btnAdd.hidden = NO;
    }
    else
    {
        _txtTab.hidden=YES;
        _btnAdd.hidden=YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnAdd:(id)sender
{
    [self saveUserTab];
    [_delegate refreshMe];
}

-(void)saveUserTab{
    NSMutableArray *tmp=[[[NSUserDefaults standardUserDefaults] objectForKey:@"arr"] mutableCopy];
    [tmp addObject:_txtTab.text];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"arr"];
    [[NSUserDefaults standardUserDefaults] setObject:tmp forKey:@"arr"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
