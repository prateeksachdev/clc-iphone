//
//  HotelInfoViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@class MapViewController;
@interface HotelInfoViewController : UIViewController<MFMailComposeViewControllerDelegate,UIScrollViewDelegate> {
	MapViewController *MapView;
	UIScrollView *scrollView;
	UIImageView  *imageView;
	IBOutlet UIImageView *logoImageView;
    IBOutlet UIButton *phoneNumberButton;
    
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton *main_button;
    
 	
}

@property(nonatomic, retain)UIScrollView *scrollView;
-(IBAction)ViewMap;
-(IBAction)SendMail;
-(IBAction)ViewSite;
-(IBAction)Call;
-(IBAction)VisitOrlando;
-(IBAction)phoneNumber:(id)sender;
-(IBAction)main_button:(id)sender;

@end
