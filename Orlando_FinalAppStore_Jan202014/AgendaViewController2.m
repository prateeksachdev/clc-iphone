//
//  AgendaViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "AgendaViewController2.h"
#import "AgendaDetailsViewController.h"
#import "OrlandoAppDelegate.h"
#import "Session.h"
#import "ImgSession.h"
#import "AgendaViewController.h"
#import "AgendaViewController3.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation AgendaViewController2

@synthesize checkStringFromAgendaView;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {

	self.title = @"Wednesday, June 15";
	
    self.view.backgroundColor = [UIColor whiteColor];
    
	if([checkStringFromAgendaView isEqualToString:@"AgendaView2"])
	{
		checkStringFromAgendaView2 = @"AgendaViewController3";
		
		appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
		sessionsToDisplayForImg = [[NSMutableArray alloc] init];
		
		for (ImgSession *imgSession in appDelegate.ImgSessions) {
			if ([imgSession.Date isEqualToString:@"2013-05-15"])//2013-05-15 //||[imgSession.Date isEqualToString:@"2012-05-23"]||[imgSession.Date isEqualToString:@"2012-05-24"])
				[sessionsToDisplayForImg addObject:imgSession];
		}

        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 21, 120, 15)];
        img_titleView.image = [UIImage imageNamed:@"imgTitle.png"];
        [navImage addSubview:img_titleView];
        [img_titleView release];
		
		/*UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
		[backButton setBackgroundImage:[UIImage imageNamed:@"main.png"] forState:UIControlStateNormal];
		[backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		
		UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
		
		[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
		[barLeftButton release];
		[backButton release];*/
	}
	else {
		
		appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
		sessionsToDisplay = [[NSMutableArray alloc] init];
		
		for (Session *session in appDelegate.Sessions) {
			if ([session.Date isEqualToString:@"2013-05-15"])//2013-05-16 //||[session.Date isEqualToString:@"2012-05-23"]||[session.Date isEqualToString:@"2012-05-24"])
				[sessionsToDisplay addObject:session];
		}
		
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 21, 120, 15)];
        img_titleView.image = [UIImage imageNamed:@"clcTitle.png"];
        [navImage addSubview:img_titleView];
        [img_titleView release];
		
		/*UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
		[backButton setBackgroundImage:[UIImage imageNamed:@"main.png"] forState:UIControlStateNormal];
		[backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		
		UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
		
		[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
		[barLeftButton release];
		[backButton release];*/
	}


    [super viewDidLoad];
}


#pragma mark 
#pragma mark backButton Action
-(IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)viewWillAppear:(BOOL)animated {
	
    self.navigationController.navigationBar.hidden = YES;
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:78.0/255.0 green:107.0/255.0 blue:124.0/255.0 alpha:1.0];
    
	if([checkStringFromAgendaView isEqualToString:@"AgendaView2"])
	{
	
		RecordNumber = 0;
		appDelegate.dateOnFocus=@"2013-05-15";//2011-06-15
		[NextButton setTitle:@"Wednesday, June 15" forState:UIControlStateNormal];
		[NextButton setTitle:@"Thursday, June 16" forState:UIControlStateNormal];
		
		UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 57, 320, 20)];
		headerImage.image = [UIImage imageNamed:@"headerBar.png"];
        headerImage.userInteractionEnabled = YES;
		[self.view addSubview:headerImage];
		
		
		UILabel *dayDateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(110, 3, 160, 15)];//35, 0, 230, 40
		dayDateLabel.numberOfLines = 1;
		dayDateLabel.font = [UIFont boldSystemFontOfSize:12];
		dayDateLabel.backgroundColor = [UIColor clearColor];
		dayDateLabel.textColor = [UIColor whiteColor];
		dayDateLabel.text = @"WEDNESDAY, MAY 15";
