//
//  LocalXMLParser.h
//  BottomLines
//
//  Created by Kevin Gajjar on 8/9/10.
//  Copyright 2010 Implicit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrlandoAppDelegate , Promo;

@interface LocalXMLParser : NSObject<NSXMLParserDelegate> {

	NSMutableString *currentElementValue;
	
	OrlandoAppDelegate *appDelegate;//com.mobikasa.clcimg2013
	Promo *aPromo; //roundedcorrner.clc2013
}

- (LocalXMLParser *) initLocalXMLParser;

@end
