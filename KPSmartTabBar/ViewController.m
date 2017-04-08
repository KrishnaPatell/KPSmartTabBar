//
//  ViewController.m
//  KPSmartTabBar
//
//  Created by Krishna on 05/04/17.
//  Copyright © 2017 Krishna Patel. All rights reserved.
//

#import "ViewController.h"
#import "KPSmartTabBar.h"
#import "CommonViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<KPSmartTabBarDelegate,CommonProtocol>
{
    NSMutableArray *arrController,*arrTabes,*arrDColor,*arrColors, *arrImages, *arrTmpImg;
    NSInteger currentSelectedIndex;
}
@property (nonatomic) KPSmartTabBar *tabbar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setData{
    
    arrTabes = [NSMutableArray new];
    arrController = [NSMutableArray new];
    arrDColor = [NSMutableArray new];
    arrColors = [NSMutableArray new];
    arrImages = [NSMutableArray new];
    
    arrTmpImg = [[NSMutableArray alloc] initWithObjects:@"img1.jpg", @"img2.jpg", @"img3.jpg", @"img4.jpg", @"img5.jpg", nil];
    
    arrTabes=[self getUserTab];
    
    [arrDColor addObject:[UIColor colorWithRed:238.0/255.0 green:64.0/255.0 blue:53.0/255.0 alpha:1.0]];
    [arrDColor addObject:[UIColor colorWithRed:243.0/255.0 green:119.0/255.0 blue:54.0/255.0 alpha:1.0]];
    [arrDColor addObject:[UIColor colorWithRed:123.0/255.0 green:192.0/255.0 blue:67.0/255.0 alpha:1.0]];
    [arrDColor addObject:[UIColor colorWithRed:3.0/255.0 green:146.0/255.0 blue:207.0/255.0 alpha:1.0]];
    [arrDColor addObject:[UIColor colorWithRed:146.0/255.0 green:86.0/255.0 blue:223.0/255.0 alpha:1.0]];
    
    
    int j=0;
    for (int i=0; i<arrTabes.count; i++) {
        @try{
            [arrImages addObject:[arrTmpImg objectAtIndex:j]];
            [arrColors addObject:[arrDColor objectAtIndex:j]];
            j++;
            CommonViewController *controller=[[CommonViewController alloc] initWithNibName:@"CommonViewController" bundle:nil];
            controller.title=[arrTabes objectAtIndex:i]; //You Have To Assign This Property For Tab Title
            controller.delegate=self;
            [arrController addObject:controller];
        }
        @catch(NSException *ex){
            j=0;
            i--;
        }
    }
    
    [arrTabes addObject:@"+"];
    CommonViewController *controller=[[CommonViewController alloc] initWithNibName:@"CommonViewController" bundle:nil];
    controller.title=[arrTabes lastObject];
    controller.delegate=self;
    [arrController addObject:controller];
    [arrColors addObject:[UIColor lightGrayColor]];
    
    currentSelectedIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"SelectedOption"];
    if(currentSelectedIndex == 1)
        [self setSingleColorTab];
    else if(currentSelectedIndex == 2)
        [self setMultiColorTab];
    else if(currentSelectedIndex == 3)
        [self setInstagramTab];
    else
        [self setMultiColorTab];

}