//		[headerImage addSubview:dayDateLabel];
        
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 4, 124, 11)];
        img_titleView.image = [UIImage imageNamed:@"wednesday.png"];
        img_titleView.contentMode = UIViewContentModeScaleAspectFit;
        [headerImage addSubview:img_titleView];
        [img_titleView release];
		
		
		UIButton* headerArrowImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		headerArrowImageButton.frame = CGRectMake(202, -20, 95, 60);//240, -20, 95, 60
		[headerArrowImageButton setBackgroundColor:[UIColor clearColor]];
		[headerArrowImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
		[headerArrowImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[headerArrowImageButton setImage:[UIImage imageNamed:@"whiteAccessary.png"] forState:UIControlStateNormal];
		[headerArrowImageButton addTarget:self action:@selector(headerArrowImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headerImage addSubview:headerArrowImageButton];
		
		UIButton* headerArrowImageButtonForBack = [UIButton buttonWithType:UIButtonTypeCustom];
		headerArrowImageButtonForBack.frame = CGRectMake(20, -20, 95, 60);// 5, 0, 75, 20
		[headerArrowImageButtonForBack setBackgroundColor:[UIColor clearColor]];
		[headerArrowImageButtonForBack setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
		[headerArrowImageButtonForBack setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[headerArrowImageButtonForBack setImage:[UIImage imageNamed:@"whiteAccessary_Back.png"] forState:UIControlStateNormal];
		[headerArrowImageButtonForBack addTarget:self action:@selector(headerArrowImageButtonClickedForBack:) forControlEvents:UIControlEventTouchUpInside];
        [headerImage addSubview:headerArrowImageButtonForBack];
		
		[headerImage release];
		[dayDateLabel release];
	}
	
	else {
		
		RecordNumber = 0;
		appDelegate.dateOnFocus=@"2013-05-15";//2013-05-14
		[NextButton setTitle:@"Wednesday, June 15" forState:UIControlStateNormal];
		[NextButton setTitle:@"Thursday, June 16" forState:UIControlStateNormal];
		
		UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 57, 320, 20)];
		headerImage.image = [UIImage imageNamed:@"headerBar.png"];
        headerImage.userInteractionEnabled = YES;
		[self.view addSubview:headerImage];
		
		
		UILabel *dayDateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(110, 3, 160, 15)];//35, 0, 230, 40
		dayDateLabel.numberOfLines = 1;
		dayDateLabel.font = [UIFont boldSystemFontOfSize:12];
		dayDateLabel.backgroundColor = [UIColor clearColor];
		dayDateLabel.textColor = [UIColor whiteColor];
		dayDateLabel.text = @"WEDNESDAY, MAY 15";
//		[headerImage addSubview:dayDateLabel];
        
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 4, 124, 11)];
        img_titleView.image = [UIImage imageNamed:@"wednesday.png"];
        [headerImage addSubview:img_titleView];
        [img_titleView release];
		
		
		UIButton* headerArrowImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		headerArrowImageButton.frame = CGRectMake(202, -20, 95, 60);//250, -20, 95, 60		[headerArrowImageButton setBackgroundColor:[UIColor clearColor]];
		[headerArrowImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
		[headerArrowImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[headerArrowImageButton setImage:[UIImage imageNamed:@"whiteAccessary.png"] forState:UIControlStateNormal];
		[headerArrowImageButton addTarget:self action:@selector(headerArrowImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//		[self.view addSubview:headerArrowImageButton];
//		[self.view bringSubviewToFront:headerArrowImageButton];
        [headerImage addSubview:headerArrowImageButton];
		
		UIButton* headerArrowImageButtonForBack = [UIButton buttonWithType:UIButtonTypeCustom];
		headerArrowImageButtonForBack.frame = CGRectMake(20, -20, 95, 60);
		[headerArrowImageButtonForBack setBackgroundColor:[UIColor clearColor]];
		[headerArrowImageButtonForBack setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
		[headerArrowImageButtonForBack setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[headerArrowImageButtonForBack setImage:[UIImage imageNamed:@"whiteAccessary_Back.png"] forState:UIControlStateNormal];
		[headerArrowImageButtonForBack addTarget:self action:@selector(headerArrowImageButtonClickedForBack:) forControlEvents:UIControlEventTouchUpInside];
//		[self.view addSubview:headerArrowImageButtonForBack];
//		[self.view bringSubviewToFront:headerArrowImageButtonForBack];
        [headerImage addSubview:headerArrowImageButtonForBack];
		
		[headerImage release];
		[dayDateLabel release];
	}
	
    [super viewWillAppear:animated];
}


#pragma mark
#pragma mark headerArrowImageButton action 

-(void)headerArrowImageButtonClicked:(id)sender {
	

	AgendaViewController3 *AgendaView3 = [[AgendaViewController3 alloc] init];	
	
	if([checkStringFromAgendaView isEqualToString:@"AgendaView2"])
	{
		AgendaView3.checkStringFromAgendaView3 = checkStringFromAgendaView2;
	}

	[self.navigationController pushViewController:AgendaView3 animated:YES];


	[AgendaView3 release];
	
//	UIButton *Button = (UIButton *)sender;
//	//NSLog(@"%@",Button.titleLabel.text)  ;
//	
//	if([Button.titleLabel.text isEqualToString:@"Tuesday, June 14"]){
//		self.title = @"Tuesday, June 14";
//		[PrevButton setTitle:@"Wednesday, June 15" forState:UIControlStateNormal];
//		[NextButton setTitle:@"Thursday, June 16" forState:UIControlStateNormal];
//		
//	}
//	else if([Button.titleLabel.text isEqualToString:@"Wednesday, June 15"]){
//		self.title = @"Wednesday, June 15";
//		[PrevButton setTitle:@"Tuesday, June 14" forState:UIControlStateNormal];
//		[NextButton setTitle:@"Thursday, June 16" forState:UIControlStateNormal];
//		
//		AgendaViewController2 *AgendaView = [[AgendaViewController2 alloc] init];	
//		
//		[self.navigationController pushViewController:AgendaView animated:YES];
//		
//		[AgendaView release]; 
//		
//	}
//	else if([Button.titleLabel.text isEqualToString:@"Thursday, June 16"]){
//		self.title = @"Thursday, June 16";
//		[PrevButton setTitle:@"Tuesday, June 14" forState:UIControlStateNormal];
//		[NextButton setTitle:@"Wednesday, June 15" forState:UIControlStateNormal];
//		
//		AgendaViewController3 *AgendaView3 = [[AgendaViewController3 alloc] init];	
//		
//		[self.navigationController pushViewController:AgendaView3 animated:YES];
//		
//		[AgendaView3 release]; 
//		
//	}
    
    /*
	 [sessionsToDisplay release];
	 sessionsToDisplay = [[NSMutableArray alloc] init];
	 
	 //UITableView *tableView = self;
	 for (Session *session in appDelegate.Sessions) {
	 if ([session.Date isEqualToString:@"2011-06-15"])
	 [sessionsToDisplay addObject:session];
	 }
	 [tableView reloadData];
	 */
	
	
}

-(void)headerArrowImageButtonClickedForBack:(id)sender {

	[self.navigationController popViewControllerAnimated:YES];
}



-(IBAction)SetButtons:(id)sender{
//	UIButton *Button = (UIButton *)sender;
//	//NSLog(@"%@",Button.titleLabel.text)  ;
//	
//	if([Button.titleLabel.text isEqualToString:@"Tuesday, June 14"]){
//		self.title = @"Tuesday, June 14";
//		[PrevButton setTitle:@"Wednesday, June 15" forState:UIControlStateNormal];
//		[NextButton setTitle:@"Thursday, June 16" forState:UIControlStateNormal];
//        appDelegate.dateOnFocus=@"2011-06-14";
//	}
//	else if([Button.titleLabel.text isEqualToString:@"Wednesday, June 15"]){
//		self.title = @"Wednesday, June 15";
//		[PrevButton setTitle:@"Tuesday, June 14" forState:UIControlStateNormal];
//		[NextButton setTitle:@"Thursday, June 16" forState:UIControlStateNormal];
//        appDelegate.dateOnFocus=@"2011-06-15";
//	}
//	else if([Button.titleLabel.text isEqualToString:@"Thursday, June 16"]){
//		self.title = @"Thursday, June 16";
//		[PrevButton setTitle:@"Tuesday, June 14" forState:UIControlStateNormal];
//		[NextButton setTitle:@"Wednesday, June 15" forState:UIControlStateNormal];
//        appDelegate.dateOnFocus=@"2011-06-16";
//	}
    
    /*
     [sessionsToDisplay release];
     sessionsToDisplay = [[NSMutableArray alloc] init];
     
     //UITableView *tableView = self;
     for (Session *session in appDelegate.Sessions) {
     if ([session.Date isEqualToString:@"2011-06-15"])
     [sessionsToDisplay addObject:session];
     }
     [tableView reloadData];
     */
    /*
     AgendaViewController2 *AgendaView = [[AgendaViewController alloc] init];	
     
     [self.navigationController pushViewController:AgendaView animated:YES];
     
     [AgendaView release]; 
     */
}





-(void)viewWillDisappear:(BOOL)animated{
//	self.title = @"Agenda";	
}

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    
    
    
    //[appDelegate.Sessions removeObjectsInArray:sessionsToDisplay];
    
    //NSLog(@"Sessions %@" , [appDelegate.Sessions count]);
    
    // return [appDelegate.Sessions count];
	
	if([checkStringFromAgendaView isEqualToString:@"AgendaView2"])
	{
		return 1;
	}
	else {
		return 1;

	}
	//return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if([checkStringFromAgendaView isEqualToString:@"AgendaView2"])
	{
		return [sessionsToDisplayForImg count];
	}
	else {
		return [sessionsToDisplay count];
		
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 0.0; //25;	
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 0.0; //5;	
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @" ";	
}

/*-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 5)];
	headerView.backgroundColor = [UIColor clearColor];
	return headerView;
}*/

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	//if(indexPath.row % 2 == 0)
	//{
	//	return 20;	
	//}
	//else {
    return 60;
	//}
    
}


/*-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
	headerView.backgroundColor = [UIColor clearColor];
	UIImageView *BGImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, 270, 20)];
	BGImage.image = [UIImage imageNamed:@"HeaderBG.png"];
	[headerView addSubview:BGImage];
	UILabel *Label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 235, 20)];
	Label.backgroundColor = [UIColor clearColor];
	Label.font = [UIFont boldSystemFontOfSize:15];
	Label.textColor = UIColorFromRGB(0x567E7E);
	
	Session *aPromo = [sessionsToDisplay objectAtIndex:section];
	Label.text = [aPromo Time];
	[headerView addSubview:Label];
	return headerView;
}*/


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = nil; //@"Cell";
    static NSInteger titletag = 1;
    static NSInteger detailtag = 2;
	//static NSInteger labelTag = 3;
    
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        
        UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
        arrowImage.tag = 5;
        arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
        [arrowImage setTag:20];
        [cell.contentView addSubview:arrowImage];
        [arrowImage release];
        
       
	if([checkStringFromAgendaView isEqualToString:@"AgendaView2"])
	{
		ImgSession *aPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row]; //section
		NSString *description = [aPromo Description];
		
		UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 13)];//35, 0, 235, 20
		timeLabel.backgroundColor = [UIColor clearColor];
		timeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12.0];
		timeLabel.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0];
		//Session *aPromo = [sessionsToDisplay objectAtIndex:indexPath.row];//section
		timeLabel.text = [aPromo Time];
		[cell.contentView addSubview:timeLabel];
		[timeLabel release];
		
		UILabel *titleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 230, 29)];//35, 0, 230, 40
		titleLabel.tag = titletag;
		titleLabel.numberOfLines = 2;
		titleLabel.font = [UIFont fontWithName:@"Arial" size:13.0];
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.textColor = [UIColor whiteColor];
		[cell.contentView addSubview:titleLabel];
		[titleLabel release];
        
		UILabel *descLabel  = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 250, 15)];
		descLabel.tag = detailtag;
		descLabel.backgroundColor = [UIColor clearColor];
		descLabel.font = [UIFont italicSystemFontOfSize:13.0];
		descLabel.textColor = [UIColor whiteColor];
