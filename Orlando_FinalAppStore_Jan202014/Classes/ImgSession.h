//
//  ImgSession.h
//  Orlando
//
//  Created by Prateek Sachdev on 4/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImgSession : NSObject {

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
