//
//  SpeakerDetailsViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrlandoAppDelegate,AgendaDetailsViewController;
@interface SpeakerDetailsViewController : UIViewController <UIGestureRecognizerDelegate> {
	IBOutlet UITextView *detailText;
	NSUInteger number;
	NSUInteger sessionNumber;
	
	IBOutlet UILabel *SpeakerName;
	IBOutlet UILabel *Role;
	IBOutlet UILabel *Organization;
    IBOutlet UIImageView *imageView;
	IBOutlet UIButton *followButton;
    IBOutlet UIButton *back_button;
    IBOutlet UIImageView *navImage;
   
	
	NSString *commonTwitterURLString;
	NSString *twitterURLString;
	
	NSString *FinaltwitterURLString;
	
	OrlandoAppDelegate *appDelegate;
	AgendaDetailsViewController *AgendaDetailView;
	UIScrollView *scrollView;
}

@property (assign)NSUInteger number;
@property (nonatomic, retain)NSString *commonTwitterURLString;
@property (nonatomic, retain)NSString *twitterURLString;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

-(void)SetData;
-(IBAction)Next;
-(IBAction)Prev;

-(IBAction)ShowSession;

-(IBAction)followButton:(id)sender;
 -(IBAction)back_button:(id)sender;

@end
