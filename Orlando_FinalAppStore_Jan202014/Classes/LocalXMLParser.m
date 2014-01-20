//
//  LocalXMLParser.m
//  BottomLines
//
//  Created by Kevin Gajjar on 8/9/10.
//  Copyright 2010 Implicit Solutions. All rights reserved.
//

#import "LocalXMLParser.h"
#import "OrlandoAppDelegate.h"
#import "Promo.h"


@implementation LocalXMLParser

- (LocalXMLParser *) initLocalXMLParser {
	
	[super init];
	
	appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
		if([elementName isEqualToString:@"Records"]) {
		
			appDelegate.Sponsors = [[NSMutableArray alloc] init];
				
			
		}
		else if([elementName isEqualToString:@"Record"]) {

			aPromo = [[Promo alloc] init];

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
				
				[appDelegate.Sponsors addObject:aPromo];
				
				[aPromo release];
				aPromo = nil;	
				
			}
			else  {
				NSString *value = (NSString *)currentElementValue;
				value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
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
