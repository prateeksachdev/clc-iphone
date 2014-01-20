//
//  SponsorDetailViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/23/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrlandoAppDelegate;
@class WebViewController;
@interface SponsorDetailViewController : UIViewController {
	IBOutlet UIImageView *Logo;
	NSUInteger number;
	OrlandoAppDelegate *appDelegate;
	WebViewController *aWebView;
	IBOutlet UILabel *Line1;
	IBOutlet UILabel *Line2;
	IBOutlet UILabel *Line3;
	IBOutlet UILabel *Line4;
	IBOutlet UILabel *tweetURL;
	IBOutlet UIButton *followButton;
	NSString *tweetUrlString;
	NSString *moveToTwitterURl;
    
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton    *main_button;
    
}

@property (nonatomic,retain)IBOutlet UIImageView *Logo;
@property (nonatomic,retain)NSString *tweetUrlString;
@property (assign)NSUInteger number;

-(void)SetData;
-(IBAction)Next;
-(IBAction)Prev;
-(IBAction)OpenSite;
-(IBAction)followButton:(id)sender;
-(IBAction)main_button1:(id)sender;


@end
