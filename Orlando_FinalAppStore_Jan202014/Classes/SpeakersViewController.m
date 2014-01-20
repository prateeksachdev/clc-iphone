//
//  SpeakersViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "SpeakersViewController.h"
#import "OrlandoAppDelegate.h"
#import "Speakers.h"
#import "SpeakerDetailsViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation SpeakersViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {

	appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	
	IndexArray = [[NSMutableArray alloc] init];
	[IndexArray addObject:@"A"];
	[IndexArray addObject:@"B"];
	[IndexArray addObject:@"C"];
	[IndexArray addObject:@"D"];
	[IndexArray addObject:@"E"];
	[IndexArray addObject:@"F"];
	[IndexArray addObject:@"G"];
	[IndexArray addObject:@"H"];
	[IndexArray addObject:@"I"];
	[IndexArray addObject:@"J"];
	[IndexArray addObject:@"K"];
	[IndexArray addObject:@"L"];
	[IndexArray addObject:@"M"];
	[IndexArray addObject:@"N"];
	[IndexArray addObject:@"O"];
	[IndexArray addObject:@"P"];
	[IndexArray addObject:@"Q"];
	[IndexArray addObject:@"R"];
	[IndexArray addObject:@"S"];
	[IndexArray addObject:@"T"];
	[IndexArray addObject:@"U"];
	[IndexArray addObject:@"V"];
	[IndexArray addObject:@"W"];
	[IndexArray addObject:@"X"];
	[IndexArray addObject:@"Y"];
	[IndexArray addObject:@"Z"];
	
 
	/*UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speakerTitle.png"]];
	self.navigationItem.titleView = imageView;
	[imageView release];*/
	
	/*UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
	[backButton setBackgroundImage:[UIImage imageNamed:@"main.png"] forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	
	[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
	[barLeftButton release];
	[backButton release];*/

    
	[super viewDidLoad];

}

#pragma mark 
#pragma mark backButton action

-(IBAction)main_button:(id)sender {
   
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
	self.navigationController.navigationBar.hidden = YES;
    [super viewWillAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
//	self.navigationController.navigationBar.hidden = NO;
	
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
   
       return [appDelegate.Speakers count];
}

 
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
		static NSString *CellIdentifier = @"Cell";
		static NSInteger titletag = 1;
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
        UIImageView *CellImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speakerCell.png"]];// Cell-Button1.png
			
			cell.backgroundView = CellImage;
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			UILabel *titleLabel = [[UILabel alloc] init]; 
			titleLabel.backgroundColor = [UIColor clearColor];
			titleLabel.textColor = [UIColor whiteColor];// [UIColor colorWithRed:238.0/255.0 green:178.0/255.0 blue:17.0/255.0 alpha:1.0];
			titleLabel.frame = CGRectMake(40, 12, 230, 34);
			titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:16.0];
			titleLabel.tag = titletag;
			[cell.contentView addSubview:titleLabel];
			[titleLabel release];
			
			UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];
			arrowImage.frame = CGRectMake(280, 19, 19, 12 );// 250, 15, 12, 15
			[cell.contentView addSubview:arrowImage];
		}
		
		UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:titletag];
		Speakers *aSpeakers = [appDelegate.Speakers objectAtIndex:indexPath.row];
		titleLabel.text = [NSString stringWithFormat:@"%@, %@",aSpeakers.Last_Name,aSpeakers.First_Name];
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
	
	if (SpeakerDetailsView == nil) {
			SpeakerDetailsView = [[SpeakerDetailsViewController alloc] init];
		}

	SpeakerDetailsView.number = indexPath.row;
	urlString = [[appDelegate.Speakers objectAtIndex:indexPath.row] valueForKey:@"URL"];
	SpeakerDetailsView.twitterURLString = [NSString stringWithFormat:@"%@", urlString];
	[self.navigationController pushViewController:SpeakerDetailsView animated:YES];
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
}


- (void)dealloc {
    [super dealloc];
}


@end