//		[cell.contentView addSubview:descLabel];
		[descLabel release];
	
		
		UIImageView *CellImage = [[UIImageView alloc] init];
		CellImage.image = [UIImage imageNamed:@"agendaCellRow.png"];
		cell.backgroundView = CellImage;
		[CellImage release];
        
		if(indexPath.row == 1 || indexPath.row == 2)
		{
			/*UIImageView *jointImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 60)];
			jointImage.image = [UIImage imageNamed:@"joint_session.png"];
			[CellImage addSubview:jointImage];
			[jointImage release];*/
			
		}
        if(![description isEqualToString:@"N/A"]){
            /*UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
            arrowImage.tag = 5;
            arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
            [arrowImage setTag:20];
            [cell.contentView addSubview:arrowImage];
            [arrowImage release];*/
        }
	}
		else {
			
			Session *aPromo = [sessionsToDisplay objectAtIndex:indexPath.row]; 
			NSString *description = [aPromo Description];
			
			UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 13)];
			timeLabel.backgroundColor = [UIColor clearColor];
			timeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12.0];
			timeLabel.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0];
			timeLabel.text = [aPromo Time];
			[cell.contentView addSubview:timeLabel];
			[timeLabel release];
			
			UILabel *titleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 230, 29)];
			titleLabel.tag = titletag;
			titleLabel.numberOfLines = 2;
			titleLabel.font = [UIFont fontWithName:@"Arial" size:13.0];
			titleLabel.backgroundColor = [UIColor clearColor];
			titleLabel.textColor = [UIColor whiteColor];
			[cell.contentView addSubview:titleLabel];
			[titleLabel release];
			
			UILabel *descLabel  = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 250, 15)];
			descLabel.tag = detailtag;
			descLabel.backgroundColor = [UIColor clearColor];
			descLabel.font = [UIFont italicSystemFontOfSize:13.0];
			descLabel.textColor = [UIColor whiteColor];
