//
//  ImgSession.m
//  Orlando
//
//  Created by Prateek Sachdev on 4/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ImgSession.h"


@implementation ImgSession

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
