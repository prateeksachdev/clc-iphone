//
//  LocalXMLParserImgSession.m
//  Orlando
//
//  Created by Prateek Sachdev on 4/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LocalXMLParserImgSession.h"
#import "OrlandoAppDelegate.h"
#import "ImgSession.h"


@implementation LocalXMLParserImgSession


- (LocalXMLParserImgSession *) initImgSessions {
	
	[super init];
	
	appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {

	if([elementName isEqualToString:@"Records"]) {
		//Initialize the array.
		appDelegate.ImgSessions = [[NSMutableArray alloc] init];
		
		
	}
	else if([elementName isEqualToString:@"Record"]) {
		//Initialize the array.
		aPromo = [[ImgSession alloc] init];
		
		
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	
	if(!ImgCurrentElementValue) 
		ImgCurrentElementValue = [[NSMutableString alloc] initWithString:string];
	else{
		[ImgCurrentElementValue appendString:string];
	}
	
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"Records"]) {
		
	}
	else if([elementName isEqualToString:@"Record"]) {
		
		[appDelegate.ImgSessions addObject:aPromo];
		
		[aPromo release];
		aPromo = nil;	
		
	}
	else  {
		NSString *value = (NSString *)ImgCurrentElementValue;
		value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      //  NSLog(@"%@ ==> %@",elementName,value);
		[aPromo setValue:value forKey:elementName];
	} 	
	
	
	[ImgCurrentElementValue release];
	ImgCurrentElementValue = nil;
	
	
}


@end
