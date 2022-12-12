//
//  AppDelegate.m
//  ZWTaBarDemo
//
//  Created by 崔先生的MacBook Pro on 2022/12/10.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabBar;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //创建viewcontroller对象
    ViewController *vc = [ViewController new];
    //设置图片
    UIImage *firstUnSelectedImage = [UIImage imageNamed:@"HomeUnSelected"];
    //不设置imageWithRenderingMode,tabbar的选中色为蓝色,因为tabbar默认是蓝色的包括图片和文字,所以要解决这个问题就需要我们去掉SelectedImage的渲染效果
    UIImage *firstSelectedImage = [[UIImage imageNamed:@"HomeSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置tabbar的各个元素
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:firstUnSelectedImage selectedImage:firstSelectedImage];
    
    SecondViewController *vc2 = [SecondViewController new];
    UIImage *secondUnSelectedImage = [UIImage imageNamed:@"MyUnSelected"];
    UIImage *secondSelectedImage = [[UIImage imageNamed:@"MySelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:secondUnSelectedImage selectedImage:secondSelectedImage];
    
    //创建一个数组 接受各个viewController
    NSArray *arr = @[vc, vc2];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (UIViewController *viewController in arr) {
        //让每个ViewController上面都有一个导航控制器
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        //把导航控制器放进一个可变数组
        [array addObject:nav];
    }
    _tabBar = [[UITabBarController alloc] init];
    _tabBar.viewControllers = array;
    _tabBar.tabBar.backgroundColor = [UIColor grayColor];
    //TabBar主题色,用于修改文字颜色
    _tabBar.tabBar.tintColor = [UIColor orangeColor];
    _tabBar.delegate = self;

    self.window.rootViewController = _tabBar;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (tabBarController.selectedIndex == 0) {
        NSLog(@"0");
        tabBarController.tabBar.backgroundColor = [UIColor grayColor];
    } else {
        NSLog(@"1");
        tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    }
}

@end
