//
//  LocalXMLParserImgSession.h
//  Orlando
//
//  Created by Prateek Sachdev on 4/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrlandoAppDelegate,ImgSession;
@interface LocalXMLParserImgSession : NSObject <NSXMLParserDelegate> {

	NSMutableString *ImgCurrentElementValue;
	
	OrlandoAppDelegate *appDelegate;
	ImgSession *aPromo;
}

- (LocalXMLParserImgSession *) initImgSessions;
@end
