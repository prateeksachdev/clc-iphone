//
//  AgendaViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "AgendaViewController.h"
#import "AgendaDetailsViewController.h"
#import "OrlandoAppDelegate.h"
#import "Session.h"
#import "ImgSession.h"
#import "AgendaViewController2.h"
#import "AgendaViewController3.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation AgendaViewController
@synthesize checkString;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    

	self.view.backgroundColor = [UIColor whiteColor];

	
			//checkStringForDetailView = @"AgendaDetailsViewController";
	
			if([checkString isEqualToString:@"ImgAgenda"])
			{
				checkStringForAgenda2 = @"AgendaView2";
				// What date are we loading
			//	NSDate *today1 = [NSDate date];
				NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
				[dateFormat setDateFormat:@"EEEE,MMM dd "]; //  dd/MM/yyyy :EEEE
				
				//NSString *dateString11 = [dateFormat stringFromDate:today1];
				
				//NSString *str = [dateString11 uppercaseString];
				
				//NSLog(@"date---->: %@", str);
				
				//	self.title = @"Tuesday, June 14th";
				
		
                UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 21, 120, 15)];
                img_titleView.image = [UIImage imageNamed:@"imgTitle.png"];
                [navImage addSubview:img_titleView];
                [img_titleView release];
				
				appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
				
				sessionsToDisplayForImg = [[NSMutableArray alloc] init];
				
				//for (Session *session in appDelegate.Sessions) {
