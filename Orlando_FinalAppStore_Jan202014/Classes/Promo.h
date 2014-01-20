//
//  Promo.h
//  BottomLines
//
//  Created by Kevin Gajjar on 7/7/10.
//  Copyright 2010 Implicit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Promo : NSObject {

	NSString *Company_Name;
	NSString *Ad;
	NSString *Address;
	NSString *City;
	NSString *State;
	NSString *Zip_Code;
	NSString *URL;
	NSString *TwitterURL;
	NSString *Sponsor_Attendees;
	NSString *App_Image;
		
}

@property (nonatomic, retain)NSString *Company_Name;
@property (nonatomic, retain)NSString *Ad;
@property (nonatomic, retain)NSString *Address;
@property (nonatomic, retain)NSString *City;
@property (nonatomic, retain)NSString *State;
@property (nonatomic, retain)NSString *Zip_Code;
@property (nonatomic, retain)NSString *URL;
@property (nonatomic, retain)NSString *TwitterURL;
@property (nonatomic, retain)NSString *Sponsor_Attendees;
@property (nonatomic, retain)NSString *App_Image;



@end
