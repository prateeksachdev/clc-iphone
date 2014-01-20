//
//  SponsersViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/23/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SponsorDetailViewController,OrlandoAppDelegate;
@interface SponsersViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
	SponsorDetailViewController *sponcerDetails;
	OrlandoAppDelegate *appDelegate;
    
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton    *main_button;
    IBOutlet UITableView *sponserTableView;
    
	
	NSString *urlString;
}
-(IBAction)main_button:(id)sender;
@end
