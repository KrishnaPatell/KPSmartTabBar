//
//  KPSmartTabBar.h
//  KPSmartTabBar
//
//  Created by Krishna on 05/04/17.
//  Copyright © 2017 Krishna Patel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KPSmartTabBar;

#pragma mark - Delegate functions
@protocol KPSmartTabBarDelegate <NSObject>

@optional
- (void)willMoveToPage:(UIViewController *)controller index:(NSInteger)index;
- (void)didMoveToPage:(UIViewController *)controller index:(NSInteger)index;
@end

#pragma mark - Menu Item View

@interface MenuItemView : UIView

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UIView *menuItemSeparator;

- (void)setUpMenuItemView:(CGFloat)menuItemWidth menuScrollViewHeight:(CGFloat)menuScrollViewHeight indicatorHeight:(CGFloat)indicatorHeight separatorPercentageHeight:(CGFloat)separatorPercentageHeight separatorWidth:(CGFloat)separatorWidth separatorRoundEdges:(BOOL)separatorRoundEdges menuItemSeparatorColor:(UIColor *)menuItemSeparatorColor;

- (void)setTitleText:(NSString *)text;

@end

@interface KPSmartTabBar : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScrollView *menuScrollView;
@property (nonatomic, strong) UIScrollView *controllerScrollView;

@property (nonatomic, readonly) NSArray *controllerArray;
@property (nonatomic, readonly) NSArray *menuItems;
@property (nonatomic, readonly) NSArray *menuItemWidths;
@property (nonatomic, readonly) NSArray *menuItemsColor;

@property (nonatomic) NSInteger currentPageIndex;
@property (nonatomic) NSInteger lastPageIndex;

@property (nonatomic) CGFloat menuHeight;
@property (nonatomic) CGFloat menuMargin;
@property (nonatomic) CGFloat menuItemWidth;
@property (nonatomic) CGFloat selectionIndicatorHeight;
@property (nonatomic) NSInteger scrollAnimationDurationOnMenuItemTap;

@property (nonatomic) UIColor *selectionIndicatorColor;
@property (nonatomic) UIColor *selectedMenuItemLabelColor;
@property (nonatomic) UIColor *unselectedMenuItemLabelColor;
@property (nonatomic) UIColor *scrollMenuBackgroundColor;
@property (nonatomic) UIColor *viewBackgroundColor;
@property (nonatomic) UIColor *bottomMenuHairlineColor;
@property (nonatomic) UIColor *menuItemSeparatorColor;

@property (nonatomic) UIFont *menuItemFont;
@property (nonatomic) UIFont *menuItemSelectedFont;
@property (nonatomic) CGFloat menuItemSeparatorPercentageHeight;
@property (nonatomic) CGFloat menuItemSeparatorWidth;
@property (nonatomic) CGFloat bottomHairlineHeight;
@property (nonatomic) BOOL menuItemSeparatorRoundEdges;

@property (nonatomic) BOOL addBottomMenuHairline;
@property (nonatomic) BOOL menuItemWidthBasedOnTitleTextWidth;
@property (nonatomic) BOOL useMenuLikeSegmentedControl;
@property (nonatomic) BOOL centerMenuItems;
@property (nonatomic) BOOL enableHorizontalBounce;
@property (nonatomic) BOOL hideTopMenuBar;
//my
@property (nonatomic) NSArray *arrMenuItemColors;

@property (nonatomic, weak) id <KPSmartTabBarDelegate> delegate;

- (void)addPageAtIndex:(NSInteger)index;
- (void)moveToPage:(NSInteger)index;

- (instancetype)initWithViewControllers:(NSArray *)viewControllers frame:(CGRect)frame options:(NSDictionary *)options;
//my
- (instancetype)initWithViewControllers:(NSArray *)viewControllers frame:(CGRect)frame options:(NSDictionary *)options colors:(NSArray *)colors;

extern NSString * const KPSmartTabBarOptionSelectionIndicatorHeight;
extern NSString * const KPSmartTabBarOptionMenuItemSeparatorWidth;
extern NSString * const KPSmartTabBarOptionScrollMenuBackgroundColor;
extern NSString * const KPSmartTabBarOptionViewBackgroundColor;
extern NSString * const KPSmartTabBarOptionBottomMenuHairlineColor;
extern NSString * const KPSmartTabBarOptionSelectionIndicatorColor;
extern NSString * const KPSmartTabBarOptionMenuItemSeparatorColor;
extern NSString * const KPSmartTabBarOptionMenuMargin;
extern NSString * const KPSmartTabBarOptionMenuHeight;
extern NSString * const KPSmartTabBarOptionSelectedMenuItemLabelColor;
extern NSString * const KPSmartTabBarOptionUnselectedMenuItemLabelColor;
extern NSString * const KPSmartTabBarOptionUseMenuLikeSegmentedControl;
extern NSString * const KPSmartTabBarOptionMenuItemSeparatorRoundEdges;
extern NSString * const KPSmartTabBarOptionMenuItemFont;
extern NSString * const KPSmartTabBarOptionMenuItemSelectedFont;
extern NSString * const KPSmartTabBarOptionMenuItemSeparatorPercentageHeight;
extern NSString * const KPSmartTabBarOptionMenuItemWidth;
extern NSString * const KPSmartTabBarOptionEnableHorizontalBounce;
extern NSString * const KPSmartTabBarOptionAddBottomMenuHairline;
extern NSString * const KPSmartTabBarOptionMenuItemWidthBasedOnTitleTextWidth;
extern NSString * const KPSmartTabBarOptionScrollAnimationDurationOnMenuItemTap;
extern NSString * const KPSmartTabBarOptionCenterMenuItems;
extern NSString * const KPSmartTabBarOptionHideTopMenuBar;
extern NSString * const KPSmartTabBarOptioncolor;
extern NSString * const KPSmartTabBarOptionBottomMenuHairlineHeight;

@end
