//
//  SpeakerDetailsViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "SpeakerDetailsViewController.h"
#import "OrlandoAppDelegate.h"
#import "AgendaDetailsViewController.h"
#import "Speakers.h"
#import "SpeakerWebView.h"

@implementation SpeakerDetailsViewController

@synthesize number,commonTwitterURLString,twitterURLString,imageView;

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
	detailText.font = [UIFont fontWithName:@"Arial" size:11];
	
	//followButton.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    
    //NSLog(@"twitterURLString sfsd---> %@",twitterURLString);
	commonTwitterURLString = @"https://mobile.twitter.com/#!/";
    

    
	UIImageView* imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speakerTitle.png"]];
	self.navigationItem.titleView = imageView1;
	[imageView1 release];
	
	UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
	[backButton setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	
	[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
	[barLeftButton release];
	[backButton release];
	
	UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleLeft)];
	swipeLeft.numberOfTouchesRequired = 1;
	swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.view addGestureRecognizer:swipeLeft];
	
	UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleRight)];
	swipeRight.numberOfTouchesRequired = 1;
	swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
	[self.view addGestureRecognizer:swipeRight];
 
    [super viewDidLoad];
}

-(void)handleLeft {

	if(number == [appDelegate.Speakers count]-1){
		
	}
	else {
		number++ ;
		[self SetData];
	}
	
	//NSLog(@"FinaltwitterURLString sfsd---> %@",FinaltwitterURLString);
	commonTwitterURLString = @"https://mobile.twitter.com/#!/";
	
	if ([FinaltwitterURLString isEqualToString:@""] || !FinaltwitterURLString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}
	

}

-(void)handleRight {

	if(number == 0){
		
	}
	else {
		number-- ;
		[self SetData];
	}
	
	//NSLog(@"FinaltwitterURLString sfsd---> %@",FinaltwitterURLString);
	commonTwitterURLString = @"https://mobile.twitter.com/#!/";
	
	if ([FinaltwitterURLString isEqualToString:@""] || !FinaltwitterURLString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}

}

-(IBAction)back_button:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{

    if ([twitterURLString isEqualToString:@""] || !twitterURLString) {//(null)
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}

    
	[self SetData];
    
    
}

-(void)SetData{

	Speakers *aPromo = [appDelegate.Speakers objectAtIndex:number];
	self.title = [NSString stringWithFormat:@"%@ %@",aPromo.First_Name,aPromo.Last_Name];
	SpeakerName.text = [NSString stringWithFormat:@"%@ %@",aPromo.First_Name,aPromo.Last_Name];
	SpeakerName.textColor = [UIColor whiteColor]; //[UIColor colorWithRed:238.0/255.0 green:178.0/255.0 blue:17.0/255.0 alpha:1.0];
	Role.text = [aPromo Title];
	Organization.text = [aPromo Institution];
	Organization.textColor = [UIColor whiteColor]; //[UIColor colorWithRed:238.0/255.0 green:178.0/255.0 blue:17.0/255.0 alpha:1.0];
	detailText.text = [aPromo Bio];
	
	FinaltwitterURLString = [aPromo URL];

	
    UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",aPromo.Last_Name] ofType:@"png"]];
    
	[imageView setImage:img];
    
	NSArray *speakerArray = [aPromo.Sessions componentsSeparatedByString:@","];

	
	if([[aPromo Sessions] isEqualToString:@"N/A"] || [[aPromo Sessions] isEqualToString:@""]){
		
	}
	else {
		
		for(NSInteger i=0;i<[speakerArray count];i++){
			NSUInteger sid = [[[speakerArray objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue];
		//	NSLog(@"%d -->",sid);
			if(sid <= [appDelegate.Sessions count]){
				sessionNumber = sid;
			}
		}
	}
}

-(IBAction)Next{
	if(number == [appDelegate.Speakers count]-1){
		
	}
	else {
		number++ ;
		[self SetData];
	}
	
	//NSLog(@"FinaltwitterURLString sfsd---> %@",FinaltwitterURLString);
	commonTwitterURLString = @"https://mobile.twitter.com/#!/";
	
	if ([FinaltwitterURLString isEqualToString:@""] || !FinaltwitterURLString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}
	
}
-(IBAction)Prev{

	if(number == 0){
		
	}
	else {
		number-- ;
		[self SetData];
	}

	//NSLog(@"FinaltwitterURLString sfsd---> %@",FinaltwitterURLString);
	commonTwitterURLString = @"https://mobile.twitter.com/#!/";
	
	if ([FinaltwitterURLString isEqualToString:@""] || !FinaltwitterURLString) {
		
		followButton.hidden = YES;
	}
	else {
		followButton.hidden = NO;
	}
}

-(IBAction)ShowSession{
    
    appDelegate.allDates = @"ALL_DATES";
	if(AgendaDetailView == nil){
		AgendaDetailView = [[AgendaDetailsViewController alloc] init];	
	}
	AgendaDetailView.number = sessionNumber-1;
	[self.navigationController pushViewController:AgendaDetailView animated:YES];
}

-(IBAction)followButton:(id)sender {
	
    commonTwitterURLString = @"https://mobile.twitter.com/#!/";
	NSString *final_twitterURLString = [commonTwitterURLString stringByAppendingString:FinaltwitterURLString];

	SpeakerWebView *speakerWebView = [[SpeakerWebView alloc]init];
	speakerWebView.urlString = [NSString stringWithFormat:@"%@",final_twitterURLString ];
	[self.navigationController pushViewController:speakerWebView animated:YES];
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
    appDelegate.allDates = @"";
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
