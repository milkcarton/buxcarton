//
//  MCWebServiceXMLRPC.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 30/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MCWebServiceXMLRPC : NSObject {
	@private NSString *connectionUrl;		// Contains the main url to connect to the webservice.
	@private NSMutableDictionary *params;	// Contains all the parameters that are send to the web	service.
}

- (void)addParamWithKey:(NSString *)key value:(NSString *)value;	// Adds a parameter to the params dictionary.
- (NSXMLDocument *)sendRequestWithError:(NSError **)error;			// Sends the request to the webservice.

@property (retain, readwrite) NSString *connectionUrl;
@property (retain) NSMutableDictionary *params;
@end
