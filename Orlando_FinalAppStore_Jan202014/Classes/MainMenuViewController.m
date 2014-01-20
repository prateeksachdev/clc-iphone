//
//  MainMenuViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "MainMenuViewController.h"
#import "HotelInfoViewController.h"
#import "SpeakersViewController.h"
#import "AgendaViewController.h"
#import "AgendaViewController2.h"
#import "WebViewController.h"
#import "SponsersViewController.h"
#import "QRCodeViewController.h"
#import "OrlandoAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

#define ButtonHeightForiPhone5 75

@implementation MainMenuViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	pushToImageAgendaView = @"ImgAgenda";
    
    
	[self loadViewForiPhone5];
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
	self.navigationController.navigationBar.hidden = YES;	
}

-(IBAction)MoveToAgendaView{
		
		appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
		AgendaView = [[AgendaViewController alloc] init];
		[self.navigationController pushViewController:AgendaView animated:YES];
}
	

-(void)viewWillAppear {


	[super viewWillAppear:YES];
}
	
-(IBAction)MoveToHotelView{
	if(HotelInfoView == nil){
		HotelInfoView = [[HotelInfoViewController alloc] init];	
	}
    
//        CATransition *transition = [CATransition animation];
//        transition.type = kCATransitionPush;
//        transition.subtype = kCATransitionFromRight;
//        [HotelInfoView.view.layer addAnimation:transition forKey:@"push-transition"];
	[self.navigationController pushViewController:HotelInfoView animated:YES];
    
}

-(IBAction)MoveToSpeakerView{
	if(SpeakersView == nil){
		SpeakersView = [[SpeakersViewController alloc] init];	
	}
	[self.navigationController pushViewController:SpeakersView animated:YES];
}

-(IBAction)OpenQRCode{

	
		appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
		appDelegate.dateOnFocus=@"2013-05-14";
		AgendaView = [[AgendaViewController alloc] init];
		AgendaView.checkString = [NSString stringWithFormat:@"%@", pushToImageAgendaView];
		[self.navigationController pushViewController:AgendaView animated:YES];
} 

-(IBAction)MoveToWebView{
 	
if (aWebView == nil) {
		
	aWebView = [[WebViewController alloc] init];
	}
		[self.navigationController pushViewController:aWebView animated:YES];
	
}

-(IBAction)MoveToSponser{
		
	if(aSponserView == nil){
		
		aSponserView = [[SponsersViewController alloc] init];	
		}
		[self.navigationController pushViewController:aSponserView animated:YES];
}
-(IBAction)GetRCWeb{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://roundedcornersmedia.com"]];
}

//added By Umesh on 10 May 2013   to make it work on iPhone5

//method to change button size if device is iPhone 5
-(void)loadViewForiPhone5{
    
    appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([appDelegate checkIfDeviceIsiPhone5]) {
        //change button height of button for iPhone 5
        
        float yPos = 0;
        
        //clc agenda button
        CGRect buttonFrame = clcAgendaButtonObj.frame;
        buttonFrame.size.height = ButtonHeightForiPhone5;
        clcAgendaButtonObj.frame = buttonFrame;
        yPos = buttonFrame.origin.y + buttonFrame.size.height;
        
        //img agenda button
        buttonFrame = imgAgendaButtonObj.frame;
        buttonFrame.origin.y = yPos;
        buttonFrame.size.height = ButtonHeightForiPhone5+1;
        imgAgendaButtonObj.frame = buttonFrame;
        yPos += ButtonHeightForiPhone5;
        
        //speakers button
        buttonFrame = speakersButtonObj.frame;
        buttonFrame.origin.y = yPos;
        buttonFrame.size.height = ButtonHeightForiPhone5;
        speakersButtonObj.frame = buttonFrame;
        yPos += ButtonHeightForiPhone5;
        
        //sponsors button
        buttonFrame = sponsorsButtonObj.frame;
        buttonFrame.origin.y = yPos;
        buttonFrame.size.height = ButtonHeightForiPhone5;
        sponsorsButtonObj.frame = buttonFrame;
        yPos += ButtonHeightForiPhone5;
        
        //hotel info button
        buttonFrame = hotelInfoButtonObj.frame;
        buttonFrame.origin.y = yPos;
        buttonFrame.size.height = ButtonHeightForiPhone5+1;
        hotelInfoButtonObj.frame = buttonFrame;
        yPos += ButtonHeightForiPhone5;
        
        //twitter buzz button
        buttonFrame = twiterBuzzButtonObj.frame;
        buttonFrame.origin.y = yPos;
        buttonFrame.size.height = ButtonHeightForiPhone5;
        twiterBuzzButtonObj.frame = buttonFrame;
        yPos += ButtonHeightForiPhone5;
        
        
        //change the yPos of the developed by Label in the bottom
        
        buttonFrame = developedByLabel.frame;
        buttonFrame.origin.y = yPos;
        developedByLabel.frame = buttonFrame;
        
    }
    
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
