//
//  QRCodeViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/27/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "QRCodeViewController.h"


@implementation QRCodeViewController

@synthesize checkString;
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
	self.title = @"QR Reader";
	
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bkgd.png"]];
	TextView.font = [UIFont fontWithName:@"Arial" size:13];
	
	
    [super viewDidLoad];
}

-(IBAction)DownloadApp{
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/app/qrafter-qr-code-reader/id416098700"]];	

}

-(void) viewWillAppear:(BOOL)animated{
	self.navigationController.navigationBar.hidden = NO;	
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
