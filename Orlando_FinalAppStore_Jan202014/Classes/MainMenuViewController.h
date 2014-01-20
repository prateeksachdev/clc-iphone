//
//  MainMenuViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotelInfoViewController,SpeakersViewController;
@class AgendaViewController,WebViewController;
@class SponsersViewController, QRCodeViewController;
@class AgendaDetailsViewController,OrlandoAppDelegate;
@class AgendaViewController2;

@interface MainMenuViewController : UIViewController {
	HotelInfoViewController *HotelInfoView;
	SpeakersViewController *SpeakersView;
	AgendaViewController *AgendaView;
	WebViewController	*aWebView;
	SponsersViewController *aSponserView;
	QRCodeViewController *QRCodeView;
    OrlandoAppDelegate *appDelegate;
	AgendaViewController2 *agendaViewController2;
	
	NSString *pushToImageAgendaView;
	NSString *str;
    
    //added By Umesh on 10 May 2013   to make it work on iPhone5
    
    IBOutlet UIButton *clcAgendaButtonObj;
    IBOutlet UIButton *imgAgendaButtonObj;
    IBOutlet UIButton *speakersButtonObj;
    IBOutlet UIButton *sponsorsButtonObj;
    IBOutlet UIButton *hotelInfoButtonObj;
    IBOutlet UIButton *twiterBuzzButtonObj;
    IBOutlet UILabel *developedByLabel;
    
    
}

-(IBAction)MoveToAgendaView;
-(IBAction)MoveToHotelView;
-(IBAction)MoveToSpeakerView;
-(IBAction)MoveToWebView;
-(IBAction)OpenQRCode;
-(IBAction)MoveToSponser;
-(IBAction)GetRCWeb;

//added By Umesh on 10 May 2013   to make it work on iPhone5
-(void)loadViewForiPhone5;
@end
