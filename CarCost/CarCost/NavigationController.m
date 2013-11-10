//
//  NavigationController.m
//  carcost
//
//  Created by Matt Schmulen on 11/9/13.
//  Copyright (c) 2013 Matt Schmulen. All rights reserved.
//

#import "NavigationController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface NavigationController ()

@end

@implementation NavigationController

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
	// Do any additional setup after loading the view.
    
    self.navigationBar.barTintColor = UIColorFromRGB(0x3B9562);//[UIColor blueColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    
    //NSMutableDictionary *textAttributes = [[NSMutableDictionary alloc] initWithDictionary:self.navigationBar.titleTextAttributes];
    //[textAttributes setValue:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    //self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    
    //[self.navigationController.navigationBar setBarStyle:UIStatusBarStyleLightContent];
    
    
    
    
    
    //[[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor], NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    //[[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    // Navigation bar buttons appearance
    //[[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor textBarColor], NSForegroundColorAttributeName, shadowColor, NSShadowAttributeName, [UIFont fontWithName:@"FontName" size:titleSize], NSFontAttributeName, nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
