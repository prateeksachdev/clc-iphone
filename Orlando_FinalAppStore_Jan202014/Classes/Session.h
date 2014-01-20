//
//  Session.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/30/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Session : NSObject {

	NSString *Date;
	NSString *Session_Name;
	NSString *Time;
	NSString *Room;
	NSString *Description;
	NSString *Speakers;
	NSString *Session_Number;
	
	
}

@property(nonatomic,retain) NSString *Date;
@property(nonatomic,retain) NSString *Session_Name;
@property(nonatomic,retain) NSString *Time;
@property(nonatomic,retain) NSString *Room;
@property(nonatomic,retain) NSString *Description;
@property(nonatomic,retain) NSString *Speakers;
@property(nonatomic,retain) NSString *Session_Number;

@end
