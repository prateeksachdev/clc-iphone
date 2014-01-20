//
//  Promo.m
//  BottomLines
//
//  Created by Kevin Gajjar on 7/7/10.
//  Copyright 2010 Implicit Solutions. All rights reserved.
//

#import "Promo.h"


@implementation Promo

@synthesize Company_Name;
@synthesize Ad;
@synthesize Address;
@synthesize City;
@synthesize State;
@synthesize Zip_Code;
@synthesize URL;
@synthesize TwitterURL;
@synthesize Sponsor_Attendees;
@synthesize App_Image;

- (void) dealloc {
	
	[Company_Name release];
	[Ad release];
	[Address release];
	[City release];
	[State release];
	[Zip_Code release];
	[URL release];
	[TwitterURL release];
	[Sponsor_Attendees release];
	[App_Image release];
	[super dealloc];
}


@end