//					if ([session.Date isEqualToString:@"2012-05-21"])
//						[sessionsToDisplay addObject:session];
//				}
				for (ImgSession *imgSession in appDelegate.ImgSessions) {
					if ([imgSession.Date isEqualToString:@"2013-05-14"])//2013-05-14 //||[imgSession.Date isEqualToString:@"2012-05-23"]||[imgSession.Date isEqualToString:@"2012-05-24"])
						[sessionsToDisplayForImg addObject:imgSession];
				}
				
			}
		else 
		{
			// What date are we loading
		//	NSDate *today1 = [NSDate date];
			NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
			[dateFormat setDateFormat:@"EEEE,MMM dd"];//  dd/MM/yyyy :EEEE
			
		//	NSString *dateString11 = [dateFormat stringFromDate:today1];
			
		//	NSString *str = [dateString11 uppercaseString];
			
		//	NSLog(@"date: %@", str);
			
            UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 21, 120, 15)];
            img_titleView.image = [UIImage imageNamed:@"clcTitle.png"];
            [navImage addSubview:img_titleView];
            [img_titleView release];
            
			appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];

			sessionsToDisplay = [[NSMutableArray alloc] init];
			
			
				for (Session *session in appDelegate.Sessions) {
					if ([session.Date isEqualToString:@"2013-05-14"])//2013-05-15 //||[session.Date isEqualToString:@"2012-05-23"]||[session.Date isEqualToString:@"2012-05-24"])
						[sessionsToDisplay addObject:session];
				}
		}
		
	
		[super viewDidLoad];
}
-(IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {
	
    self.navigationController.navigationBar.hidden = YES;
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:78.0/255.0 green:107.0/255.0 blue:124.0/255.0 alpha:1.0];
    
	if([checkString isEqualToString:@"ImgAgenda"]) {
	
		RecordNumber = 0;
		appDelegate.dateOnFocus=@"2013-05-14"; // 100,21,120,15
		self.title = @"Tuesday, June 14";
		
		UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 57, 320, 20)];
		headerImage.image = [UIImage imageNamed:@"headerBar.png"];
        headerImage.userInteractionEnabled = YES;
		[self.view addSubview:headerImage];
		
		
		UILabel *dayDateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(110, 3, 160, 15)];
		dayDateLabel.numberOfLines = 1;
		dayDateLabel.font = [UIFont boldSystemFontOfSize:12];
		dayDateLabel.backgroundColor = [UIColor clearColor];
		dayDateLabel.textColor = [UIColor whiteColor];
		dayDateLabel.text = @"TUESDAY, MAY 14"; //@"TUESDAY, MAY 14";
		//[headerImage addSubview:dayDateLabel];
        
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 4, 124, 11)];
        img_titleView.image = [UIImage imageNamed:@"tuesday.png"];
        img_titleView.contentMode = UIViewContentModeScaleAspectFit;
        [headerImage addSubview:img_titleView];
        [img_titleView release];
        
        
		
		UIButton* headerArrowImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		headerArrowImageButton.frame = CGRectMake(240, -20, 95, 60);
		[headerArrowImageButton setBackgroundColor:[UIColor clearColor]];
		[headerArrowImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
		[headerArrowImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[headerArrowImageButton setImage:[UIImage imageNamed:@"whiteAccessary.png"] forState:UIControlStateNormal];
		[headerArrowImageButton addTarget:self action:@selector(headerArrowImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//		[self.view addSubview:headerArrowImageButton];
//		[self.view bringSubviewToFront:headerArrowImageButton];
        [headerImage addSubview:headerArrowImageButton];
		
		[headerImage release];
		[dayDateLabel release];
		
//		self.navigationController.navigationBar.hidden = YES;
//		self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:78.0/255.0 green:107.0/255.0 blue:124.0/255.0 alpha:1.0];

		
	}
	else {
		RecordNumber = 0;
		appDelegate.dateOnFocus = @"2013-05-14";//2013-05-15
		
		UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 57, 320, 20)];
		headerImage.image = [UIImage imageNamed:@"headerBar.png"];
        headerImage.userInteractionEnabled = YES;
		[self.view addSubview:headerImage];
		
		
		UILabel *dayDateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(110, 3, 160, 15)];//35, 0, 230, 40
		dayDateLabel.numberOfLines = 1;
		dayDateLabel.font = [UIFont boldSystemFontOfSize:12];
		dayDateLabel.backgroundColor = [UIColor clearColor];
		dayDateLabel.textColor = [UIColor whiteColor];
		dayDateLabel.text = @"TUESDAY, MAY 14";
//		[headerImage addSubview:dayDateLabel];
        
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 4, 124, 11)];
        img_titleView.image = [UIImage imageNamed:@"tuesday.png"];
        img_titleView.contentMode = UIViewContentModeScaleAspectFit;
        [headerImage addSubview:img_titleView];
        [img_titleView release];
		
		UIButton* headerArrowImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		headerArrowImageButton.frame = CGRectMake(240, -20, 95, 60);// 240, 0, 75, 20
		[headerArrowImageButton setBackgroundColor:[UIColor clearColor]];
		[headerArrowImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
		[headerArrowImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[headerArrowImageButton setImage:[UIImage imageNamed:@"whiteAccessary.png"] forState:UIControlStateNormal];
		[headerArrowImageButton addTarget:self action:@selector(headerArrowImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//		[self.view addSubview:headerArrowImageButton];
//		[self.view bringSubviewToFront:headerArrowImageButton];
        [headerImage addSubview:headerArrowImageButton];
		
		[headerImage release];
		[dayDateLabel release];

//		self.navigationController.navigationBar.hidden = NO;
//		self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:78.0/255.0 green:107.0/255.0 blue:124.0/255.0 alpha:1.0];
		
	}

    
	[super viewWillAppear:animated];
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
 
    if([checkString isEqualToString:@"ImgAgenda"])
	{
		return 1;
	}
	else {
		return 1;
	}
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
	
	if([checkString isEqualToString:@"ImgAgenda"])
	{
		return [sessionsToDisplayForImg count];
	}
	else {
		return [sessionsToDisplay count];
	}
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 0.0; 	
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 0.0; 	
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @" ";	
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 5)];
	headerView.backgroundColor = [UIColor clearColor];
	return headerView;
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
    
		
		if ([checkString isEqualToString:@"ImgAgenda"]) {
			
			ImgSession *imgPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row]; //section
			NSString *description = [imgPromo Description];
			
			UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 13)];//35, 0, 235, 20
			timeLabel.backgroundColor = [UIColor clearColor];
			timeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12.0];
			timeLabel.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0]; //UIColorFromRGB(0x567E7E);
			timeLabel.text = [imgPromo Time];
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
//			[cell.contentView addSubview:descLabel];
			[descLabel release];
			UIImageView *CellImage = [[UIImageView alloc] init];
			CellImage.image = [UIImage imageNamed:@"agendaCellRow.png"]; 
			cell.backgroundView = CellImage;
			[CellImage release];
			
			if(indexPath.row == 0||indexPath.row == 1|| indexPath.row == 2 ||indexPath.row == 4 ||indexPath.row == 5 || indexPath.row==6)
			{
				UIImageView *jointImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 60)];
				jointImage.image = [UIImage imageNamed:@"joint_session.png"];
				//[CellImage addSubview:jointImage];
				[jointImage release];
				
			}
			if(![description isEqualToString:@"N/A"]){
			//	NSLog(@"Session Arrow %@", imgPromo.Session_Name);
			//	NSLog(@"Descr %@", description);
				UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
				arrowImage.tag = 5;
				arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
				[arrowImage setTag:20];
				//[cell.contentView addSubview:arrowImage];
				
				[arrowImage release];
			}
		}
		else
		{
			
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
			[CellImage release];
			
			if(![description isEqualToString:@"N/A"]){
				//NSLog(@"Session Arrow %@", aPromo.Session_Name);
				//NSLog(@"Descr %@", description);
				UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
				arrowImage.tag = 5;
				arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
				[arrowImage setTag:20];
				//[cell.contentView addSubview:arrowImage];
				
				[arrowImage release];
			}
		}
			
		}else{
			
			if([checkString isEqualToString:@"ImgAgenda"]) 
			{
				ImgSession *imgPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row]; 
				NSString *description = [imgPromo Description];
				
				UIImageView *existingArrow = (UIImageView *) [cell viewWithTag:20];
				
				if(existingArrow != nil)
					[existingArrow setHidden:YES];
				
				if(![description isEqualToString:@"N/A"]){
					if(existingArrow != nil){
						[existingArrow setHidden:NO];
					}else{
						UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]]; 
						arrowImage.tag = 5;
						arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
						[arrowImage setTag:20];
						//[cell.contentView addSubview:arrowImage];
						[arrowImage release];
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
						UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]]; 
						arrowImage.tag = 5;
						arrowImage.frame = CGRectMake(280, 25.5, 19, 12);
						[arrowImage setTag:20];
						//[cell.contentView addSubview:arrowImage];
						[arrowImage release];
					}
					
				}
			}

		}
    
	if ([checkString isEqualToString:@"ImgAgenda"]) {
		
		ImgSession *imgPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row]; 

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
		descLabel.text = [NSString stringWithFormat:@"%@", descriptionStr];
        
		//descLabel.text = [imgPromo Description];
		
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
		
	cell.selectionStyle = UITableViewCellSelectionStyleNone;

	    // Configure the cell...
    
    return cell;
}

