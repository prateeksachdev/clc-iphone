//
//  Speakers.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/28/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Speakers : NSObject {
	
		
	NSString *Speaker_Number;
	NSString *Last_Name;
	NSString *First_Name;
    NSString *Title;
	NSString *Institution;
	NSString *Bio;
	NSString *URL;
	NSString *Sessions;
    
	
}
@property (nonatomic, retain)NSString *Speaker_Number;
@property (nonatomic, retain)NSString *Last_Name;
@property (nonatomic, retain)NSString *First_Name;
@property (nonatomic, retain)NSString *Title;
@property (nonatomic, retain)NSString *Institution;
@property (nonatomic, retain)NSString *Bio;
@property (nonatomic, retain)NSString *Sessions;
@property (nonatomic, retain)NSString *URL;


@end
