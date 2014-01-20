//
//  AgendaDetailsViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrlandoAppDelegate,SpeakerDetailsViewController, Session;
@interface AgendaDetailsViewController : UIViewController {
	IBOutlet UITextView *detailText;
	NSUInteger number;
	OrlandoAppDelegate *appDelegate;
	
	IBOutlet UILabel *Name;
	IBOutlet UILabel *Speaker;
	IBOutlet UILabel *Time;
	IBOutlet UILabel *Room;
	IBOutlet UIButton *Bio;
	IBOutlet UITextView *Desc;
    
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton *backButton;
    
    
	
	SpeakerDetailsViewController *SpeakerDetailView;
	
	NSUInteger speakerNumber;
	
	NSString *agendaDetailView;
	
	NSString *detailViewFromAgenda3;
	NSString *comeFromImgdetailView;
	NSString *comeFromImgAgenda2;
	NSString *comeFromImgAgenda3;
	
	NSString *funString;
	
	NSString *funStringFromAgendaView2;
    
    UIButton *prevImageButton;
    UIButton *nextImageButton;
    
    
    //added By Umesh on 10 May 2013   to make it work on iPhone5
    IBOutlet UIImageView *backgroundImageView;
}

@property(assign)BOOL is_from; // Check for header dates
@property(assign)NSUInteger number;
@property(nonatomic, retain)NSString *agendaDetailView;
@property(nonatomic, retain)NSString *detailViewFromAgenda3;
@property(nonatomic, retain)NSString *comeFromImgdetailView;
@property(nonatomic, retain)NSString *comeFromImgAgenda2;
@property(nonatomic, retain)NSString *comeFromImgAgenda3;
@property(nonatomic, retain)NSString *funString;
@property(nonatomic, retain)NSString *funStringFromAgendaView2;

@property(nonatomic,retain)NSString *img_agendaDatails;

-(void)SetData;
-(void)SetDataForImg;
//-(IBAction)Next;
//-(IBAction)Prev;

-(IBAction)ShowBio:(id)sender;
-(IBAction)backButton:(id)sender;
//added By Umesh on 10 May 2013   to make it work on iPhone5
-(void)loadViewForiPhone5;
@end
