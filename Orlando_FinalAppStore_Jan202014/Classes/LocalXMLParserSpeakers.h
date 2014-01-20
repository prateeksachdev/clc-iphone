//
//  LocalXMLParserSpeakers.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/28/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrlandoAppDelegate,Speakers;
@interface LocalXMLParserSpeakers : NSObject<NSXMLParserDelegate> {

	NSMutableString *currentElementValue;
	
	OrlandoAppDelegate *appDelegate;
	Speakers *aPromo; 
}

- (LocalXMLParserSpeakers *) initSpeakers;


@end