//			[cell.contentView addSubview:descLabel];
			[descLabel release];
			
			
			UIImageView *CellImage = [[UIImageView alloc] init];
			CellImage.image = [UIImage imageNamed:@"agendaCellRow.png"];
			cell.backgroundView = CellImage;
			
			if(indexPath.row == 8||indexPath.row == 9|| indexPath.row == 11 ||indexPath.row == 12 ||indexPath.row == 13)
			{
				/*UIImageView *jointImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 60)];
				jointImage.image = [UIImage imageNamed:@"joint_session.png"];
				[CellImage addSubview:jointImage];
				[jointImage release];*/
				
			}
			
			
			
			if(![description isEqualToString:@"N/A"]){
				/*UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
				arrowImage.tag = 5;
				arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
				[arrowImage setTag:20];
				[cell.contentView addSubview:arrowImage];
				[arrowImage release];*/
			}
		}

	}else if([checkStringFromAgendaView isEqualToString:@"AgendaView2"]) {
		
		ImgSession *aPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row]; 
		NSString *description = [aPromo Description];
		
        UIImageView *existingArrow = (UIImageView *) [cell viewWithTag:20];
        
        if(existingArrow != nil)
            [existingArrow setHidden:YES];
        
        if(![description isEqualToString:@"N/A"]){
            if(existingArrow != nil){
                [existingArrow setHidden:NO];
            }else{
               /* UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
                arrowImage.tag = 5;
                arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
                [arrowImage setTag:20];
                [cell.contentView addSubview:arrowImage];
                [arrowImage release];*/
            }
            
        }
    }
	else {
		
		Session *aPromo = [sessionsToDisplay objectAtIndex:indexPath.row]; 
		NSString *description = [aPromo Description];
		
		UIImageView *existingArrow = (UIImageView *) [cell viewWithTag:20];
        
        if(existingArrow != nil)
            [existingArrow setHidden:YES];
        
        if(![description isEqualToString:@"N/A"]){
            if(existingArrow != nil){
                [existingArrow setHidden:NO];
            }else{
                /*UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
                arrowImage.tag = 5;
                arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
                [arrowImage setTag:20];
                [cell.contentView addSubview:arrowImage];
                [arrowImage release];*/
            }
            
        }
	}

    	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	if([checkStringFromAgendaView isEqualToString:@"AgendaView2"]) {
	
		
		ImgSession *aPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row]; 
		UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:titletag];
		UILabel *descLabel = (UILabel *)[cell.contentView viewWithTag:detailtag];
        
        CGRect newFrame;
        CGSize newSize;
        newSize =[[aPromo Session_Name] sizeWithFont:titleLabel.font constrainedToSize:CGSizeMake(230, 29) lineBreakMode:NSLineBreakByCharWrapping];
        newFrame = titleLabel.frame;
        newFrame.size.height = newSize.height;
        titleLabel.frame = newFrame;
		titleLabel.text = [aPromo Session_Name];
        
        NSString *descriptionStr = [aPromo Description];
		if([descriptionStr isEqualToString:@"N/A"])
			descriptionStr = [descriptionStr stringByReplacingOccurrencesOfString:@"N/A" withString:@" "];
		descLabel.text = [NSString stringWithFormat:@"%@", descriptionStr]; 
        
		//descLabel.text = [aPromo Description];
	}
	else {
		
		Session *aPromo = [sessionsToDisplay objectAtIndex:indexPath.row]; 
		
		UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:titletag];
		UILabel *descLabel = (UILabel *)[cell.contentView viewWithTag:detailtag];
        
        CGRect newFrame;
        CGSize newSize;
        newSize =[[aPromo Session_Name] sizeWithFont:titleLabel.font constrainedToSize:CGSizeMake(230, 29) lineBreakMode:NSLineBreakByCharWrapping];
        newFrame = titleLabel.frame;
        newFrame.size.height = newSize.height;
        titleLabel.frame = newFrame;
		titleLabel.text = [aPromo Session_Name];
		
		NSString *descriptionStr = [aPromo Description];
		if([descriptionStr isEqualToString:@"N/A"])
			descriptionStr = [descriptionStr stringByReplacingOccurrencesOfString:@"N/A" withString:@" "];
		descLabel.text = [NSString stringWithFormat:@"%@", descriptionStr]; 
	}

    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
   if([checkStringFromAgendaView isEqualToString:@"AgendaView2"]) {  
    
	   moveToImgDetailView = @"FromAgendaView2";
	   funForDetailAgenda = @"funForDetailAgenda";
	 //   ImgSession *aPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row];
		//NSString *description = [aPromo Description];
		 /* if(![description isEqualToString:@"N/A"]){*/
			//NSLog(@"Session Click N/A %@", aPromo.Session_Name);
			//NSLog(@"Descr %@", description);
			if(AgendaDetailView == nil){
				AgendaDetailView = [[AgendaDetailsViewController alloc] init];
			}
			AgendaDetailView.number  = indexPath.row;
			AgendaDetailView.agendaDetailView =[NSString stringWithFormat:@"AgendaViewController3"];
            AgendaDetailView.comeFromImgAgenda2 = [NSString stringWithFormat:@"FromAgendaView2"];
            AgendaDetailView.comeFromImgAgenda2 = [NSString stringWithFormat:@"funForDetailAgenda"];
            AgendaDetailView.is_from = TRUE;
			[self.navigationController pushViewController:AgendaDetailView animated:YES];
		/*}else{
			NSLog(@"Session Click N/A %@", aPromo.Session_Name);
			NSLog(@"Descr %@", description);
		}*/
  }
	else {
		
		moveToImgDetailView = @"FromAgendaView2";
		//Session *aPromo = [sessionsToDisplay objectAtIndex:indexPath.row];
		//NSString *description = [aPromo Description];

		/*if(![description isEqualToString:@"N/A"]){*/
			//NSLog(@"Session Click N/A %@", aPromo.Session_Name);
			//NSLog(@"Descr %@", description);
			if(AgendaDetailView == nil){
				AgendaDetailView = [[AgendaDetailsViewController alloc] init];	
			}
			AgendaDetailView.number  = indexPath.row;
			AgendaDetailView.agendaDetailView=[NSString stringWithFormat:@""];
			AgendaDetailView.comeFromImgAgenda2 = [NSString stringWithFormat:@"FromAgendaView2"];
			[self.navigationController pushViewController:AgendaDetailView animated:YES];
		/*}else{
			NSLog(@"Session Click N/A %@", aPromo.Session_Name);
			NSLog(@"Descr %@", description);
		}*/
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
    [sessionsToDisplay release];
	[sessionsToDisplayForImg release];
}


- (void)dealloc {
    [super dealloc];
}


@end

