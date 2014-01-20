//
//  SponsersViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/23/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "SponsersViewController.h"
#import "SponsorDetailViewController.h"
#import "Promo.h"
#import "OrlandoAppDelegate.h"

@implementation SponsersViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
//	self.tableView.rowHeight = 70; 
//	self.tableView.separatorColor = [UIColor whiteColor];
	self.view.backgroundColor = [UIColor whiteColor];
	appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication]delegate];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	

	
	UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sponserTitle.png"]];
	self.navigationItem.titleView = imageView;
	[imageView release];
	
	UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
	[backButton setBackgroundImage:[UIImage imageNamed:@"main.png"] forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	
	[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
	[barLeftButton release];
	[backButton release];
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
    return [appDelegate.Sponsors count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = nil;
	static NSInteger Imagetag = 1;
	static NSInteger titletag = 1;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    
		UIImageView *CellImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sponserbrand_blank.png"]];// Cell-Button1.png  
		cell.backgroundView = CellImage;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIImageView *LogoImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12, 57, cell.frame.size.height)];//cell.frame.size.width
		LogoImage.tag = Imagetag;
		LogoImage.contentMode = UIViewContentModeScaleAspectFit;
		LogoImage.backgroundColor = [UIColor clearColor];
		
		UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"d%d",indexPath.row+1] ofType:@"png"]];
		LogoImage.image = img;
		[cell.contentView addSubview:LogoImage];
		[LogoImage release];
		
		UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessary.png"]];//arrow
		arrowImage.frame = CGRectMake(280, 30, 19, 12);
		[cell.contentView addSubview:arrowImage];
		
		
		
		UILabel *titleLabel = [[UILabel alloc] init]; 
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.textColor = [UIColor whiteColor];  //[UIColor colorWithRed:243.0/255.0 green:178.0/255.0 blue:64.0/255.0 alpha:1.0];
		titleLabel.frame = CGRectMake(85, 24, 190, 25);
		titleLabel.font = [UIFont fontWithName:@"Arial Bold" size:14.0];
		titleLabel.textAlignment = UITextAlignmentLeft;
		titleLabel.tag = titletag;
		titleLabel.text = [NSString stringWithFormat:@"%@",[[appDelegate.Sponsors objectAtIndex:indexPath.row] valueForKey:@"Company_Name"]];
		[cell.contentView addSubview:titleLabel];
		
		[titleLabel release];
		urlString = [NSString stringWithFormat:@"%@",[[appDelegate.Sponsors objectAtIndex:indexPath.row] valueForKey:@"TwitterURL"]];

		

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


	if(sponcerDetails == nil){
		sponcerDetails = [[SponsorDetailViewController alloc] init];	
	}
	sponcerDetails.number = indexPath.row+1;
	sponcerDetails.tweetUrlString = [NSString stringWithFormat:@"%@",[[appDelegate.Sponsors objectAtIndex:indexPath.row] valueForKey:@"TwitterURL"]];
	
	//NSLog(@"sponcerDetails.tweetUrlString---->%@", sponcerDetails.tweetUrlString);
	[self.navigationController pushViewController:sponcerDetails animated:YES];
    
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

