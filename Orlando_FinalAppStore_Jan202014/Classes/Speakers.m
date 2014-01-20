//
//  Speakers.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/28/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "Speakers.h"


@implementation Speakers

@synthesize Speaker_Number;
@synthesize Last_Name;
@synthesize First_Name;
@synthesize Title;
@synthesize Institution;
@synthesize Bio;
@synthesize URL;
@synthesize Sessions;


- (void) dealloc {
	
	[Speaker_Number release];
	[Last_Name release];
	[First_Name release];
    [Title release];
	[Institution release];
	[Bio release];
	[URL release];
	[Sessions release];
    
	[super dealloc];
}


@end
