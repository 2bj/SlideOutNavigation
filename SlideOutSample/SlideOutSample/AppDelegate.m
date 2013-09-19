//
//  AppDelegate.m
//  SlideOutSample
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AMSlideOutNavigationController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	UIViewController* controller;

	[[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.37 green:0.41f blue:0.48f alpha:1.0f]];
	
	self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];
	
	[self.slideoutController setSlideoutOptions:@{
					   AMOptionsAnimationShrink: @NO,
					   AMOptionsAnimationDarken: @NO,
						AMOptionsAnimationSlide: @YES,
					   AMOptionsCellBackground: [UIColor clearColor],
			  AMOptionsAnimationSlidePercentage: @0.7f,
						 AMOptionsEnableShadow : @YES,
	 // Want a custom cell? uncomment and use your own class that inherits from AMSlideTableCell
						//AMOptionsTableCellClass: @"CustomCell",
						   AMOptionsHeaderFont : [UIFont systemFontOfSize:14]
	 }];
	
	// Add a first section
	[self.slideoutController addSectionWithTitle:@"FIRST SECTION"];

	controller = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller tagged:1 withTitle:@"First View" andIcon:@"icon1.png"];

	controller = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller tagged:2 withTitle:@"Second View" andIcon:@"icon2.png"];

	// Add a second section
	[self.slideoutController addSectionWithTitle:@"SECOND SECTION"];
	
	// Add two viewcontrollers to the second section	
	controller = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller
													 tagged:3
												  withTitle:@"First View"
													andIcon:[UIImage imageNamed:@"icon1.png"]
											   beforeChange:^{
												   NSLog(@"Changing viewController");
											   } onCompletition:^{
												   NSLog(@"Done");
											   }];
	
	controller = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.slideoutController addViewControllerToLastSection:controller tagged:4 withTitle:@"Second View" andIcon:@"icon2.png"];
	
	[self.slideoutController addSectionWithTitle:@"" andHeaderClassName:@"CustomHeader" withHeight:5];
	[self.slideoutController addActionToLastSection:^{
		// some action
	}
											 tagged:5
										  withTitle:@"Action"
											andIcon:@""];
		
	[self.window setRootViewController:self.slideoutController];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)setBadgeValue:(NSString*)value forTag:(int)tag
{
	[self.slideoutController setBadgeValue:value forTag:tag];
}

@end
