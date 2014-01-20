//
//  SpeakersViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpeakerDetailsViewController,OrlandoAppDelegate;
@interface SpeakersViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	NSMutableArray *IndexArray;
	OrlandoAppDelegate *appDelegate;
	SpeakerDetailsViewController *SpeakerDetailsView;
    
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton *main_button;
	
	NSString *urlString;
}

-(IBAction)main_button:(id)sender;
@end
