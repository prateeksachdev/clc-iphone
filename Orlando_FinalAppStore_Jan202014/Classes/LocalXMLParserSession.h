//
//  LocalXMLParserSession.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/30/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrlandoAppDelegate,Session;
@interface LocalXMLParserSession : NSObject<NSXMLParserDelegate> {

	NSMutableString *currentElementValue;
	
	OrlandoAppDelegate *appDelegate;
	Session *aPromo; 
}

- (LocalXMLParserSession *) initSessions;

@end
