//
//  OrlandoAppDelegate.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "OrlandoAppDelegate.h"
#import "LocalXMLParser.h"
#import "LocalXMLParserSpeakers.h"
#import "LocalXMLParserSession.h"
#import "LocalXMLParserImgSession.h"
#import "Speakers.h"
#import "Promo.h"
#import "Session.h"
#import "ImgSession.h"
#import "MainMenuViewController.h"


@implementation OrlandoAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize Sponsors;
@synthesize Speakers;
@synthesize Sessions,ImgSessions;
@synthesize dateOnFocus;
@synthesize allDates;
@synthesize webviewURL;
@synthesize webviewTitle;



#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	application.statusBarStyle = UIStatusBarStyleBlackOpaque;
	
	
	
	viewController = [[MainMenuViewController alloc]init];
	
//	UIImage* image=[UIImage imageNamed:@"splash_iP5@2x.png"];
//    splashView=[[UIImageView alloc]initWithImage:image];
//    [window addSubview:splashView];
//    [window bringSubviewToFront:splashView];
    [self performSelector:@selector(removeSplash) withObject:self afterDelay:0.1];
    [window makeKeyAndVisible];
    if ([self checkIfDeviceIsiPhone5]) {
        splashImageView.image = [UIImage imageNamed:@"Splash-568h@2x.png"];
    }
    else{
        splashImageView.image = [UIImage imageNamed:@"Splash.png"];
    }
//	splashImageView.image = [UIImage imageNamed:@""];
    
    dateOnFocus = @"2013-05-14";// 2011-06-14
    allDates = @"";
    
	[self LoadSponsors];
    [self LoadSessions];
    [self LoadSpeakers];
	[self LoadImgSession];
	navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    
//    UIImage *image1 = [UIImage imageNamed:@"nav_bar.png"];
//    [navigationController.navigationBar setBackgroundImage:image1 forBarMetrics:UIBarMetricsDefault];
    
    
   	//self.window.backgroundColor = [UIColor blackColor];
//	self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Splash.png"]];
    // Add the navigation controller's view to the window and display.
    //[self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];
	
//	[NSThread sleepForTimeInterval:3.0];
	
    return YES;
}

#pragma mark
#pragma mark removeSplash method 

-(void)removeSplash{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:YES];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationDelegate:self];
    [splashView removeFromSuperview];
    [UIView commitAnimations];
    [window addSubview:navigationController.view];
    
}
-(void)LoadSponsors{
	
	NSString * path = [[NSBundle mainBundle] pathForResource:@"Sponsors" ofType:@"xml"];
	
	NSData *data = [NSData dataWithContentsOfFile:path];
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	
	LocalXMLParser *parser = [[LocalXMLParser alloc] initLocalXMLParser];
	
	//Set delegate
	[xmlParser setDelegate:parser];
	[xmlParser setShouldProcessNamespaces:NO];
    [xmlParser setShouldReportNamespacePrefixes:NO];
    [xmlParser setShouldResolveExternalEntities:NO];
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	
	if(success){
		
	}
	else{
		UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Update" message:@"fail to load sponsors" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[errorAlert show];
		[errorAlert release];
	}
	
	[parser release];
}


-(void)LoadSpeakers{
	
	NSString * path = [[NSBundle mainBundle] pathForResource:@"Bio" ofType:@"xml"];
	
	NSData *data = [NSData dataWithContentsOfFile:path];
	
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	
	LocalXMLParserSpeakers *parser = [[LocalXMLParserSpeakers alloc] initSpeakers];
	
	//Set delegate
	[xmlParser setDelegate:parser];
	
	
	[xmlParser setShouldProcessNamespaces:NO];
    [xmlParser setShouldReportNamespacePrefixes:NO];
    [xmlParser setShouldResolveExternalEntities:NO];
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	
	if(success){
		
	}
	else{
		UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Update" message:@"fail to load speakers" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[errorAlert show];
		[errorAlert release];
	}
	
	[parser release];
}

-(void)LoadSessions{
	
	NSString * path = [[NSBundle mainBundle] pathForResource:@"Sessions" ofType:@"xml"];
	NSData *data = [NSData dataWithContentsOfFile:path];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	
	LocalXMLParserSession *parser = [[LocalXMLParserSession alloc] initSessions];
	
	//Set delegate
	[xmlParser setDelegate:parser];
	
	
	[xmlParser setShouldProcessNamespaces:NO];
    [xmlParser setShouldReportNamespacePrefixes:NO];
    [xmlParser setShouldResolveExternalEntities:NO];
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	
	if(success){
		
	}
	else{
		UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Update" message:@"fail to load sessions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[errorAlert show];
		[errorAlert release];
	}
	
	[parser release];
	
}

-(void)LoadImgSession {

	NSString * path = [[NSBundle mainBundle] pathForResource:@"ImgSessions" ofType:@"xml"];
	//NSLog(@"Path is---> %@", path);
	NSData *data = [NSData dataWithContentsOfFile:path];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	
	LocalXMLParserImgSession *parser = [[LocalXMLParserImgSession alloc] initImgSessions];
	
	//Set delegate
	[xmlParser setDelegate:parser];
	
	
	[xmlParser setShouldProcessNamespaces:NO];
    [xmlParser setShouldReportNamespacePrefixes:NO];
    [xmlParser setShouldResolveExternalEntities:NO];
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	
	if(success){
		
	}
	else{
		UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Update" message:@"fail to load Imgsessions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[errorAlert show];
		[errorAlert release];
	}
	
	[parser release];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

#pragma mark -
#pragma mark Device Type check
//method to check if  device is iPhone 5 return true if iPhone 5 else false
-(BOOL)checkIfDeviceIsiPhone5{
    if([UIScreen mainScreen].bounds.size.height > 560.0){
        return TRUE;
    }
    return FALSE;
}

@end

