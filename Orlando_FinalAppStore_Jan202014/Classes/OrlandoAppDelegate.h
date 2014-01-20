//
//  OrlandoAppDelegate.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface OrlandoAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	NSMutableArray *Sponsors;
	NSMutableArray *Speakers;
	NSMutableArray *Sessions;
	NSMutableArray *ImgSessions;
    NSString *dateOnFocus;
    NSString *allDates;
    NSString *webviewTitle;
    NSString *webviewURL;
	UIImageView *splashView;
	MainMenuViewController *viewController;
    IBOutlet UIImageView *splashImageView;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *Sponsors;
@property (nonatomic, retain) NSMutableArray *Speakers;
@property (nonatomic, retain) NSMutableArray *Sessions;
@property (nonatomic, retain) NSMutableArray *ImgSessions;
@property (nonatomic, retain) NSString *dateOnFocus;
@property (nonatomic, retain) NSString *allDates;
@property (nonatomic, retain) NSString *webviewTitle;
@property (nonatomic, retain) NSString *webviewURL;

-(void)LoadSponsors;
-(void)LoadSpeakers;
-(void)LoadSessions;
-(void)LoadImgSession;
-(void)removeSplash;
-(BOOL)checkIfDeviceIsiPhone5;
@end

