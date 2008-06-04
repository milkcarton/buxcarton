//
//  WebServiceXMLRPC.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 30/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "WebServiceXMLRPC.h"

@implementation WebServiceXMLRPC

- (id)initWithUrl:(NSString *)url
{
	self = [super init];
	connectionUrl = url;
	params = [NSMutableDictionary dictionary];
	return self;
}

- (void)addParamWithKey:(NSString *)key value:(NSString *)value
{
	[params setObject:value forKey:key];
}

- (NSXMLDocument *)sendRequestWithError:(NSError **)error
{
	NSString *urlString = @"";
	if ([params count] > 0)		// Add the '?' to the url when params are available.
		urlString = [connectionUrl stringByAppendingString:@"?"];
	for (NSString *key in [params allKeys]) {		// Loop thru all the keys.
		urlString = [urlString stringByAppendingString:[params objectForKey:key]];
		urlString = [urlString stringByAppendingString:@"&"];
	}
					 
	NSURL *URL = [NSURL URLWithString:urlString];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
	NSData *urlData;
	NSURLResponse *response;
	urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:error];
	if (!urlData) {
		return nil;
	} else {
		return [[[NSXMLDocument alloc] initWithData:urlData options:0 error:error] autorelease];
	}
}

@synthesize connectionUrl;
@synthesize params;
@end