#pragma mark
#pragma mark headerArrowImageButton action 

-(void)headerArrowImageButtonClicked:(id)sender {

	AgendaViewController2 *AgendaView = [[AgendaViewController2 alloc] init];
	
	if([checkString isEqualToString:@"ImgAgenda"])
	{
		AgendaView.checkStringFromAgendaView = [NSString stringWithFormat:@"%@",checkStringForAgenda2];
	}
	
	[self.navigationController pushViewController:AgendaView animated:YES];

	[AgendaView release]; 
	

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


	if([checkString isEqualToString:@"ImgAgenda"])
	{
		moveToForDetailViewFromImg = @"FomAgendaView";
	//	ImgSession *imgPromo = [sessionsToDisplayForImg objectAtIndex:indexPath.row];
	//	NSString *description = [imgPromo Description];

		/*if(![description isEqualToString:@"N/A"]){*/
			//NSLog(@"Session Click N/A %@", imgPromo.Session_Name);
			//NSLog(@"Descr %@", description);
            AgendaDetailView = [[AgendaDetailsViewController alloc] init];	
			AgendaDetailView.number  = indexPath.row;
			AgendaDetailView.agendaDetailView=[NSString stringWithFormat:@"AgendaViewController3"];
			AgendaDetailView.comeFromImgdetailView = [NSString stringWithFormat:@"%@",moveToForDetailViewFromImg];
			
			[self.navigationController pushViewController:AgendaDetailView animated:YES];
		/*}else{
			NSLog(@"Session Not Click N/A %@", imgPromo.Session_Name);
		}*/
	}
	else {
		
		moveToForDetailViewFromImg = @"FomAgendaView";
		//Session *aPromo = [sessionsToDisplay objectAtIndex:indexPath.row];
		//NSString *description = [aPromo Description];
		
		/*if(![description isEqualToString:@"N/A"]){*/
			//NSLog(@"Session Click N/A %@", aPromo.Session_Name);
			//NSLog(@"Descr %@", description);
				AgendaDetailView = [[AgendaDetailsViewController alloc] init];	
			AgendaDetailView.number  = indexPath.row;
			AgendaDetailView.agendaDetailView=[NSString stringWithFormat:@""];
			AgendaDetailView.comeFromImgdetailView = [NSString stringWithFormat:@"%@",moveToForDetailViewFromImg];
			[self.navigationController pushViewController:AgendaDetailView animated:YES];
		/*}else{
			NSLog(@"Session Not Click N/A %@", aPromo.Session_Name);
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

