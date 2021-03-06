//
//  SNAppDelegate.m
//  FulcrumAPITest
//
//  Created by Ben Rigas on 5/25/12.
//  Copyright (c) 2012 Spatial Networks. All rights reserved.
//

#import "SNAppDelegate.h"

#import "SNMasterViewController.h"

#import "SNDetailViewController.h"
#import "SNFormsViewController.h"
#import "SNClassificationSetsViewController.h"
#import "SNChoiceListsViewController.h"

@implementation SNAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize splitViewController = _splitViewController;

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [_splitViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        SNMasterViewController *masterViewController = [[[SNMasterViewController alloc] initWithNibName:@"SNMasterViewController_iPhone" bundle:nil] autorelease];
//        self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
//        self.window.rootViewController = self.navigationController;
        
        UITabBarController* tabController = [[UITabBarController alloc] init];

        SNFormsViewController* formsController = [[[SNFormsViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        UINavigationController* formsNav = [[[UINavigationController alloc] initWithRootViewController:formsController] autorelease];
        formsNav.navigationBar.barStyle = UIBarStyleBlack;
        
        SNClassificationSetsViewController* classificationController = [[[SNClassificationSetsViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        UINavigationController* classNav = [[[UINavigationController alloc] initWithRootViewController:classificationController] autorelease];
        classNav.navigationBar.barStyle = UIBarStyleBlack;
        
        SNChoiceListsViewController* choiceController = [[[SNChoiceListsViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        UINavigationController* choiceNav = [[[UINavigationController alloc] initWithRootViewController:choiceController] autorelease];
        choiceNav.navigationBar.barStyle = UIBarStyleBlack;
        
        NSMutableArray* viewControllers = [NSMutableArray array];
        [viewControllers addObject:formsNav];
        [viewControllers addObject:classNav];
        [viewControllers addObject:choiceNav];
        
        [tabController setViewControllers:viewControllers];
        
        self.window.rootViewController = tabController;
    } else {
        SNMasterViewController *masterViewController = [[[SNMasterViewController alloc] initWithNibName:@"SNMasterViewController_iPad" bundle:nil] autorelease];
        UINavigationController *masterNavigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
        
        SNDetailViewController *detailViewController = [[[SNDetailViewController alloc] initWithNibName:@"SNDetailViewController_iPad" bundle:nil] autorelease];
        UINavigationController *detailNavigationController = [[[UINavigationController alloc] initWithRootViewController:detailViewController] autorelease];
    	
    	masterViewController.detailViewController = detailViewController;
    	
        self.splitViewController = [[[UISplitViewController alloc] init] autorelease];
        self.splitViewController.delegate = detailViewController;
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailNavigationController, nil];
        
        self.window.rootViewController = self.splitViewController;
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
