//
//  WebViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/20/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize webview,twitter_URl,checkURl;

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

	self.webview.delegate = self;
    self.webview.scalesPageToFit = YES;
	//NSLog(@"the TWITTER URL STRING is-----> %@",checkURl);
    
    self.navigationController.navigationBar.hidden = YES;
	
	if([checkURl isEqualToString:@"hello tweet"])
	{
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
		
		[self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:twitter_URl]]];
	}
	else {
		
		UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"twitterTitle.png"]];
		self.navigationItem.titleView = imageView;
		[imageView release];
		
		UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
		[backButton setBackgroundImage:[UIImage imageNamed:@"main.png"] forState:UIControlStateNormal];
		[backButton addTarget:self action:@selector(mainButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		
		UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
		
		[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
		[barLeftButton release];
		[backButton release];
        [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://twitter.com/CLCSeminar"]]];
	}
	
    [super viewDidLoad];
}

-(void)mainButtonClicked:(id)sender {

	
}

-(IBAction)main_button:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
    
	if([checkURl isEqualToString:@"hello tweet"])
	{
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
		
		[self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:twitter_URl]]];
	}
	else {
		
		UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"twitterTitle.png"]];
		self.navigationItem.titleView = imageView;
		[imageView release];
		
		UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 12)];
		[backButton setBackgroundImage:[UIImage imageNamed:@"main.png"] forState:UIControlStateNormal];
		[backButton addTarget:self action:@selector(mainButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		
		UIBarButtonItem* barLeftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
		
		[self.navigationItem setLeftBarButtonItem:barLeftButton animated:NO];
		[barLeftButton release];
		[backButton release];
		[self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://twitter.com/CLCSeminar"]]];
	}
		
	[super viewWillAppear:YES];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

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
