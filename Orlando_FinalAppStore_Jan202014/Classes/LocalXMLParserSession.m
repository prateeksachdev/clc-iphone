//
//  LocalXMLParserSession.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/30/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "LocalXMLParserSession.h"
#import "OrlandoAppDelegate.h"
#import "Session.h"

@implementation LocalXMLParserSession

- (LocalXMLParserSession *) initSessions {
	
	[super init];
	
	appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	
	if([elementName isEqualToString:@"Records"]) {
		appDelegate.Sessions = [[NSMutableArray alloc] init];
		
		
	}
	else if([elementName isEqualToString:@"Record"]) {
		aPromo = [[Session alloc] init];
				
	}
	
	
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	
	if(!currentElementValue) 
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else{
		[currentElementValue appendString:string];
	}
	
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"Records"]) {
		
	}
	else if([elementName isEqualToString:@"Record"]) {
		
		[appDelegate.Sessions addObject:aPromo];
		
		[aPromo release];
		aPromo = nil;	
		
	}
	else  {
		NSString *value = (NSString *)currentElementValue;
		value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      //  NSLog(@"%@ ==> %@",elementName,value);
		[aPromo setValue:value forKey:elementName];
	} 	
	
	
	[currentElementValue release];
	currentElementValue = nil;
	
	
}

- (void) dealloc {
	
	[aPromo release];
	[currentElementValue release];
	[super dealloc];
}


@end
