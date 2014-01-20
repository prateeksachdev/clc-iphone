//
//  AgendaViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "AgendaViewController3.h"
#import "AgendaDetailsViewController.h"
#import "OrlandoAppDelegate.h"
#import "Session.h"
#import "ImgSession.h"
#import "AgendaViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation AgendaViewController3
@synthesize checkStringFromAgendaView3,checkStringToAgendaDetailViewFromAgenda3;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {

	self.view.backgroundColor = [UIColor whiteColor];
	
	//NSLog(@"checkStringFromAgendaView3---> %@",checkStringFromAgendaView3);
	
	
	if([checkStringFromAgendaView3 isEqualToString:@"AgendaViewController3"])
	{
		checkStringToAgendaDetailViewFromAgenda3 = @"FromAgendaView3";
		
		appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
		sessionsToDisplay1ForImg = [[NSMutableArray alloc] init];
	  
		for (ImgSession *session in appDelegate.ImgSessions) {
			if ([session.Date isEqualToString:@"2013-05-16"]) 
				[sessionsToDisplay1ForImg addObject:session];
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
		sessionsToDisplay1 = [[NSMutableArray alloc] init];
		
		for (Session *session in appDelegate.Sessions) {
			if ([session.Date isEqualToString:@"2013-05-16"])
				[sessionsToDisplay1 addObject:session];
		}
		
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 21, 120, 15)];
        img_titleView.image = [UIImage imageNamed:@"clcTitle.png"];
        [navImage addSubview:img_titleView];
        [img_titleView release];
		
		/*UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 19)];
		headerImage.image = [UIImage imageNamed:@"headerBar.png"];
		[self.view addSubview:headerImage];*/
		
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
#pragma mark backButton action

-(IBAction)backButton:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {

    self.navigationController.navigationBar.hidden = YES;
    
	UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 57, 320, 20)];
	headerImage.image = [UIImage imageNamed:@"headerBar.png"];
    headerImage.userInteractionEnabled = YES;
	[self.view addSubview:headerImage];
	
	UILabel *dayDateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(110, 3, 160, 15)];//35, 0, 230, 40
	dayDateLabel.numberOfLines = 1;
	dayDateLabel.font = [UIFont boldSystemFontOfSize:12];
	dayDateLabel.backgroundColor = [UIColor clearColor];
	dayDateLabel.textColor = [UIColor whiteColor];
	dayDateLabel.text = @"THURSDAY, MAY 16";
	//[headerImage addSubview:dayDateLabel];
    
    UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 4, 124, 11)];
    img_titleView.image = [UIImage imageNamed:@"thursday.png"];
    img_titleView.contentMode = UIViewContentModeScaleAspectFit;
    [headerImage addSubview:img_titleView];
    //[img_titleView release];
	
	
	UIButton* headerArrowImageButtonForBack = [UIButton buttonWithType:UIButtonTypeCustom];
	headerArrowImageButtonForBack.frame = CGRectMake(20, -20, 95, 60);//250, -20, 95, 60
	[headerArrowImageButtonForBack setBackgroundColor:[UIColor clearColor]];
	[headerArrowImageButtonForBack setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
	[headerArrowImageButtonForBack setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
	[headerArrowImageButtonForBack setImage:[UIImage imageNamed:@"whiteAccessary_Back.png"] forState:UIControlStateNormal];
	[headerArrowImageButtonForBack addTarget:self action:@selector(headerArrowImageButtonClickedForBack:) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:headerArrowImageButtonForBack];
//	[self.view bringSubviewToFront:headerArrowImageButtonForBack];
    [headerImage addSubview:headerArrowImageButtonForBack];

	
    [super viewWillAppear:animated];
}

#pragma mark 
#pragma mark headerArrowImageButtonClickedForBack Action 

-(void)headerArrowImageButtonClickedForBack:(id)sender {

	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)SetButtons:(id)sender{

}





-(void)viewWillDisappear:(BOOL)animated{

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

	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if([checkStringFromAgendaView3 isEqualToString:@"AgendaViewController3"])
    {
		return [sessionsToDisplay1ForImg count];
	}
	else {
		return [sessionsToDisplay1 count];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 0.0; 	
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return  0.0;	
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @" ";	
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 65;
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
		static NSString *CellIdentifier = nil;
		static NSInteger titletag = 1;
		static NSInteger detailtag = 2;
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            
            UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
            arrowImage.tag = 5;
            arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
            [arrowImage setTag:20];
            [cell.contentView addSubview:arrowImage];
            [arrowImage release];

			
		if([checkStringFromAgendaView3 isEqualToString:@"AgendaViewController3"])	
		{
			ImgSession *imgPromo = [sessionsToDisplay1ForImg objectAtIndex:indexPath.row]; 
			NSString *description = [imgPromo Description];
			
			UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 13)];
			timeLabel.backgroundColor = [UIColor clearColor];
			timeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12.0];
			timeLabel.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0];
			timeLabel.text = [imgPromo Time];
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
			[CellImage release];
			
			
			
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
			
				Session *aPromo = [sessionsToDisplay1 objectAtIndex:indexPath.row]; //
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
//				[cell.contentView addSubview:descLabel];
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

		
	}else{
 
			if([checkStringFromAgendaView3 isEqualToString:@"AgendaViewController3"])
			{
				ImgSession *imgPromo = [sessionsToDisplay1ForImg objectAtIndex:indexPath.row]; 
				NSString *description = [imgPromo Description];
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
		
		else {
			
			Session *aPromo = [sessionsToDisplay1 objectAtIndex:indexPath.row];
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

    }
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	
	if([checkStringFromAgendaView3 isEqualToString:@"AgendaViewController3"])
	{
		ImgSession *imgPromo = [sessionsToDisplay1ForImg objectAtIndex:indexPath.row]; 

		UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:titletag];
		UILabel *descLabel = (UILabel *)[cell.contentView viewWithTag:detailtag];
        
        CGRect newFrame;
        CGSize newSize;
        
        newSize =[[imgPromo Session_Name] sizeWithFont:titleLabel.font constrainedToSize:CGSizeMake(230, 29) lineBreakMode:NSLineBreakByCharWrapping];
        newFrame = titleLabel.frame;
        newFrame.size.height = newSize.height;
        titleLabel.frame = newFrame;
		titleLabel.text = [imgPromo Session_Name];

        
        NSString *descriptionStr = [imgPromo Description];
		if([descriptionStr isEqualToString:@"N/A"])
			descriptionStr = [descriptionStr stringByReplacingOccurrencesOfString:@"N/A" withString:@" "];
           descriptionStr = [descriptionStr stringByReplacingOccurrencesOfString:@";" withString:@""];
		descLabel.text = [NSString stringWithFormat:@"%@", descriptionStr];  
        
        
		//descLabel.text = [imgPromo Description];
	}
	
	else {
	
		Session *aPromo = [sessionsToDisplay1 objectAtIndex:indexPath.row];

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
    
    	
    // Configure the cell...
    
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
 

	if([checkStringFromAgendaView3 isEqualToString:@"AgendaViewController3"])
	{
		//ImgSession *imgPromo = [sessionsToDisplay1ForImg objectAtIndex:indexPath.row];
		
		//NSString *description = [imgPromo Description];
       // NSLog(@"The Description is: %@",description);

		/*if(![description isEqualToString:@"N/A"]){*/
			if(AgendaDetailView == nil){
				AgendaDetailView = [[AgendaDetailsViewController alloc] init];	
			}
			AgendaDetailView.number  = indexPath.row;
			AgendaDetailView.agendaDetailView = [NSString stringWithFormat:@"%@",checkStringToAgendaDetailViewFromAgenda3];
        AgendaDetailView.comeFromImgAgenda3 = [NSString stringWithFormat:@"%@",checkStringToAgendaDetailViewFromAgenda3];
			[self.navigationController pushViewController:AgendaDetailView animated:YES];
		/*}
		else{
			NSLog(@"Session Click N/A %@", imgPromo.Session_Name);
			NSLog(@"Descr %@", description);
		}*/
	}
	
	else {
		
		moveToImgDetailView = @"FromAgendaView3";
		//Session *aPromo = [sessionsToDisplay1 objectAtIndex:indexPath.row];
		//NSString *description = [aPromo Description];
       // NSLog(@"The Description is: %@",description);
		
		/*if(![description isEqualToString:@"N/A"]){*/
			if(AgendaDetailView == nil){
				AgendaDetailView = [[AgendaDetailsViewController alloc] init];	
			}
			AgendaDetailView.number  = indexPath.row;
			AgendaDetailView.agendaDetailView=[NSString stringWithFormat:@""];
			 AgendaDetailView.comeFromImgAgenda3 = [NSString stringWithFormat:@"FromAgendaView3"];
			[self.navigationController pushViewController:AgendaDetailView animated:YES];
		//}
		/*else{
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
    [sessionsToDisplay1 release];
}


- (void)dealloc {
    [super dealloc];
}


@end

