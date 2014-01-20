//
//  SponsorDetailViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/23/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "SponsorDetailViewController.h"
#import "OrlandoAppDelegate.h"
#import "Promo.h"
#import "WebViewController.h"

@implementation SponsorDetailViewController

@synthesize Logo,number,tweetUrlString;

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.navigationController.navigationBar.hidden = YES;
	
	
	UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sponserTitle.png"]];
	self.navigationItem.titleView = imageView;
	[imageView release];
	
	UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
	[backButton setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	
	[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
	[barLeftButton release];
	[backButton release];
	
//	NSLog(@"URL STRING is---> %@", tweetUrlString);
	
	UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleLeft)];
	swipeLeft.numberOfTouchesRequired = 1;
	swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.view addGestureRecognizer:swipeLeft];
	
	UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleRight)];
	swipeRight.numberOfTouchesRequired = 1;
	swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
	[self.view addGestureRecognizer:swipeRight];
	
	
	tweetURL.hidden = YES;
    [super viewDidLoad];
}

-(void)handleLeft {
	
	if(number == [appDelegate.Sponsors count]){
		
	}
	else {
		number++ ;
		[self SetData];
	}
	
/*	if ([tweetUrlString isEqualToString:@"(null)"] || !tweetUrlString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}*/
}

-(void)handleRight {
	
	if(number == 1){
		
	}
	else {
		number-- ;
		[self SetData];
	}
	
/*	if ([tweetUrlString isEqualToString:@"(null)"] || !tweetUrlString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}*/	
}


#pragma mark 
#pragma mark backButton action

-(IBAction)main_button1:(id)sender {
    
   [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)followButton:(id)sender {

	moveToTwitterURl = @"hello tweet";
	if (aWebView == nil) {
		aWebView = [[WebViewController alloc] init];
	}
	aWebView.twitter_URl = [NSString stringWithFormat:@"%@",tweetUrlString];
	aWebView.checkURl = [NSString stringWithFormat:@"%@",moveToTwitterURl];
	[self.navigationController pushViewController:aWebView animated:YES];

}

-(void)viewWillAppear:(BOOL)animated{
	[self SetData];
	//NSLog(@"URL STRING is---> %@", tweetUrlString);
	
/*	if ([tweetUrlString isEqualToString:@"(null)"] || !tweetUrlString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}*/
}

-(void)SetData{
	
	Promo *aPromo = [appDelegate.Sponsors objectAtIndex:number-1];
	Line3.text = [aPromo Company_Name];
	Line3.textColor = [UIColor whiteColor]; //[UIColor colorWithRed:238.0/255.0 green:178.0/255.0 blue:17.0/255.0 alpha:1.0];
	
	UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"c%d",number] ofType:@"png"]];
	[Logo setImage:img];
	self.Logo.contentMode = UIViewContentModeScaleAspectFit;
   // NSLog(@"C%d.png",number);
	//Line1.text = [aPromo Address];
	//Line2.text = [NSString stringWithFormat:@"%@ %@ %@",[aPromo City],[aPromo State],[aPromo Zip_Code]];
	Line4.text = [aPromo URL];
	//tweetURL.text = [aPromo TwitterURL];
	//tweetUrlString = tweetURL.text;*/
	

}

-(IBAction)Next{
	
	if(number == [appDelegate.Sponsors count]){
		
	}
	else {
		number++ ;
		[self SetData];
	}
	
/*	if ([tweetUrlString isEqualToString:@"(null)"] || !tweetUrlString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}*/

}
-(IBAction)Prev{
	if(number == 1){
		
	}
	else {
		number-- ;
		[self SetData];
	}
	
/*	if ([tweetUrlString isEqualToString:@"(null)"] || !tweetUrlString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}*/
}

-(IBAction)OpenSite{
	Promo *aPromo = [appDelegate.Sponsors objectAtIndex:number-1];
	NSString *URL = [NSString stringWithFormat:@"http://%@",[aPromo URL]];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
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
