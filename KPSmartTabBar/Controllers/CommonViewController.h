//
//  CommonViewController.h
//  SmartNews
//
//  Created by Yahya Bagia on 19/04/16.
//  Copyright © 2016 YahyaBagia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommonProtocol;

@interface CommonViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *lbl;
@property (nonatomic, weak) IBOutlet UITextField *txtTab;
@property (nonatomic, weak) IBOutlet UIButton *btnAdd;
@property(strong,nonatomic) id<CommonProtocol> delegate;

-(IBAction)btnAdd:(id)sender;

@end

@protocol CommonProtocol
-(void)refreshMe;
@end