-(void)setSingleColorTab{
    _viewNav.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:60.0/255.0 blue:138.0/255.0 alpha:1.0];
    
    NSDictionary *parameters = @{
                                 KPSmartTabBarOptionScrollMenuBackgroundColor: [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionViewBackgroundColor: [UIColor whiteColor],
                                 KPSmartTabBarOptionSelectionIndicatorColor: [UIColor colorWithRed:222.0/255.0 green:60.0/255.0 blue:138.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionBottomMenuHairlineColor: [UIColor colorWithRed:255.0/255.0 green:60.0/255.0 blue:138.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0],
                                 KPSmartTabBarOptionMenuItemSelectedFont: [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0],
                                 KPSmartTabBarOptionMenuHeight: @(40.0),
                                 KPSmartTabBarOptionMenuItemWidth: @(90.0),
                                 KPSmartTabBarOptionCenterMenuItems: @(YES),
                                 KPSmartTabBarOptionCenterMenuItems:@"YES",
                                 KPSmartTabBarOptionSelectedMenuItemLabelColor:[UIColor colorWithRed:255.0/255.0 green:60.0/255.0 blue:138.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionUnselectedMenuItemLabelColor :[UIColor whiteColor],
                                 KPSmartTabBarOptionMenuItemSeparatorWidth:@"0.0",
                                 KPSmartTabBarOptionMenuMargin:@"0.0",
                                 KPSmartTabBarOptionMenuItemSeparatorRoundEdges:@"YES",
                                 KPSmartTabBarOptionEnableHorizontalBounce:@"NO",
                                 KPSmartTabBarOptionAddBottomMenuHairline:@"YES",
                                 KPSmartTabBarOptionSelectionIndicatorHeight:@"0.0"
                                 };
    
    _tabbar = [[KPSmartTabBar alloc] initWithViewControllers:arrController frame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [self.view addSubview:_tabbar.view];
}

-(void)setMultiColorTab{
    _viewNav.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:60.0/255.0 blue:138.0/255.0 alpha:1.0];
    NSDictionary *parameters = @{
                                 KPSmartTabBarOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0],
                                 KPSmartTabBarOptionMenuItemSelectedFont: [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0],
                                 KPSmartTabBarOptionMenuHeight: @(40.0),
                                 KPSmartTabBarOptionMenuItemWidth: @(90.0),
                                 KPSmartTabBarOptionCenterMenuItems: @(YES),
                                 KPSmartTabBarOptionCenterMenuItems:@(YES),
                                 KPSmartTabBarOptionSelectedMenuItemLabelColor:[UIColor whiteColor],
                                 KPSmartTabBarOptionUnselectedMenuItemLabelColor :[UIColor whiteColor],
                                 KPSmartTabBarOptionMenuItemSeparatorWidth:@(0.0),
                                 KPSmartTabBarOptionMenuMargin:@(0.0),
                                 KPSmartTabBarOptionMenuItemSeparatorRoundEdges:@(YES),
                                 KPSmartTabBarOptionEnableHorizontalBounce:@(NO),
                                 KPSmartTabBarOptionAddBottomMenuHairline:@(YES),
                                 KPSmartTabBarOptionSelectionIndicatorHeight:@(0.0)
                                 };
    
     _tabbar = [[KPSmartTabBar alloc] initWithViewControllers:arrController frame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters colors:arrColors];
    [self.view addSubview:_tabbar.view];
}

-(void)setInstagramTab{
    
    _viewNav.backgroundColor = [UIColor colorWithRed:13.0/255.0 green:63.0/255.0 blue:108.0/255.0 alpha:1.0];
    
    NSMutableArray *arrControllers = [NSMutableArray new];
    CommonViewController *controller1=[[CommonViewController alloc] initWithNibName:@"CommonViewController" bundle:nil];
    controller1.title= @"Following";
    controller1.delegate=self;
    [arrControllers addObject:controller1];
    
    CommonViewController *controller2=[[CommonViewController alloc] initWithNibName:@"CommonViewController" bundle:nil];
    controller2.title=@"Followers";
    controller2.delegate=self;
    [arrControllers addObject:controller2];
    
    NSDictionary *parameters = @{
                                 KPSmartTabBarOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0],
                                 KPSmartTabBarOptionMenuItemSelectedFont: [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0],
                                 KPSmartTabBarOptionMenuItemSeparatorWidth : @(4.3),
                                 KPSmartTabBarOptionMenuItemSeparatorColor : [UIColor lightGrayColor],
                                 KPSmartTabBarOptionScrollMenuBackgroundColor : [UIColor whiteColor],
                                 KPSmartTabBarOptionViewBackgroundColor : [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionSelectionIndicatorColor : [UIColor colorWithRed:8.0/255.0 green:150.0/255.0 blue:225.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionMenuMargin:@(20.0),
                                 KPSmartTabBarOptionMenuHeight: @(40.0),
                                 KPSmartTabBarOptionSelectedMenuItemLabelColor:[UIColor colorWithRed:8.0/255.0 green:150.0/255.0 blue:225.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionUnselectedMenuItemLabelColor :[UIColor colorWithRed:40.0/255.0 green:40.0/255.0 blue:45.0/255.0 alpha:1.0],
                                 KPSmartTabBarOptionCenterMenuItems: @(YES),
                                 KPSmartTabBarOptionUseMenuLikeSegmentedControl : @(YES),
                                 KPSmartTabBarOptionMenuItemSeparatorRoundEdges:@(YES),
                                 KPSmartTabBarOptionEnableHorizontalBounce:@(NO),
                                 KPSmartTabBarOptionMenuItemSeparatorPercentageHeight:@(0.1),
                                 KPSmartTabBarOptionSelectionIndicatorHeight:@(2.0),
                                 KPSmartTabBarOptionAddBottomMenuHairline : @(YES),
                                 KPSmartTabBarOptionBottomMenuHairlineHeight : @(1.0),
                                 KPSmartTabBarOptionBottomMenuHairlineColor : [UIColor lightGrayColor]
                                 };
    
    _tabbar = [[KPSmartTabBar alloc] initWithViewControllers:arrControllers frame:CGRectMake(0.0, 64.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [self.view addSubview:_tabbar.view];
}

-(void)refreshMe{
    [self viewDidLoad];
    [_tabbar moveToPage:arrTabes.count-2];
}

-(NSMutableArray *)getUserTab{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"arr"] mutableCopy];
}

-(void)willMoveToPage:(UIViewController *)controller index:(NSInteger)index{
    NSLog(@"Called");
}

#pragma mark - segment click
-(IBAction)btnOptionClick:(id)sender{
    
    UIAlertController* actionSheet = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Default (Single Color)" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        currentSelectedIndex = 1;
        [self setSingleColorTab];
        [[NSUserDefaults standardUserDefaults] setInteger:currentSelectedIndex forKey:@"SelectedOption"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Multi Color" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        currentSelectedIndex = 2;
         [self setMultiColorTab];
         [[NSUserDefaults standardUserDefaults] setInteger:currentSelectedIndex forKey:@"SelectedOption"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Instagram" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        currentSelectedIndex = 3;
        [self setInstagramTab];
        [[NSUserDefaults standardUserDefaults] setInteger:currentSelectedIndex forKey:@"SelectedOption"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
          [[NSUserDefaults standardUserDefaults] setInteger:currentSelectedIndex forKey:@"SelectedOption"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];
  
}

@end
