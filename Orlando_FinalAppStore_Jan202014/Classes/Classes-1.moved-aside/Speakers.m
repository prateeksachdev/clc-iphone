//
//  Speakers.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/28/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "Speakers.h"


@implementation Speakers


@synthesize SID;
@synthesize Name;
@synthesize Role;
@synthesize Organization;
@synthesize Desc;	


- (void) dealloc {
	[SID release];
	[Name release];
	[Role release];
	[Organization release];
	[Desc release];
	[super dealloc];
}

@end
