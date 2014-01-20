//
//  AgendaViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AgendaDetailsViewController,OrlandoAppDelegate;
@interface AgendaViewController3 : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	AgendaDetailsViewController *AgendaDetailView;
    
    
	IBOutlet UIButton *NextButton;
	IBOutlet UIButton *PrevButton;
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton *backButton;
   
	
	OrlandoAppDelegate *appDelegate;
	
	NSInteger *RecordNumber;
    NSMutableArray *sessionsToDisplay1;
	NSMutableArray *sessionsToDisplay1ForImg;
	
	NSString *checkStringFromAgendaView3;
	NSString *checkStringToAgendaDetailViewFromAgenda3;
	NSString *moveToImgDetailView;
    
}

@property (nonatomic, retain)NSString *checkStringFromAgendaView3;
@property (nonatomic, retain)NSString *checkStringToAgendaDetailViewFromAgenda3;

-(IBAction)SetButtons:(id)sender;
-(IBAction)backButton:(id)sender;

@end
