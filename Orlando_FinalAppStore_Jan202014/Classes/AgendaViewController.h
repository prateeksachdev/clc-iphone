//
//  AgendaViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AgendaDetailsViewController,OrlandoAppDelegate;
@interface AgendaViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	AgendaDetailsViewController *AgendaDetailView;
    
    
	IBOutlet UIButton *NextButton;
	IBOutlet UIButton *PrevButton;
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton *backButton;
	
	OrlandoAppDelegate *appDelegate;
	
	NSInteger *RecordNumber;
    NSMutableArray *sessionsToDisplay; 
	NSMutableArray *sessionsToDisplayForImg; 
	
	NSString *checkString;
	NSString *checkStringForAgenda2;
	NSString *moveToForDetailViewFromImg;

}

@property (nonatomic, retain)NSString *checkString;

-(IBAction)SetButtons:(id)sender;
-(IBAction)backButton:(id)sender;
@end
