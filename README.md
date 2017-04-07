# KPSmartTabBar
A fully customizable and flexible paging menu controller built from other view controllers placed inside a scroll view allowing the user to switch between any kind of view controller with an easy tap or swipe gesture similar to what Spotify and Instagram.


### Screenshot
![](https://github.com/KrishnaPatell/KPSmartTabBar/blob/master/KPSmartTabBar/demo.gif)

![](https://github.com/KrishnaPatell/KPSmartTabBar/blob/master/KPSmartTabBar/SegmentDemo.png) 

### Installation
Simply include KPSmartTabBar.h and KPSmartTabBar.m files into your project directory.


### Usage
Look at ViewController.m file for demo.
You can also use it like segment controller.

### Delegate Methods (Optional)

```sh
- (void)willMoveToPage:(UIViewController *)controller index:(NSInteger)index {}

- (void)didMoveToPage:(UIViewController *)controller index:(NSInteger)index {}
```

### Requirements
iOS 7.0 and later

### Apps that uses KPSmartTabBar
Please let me know if your app in the AppStore uses this library so I can add your app to the list of apps featuring KPSmartTabBar.

### License
MIT License
