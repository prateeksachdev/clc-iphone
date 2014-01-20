//
//  Session.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/30/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "Session.h"


@implementation Session

@synthesize Date;
@synthesize Session_Name;
@synthesize Time;
@synthesize Room;
@synthesize Description;
@synthesize Speakers;
@synthesize Session_Number;

- (void) dealloc {
	[Date release];
	[Session_Name release];
	[Time release];
	[Room release];
	[Description release];
	[Speakers release];
	[Session_Number release];
	[super dealloc];
}


@end
