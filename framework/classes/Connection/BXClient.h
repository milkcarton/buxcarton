//
//  BXClient.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 04/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MCWebServiceXMLRPC.h"
#import "BXContact.h"
#import "BXGroup.h"
#import "BXBudget.h"
#import "BXTag.h"
#import "BXImpact.h"
#import "BXAccount.h"
#import "BXAnalysis.h"
#import "BXItem.h"

// The different types of errors returned when domain = BXErrorDomain
typedef enum {
	kBXAPICallError = 0,
	kBXProgramError = 1
} kBXError;

@interface BXClient : NSObject {
	@private NSString *token;				// The token returned by the authentication method.
	@private NSString *userId;
	@private NSString *password;
	@private MCWebServiceXMLRPC *service;
}

+ (NSError *)errorWithReason:(NSString *)reason type:(kBXError)error;	// Returns an NSError object created from a description.
+ (NSError *)errorWithStatus:(NSString *)status;						// Check if the API call returned an error
+ (NSError *)checkStatusWithDocument:(NSXMLDocument *)document;			// Check is status returned is OK, otherwise return error.
- (void)authenticateWithError:(NSError **)error;						// Authenticate with Buxfer.

// API Calls.
- (NSArray *)getContactsWithError:(NSError **)error;																// Get all the contacts from the Buxfer API.
- (NSArray *)getGroupsWithError:(NSError **)error;																	// Get all the groups from the Buxfer API.
- (NSArray *)getBudgetsWithError:(NSError **)error;																	// Get all the budgets from the Buxfer API.
- (NSArray *)getTagsWithError:(NSError **)error;																	// Get all the tags from the Buxfer API.
- (NSArray *)getImpactsWithError:(NSError **)error;																	// Get all the impacts from the Buxfer API.
- (NSArray *)getAccountsWithError:(NSError **)error;																// Get all the accounts from the Buxfer API.
- (BXAnalysis *)getAnalysisWithError:(NSError **)error;																// Get the analysis from the buxfer API from the current month.
- (BXAnalysis *)getAnalysisWithError:(NSError **)error accountName:(NSString *)accountName month:(NSString *)monthYear;		// Get the analysis from the Buxfer API.

@property (retain) NSString *token;
@property (retain, readwrite) NSString *userId;
@property (retain, readwrite) NSString *password;
@property (retain) MCWebServiceXMLRPC *service;
@end
