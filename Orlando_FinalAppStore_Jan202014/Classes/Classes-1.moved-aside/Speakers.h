//
//  Speakers.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/28/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Speakers : NSObject {
	NSString *SID;
	NSString *Name;
	NSString *Role;
	NSString *Organization;
	NSString *Desc;	
}

@property (nonatomic,retain)NSString *SID;
@property (nonatomic,retain)NSString *Name;
@property (nonatomic,retain)NSString *Role;
@property (nonatomic,retain)NSString *Organization;
@property (nonatomic,retain)NSString *Desc;	


@end
