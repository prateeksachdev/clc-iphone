//
//  HotelInfoViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "HotelInfoViewController.h"
#import "MapViewController.h"

@implementation HotelInfoViewController

@synthesize scrollView;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

#pragma 

#pragma phoneNumber Button Action 

-(IBAction)phoneNumber:(id)sender {

    NSString *phoneNumberStr = @"4049469000";
    
    NSString *telString = [NSString stringWithFormat:@"tel:%@", phoneNumberStr];

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:telString]];
    
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];
    
   // self.view.backgroundColor=[UIColor colorWithRed:38.0/255.0 green:75.0/255.0 blue:142.0/255.0 alpha:1.0];
    
	//self.title = @"Hotel/Area Info";
	self.navigationController.navigationBar.hidden = YES;
	
/*	UIImageView* titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hotelTitle.png"]];
	self.navigationItem.titleView = titleImageView;
	[titleImageView release];
	
	UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
	[backButton setBackgroundImage:[UIImage imageNamed:@"main.png"] forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	
	[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
	[barLeftButton release];
	[backButton release];*/
	
	scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,148,320,311)];
	scrollView.delegate = self;
	scrollView.scrollEnabled = YES;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.showsHorizontalScrollIndicator = YES;
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
	scrollView.userInteractionEnabled = YES;
	scrollView.maximumZoomScale = 2.0;
	scrollView.minimumZoomScale = 1.0;
	[self.view addSubview:scrollView];
	
	
	UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.scrollView addGestureRecognizer:doubleTap];
    [doubleTap release];
	
	
	imageView = [[UIImageView alloc]init];
	imageView.frame = CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height);
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	imageView.userInteractionEnabled = YES;
	imageView.image = [UIImage imageNamed:@"hotel_map_01.png"];
	[scrollView addSubview:imageView];

}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer 
{      
    if(self.scrollView.zoomScale > self.scrollView.minimumZoomScale)
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES]; 
    else 
        [self.scrollView setZoomScale:self.scrollView.maximumZoomScale animated:YES];
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)ScrollView {

	return imageView;
}

#pragma mark 
#pragma mark Button action

-(IBAction)main_button:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(IBAction)ViewMap{
		
		if(MapView == nil){
			MapView = [[MapViewController alloc] init];	
		}
		[self.navigationController pushViewController:MapView animated:YES];
}

-(IBAction)SendMail{
	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	[picker setToRecipients:[NSArray arrayWithObjects:@"mcowc.info@marriott.com",nil]];
	[self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
	
	[self presentModalViewController:picker animated:YES];
	
	[picker release];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail Notification" message:@"Your Mail has been Sent" delegate:nil cancelButtonTitle:@"Thank You" otherButtonTitles:nil];
	switch (result) {
		case MFMailComposeResultCancelled :
			[self dismissModalViewControllerAnimated:YES];
			break;
		case MFMailComposeResultSent :
			[alert show];
			[self dismissModalViewControllerAnimated:YES];
			break;
		default:
			break;
	}
	[alert release];
	
}

-(IBAction)ViewSite{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://marriottworldcenter.com"]];
}
-(IBAction)Call{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:1-800-380-7931"]];
}

-(void)viewWillAppear:(BOOL)animated{
	self.navigationController.navigationBar.hidden = YES;
}
-(IBAction)VisitOrlando{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://visitorlando.com"]];
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
