//
//  BXClient.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 04/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXClient.h"

@implementation BXClient

- (id)init
{
	self = [super init];
	service = [[MCWebServiceXMLRPC alloc] init];
	return self;
}

+ (NSError *)errorWithReason:(NSString *)reason type:(kBXError)error
{
	NSArray *objects = [NSArray arrayWithObjects:reason, nil];
	NSArray *keys = [NSArray arrayWithObjects:NSLocalizedDescriptionKey, nil];
	NSDictionary *errorDict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	return [NSError errorWithDomain:@"BXErrorDomain" code:error userInfo:errorDict];
}

+ (NSError *)errorWithStatus:(NSString *)status
{
	if ([status compare:@"OK"] == NSOrderedSame)
		return nil;
	return [BXClient errorWithReason:[status substringFromIndex:7] type:kBXAPICallError];
}

+ (NSError *)checkStatusWithDocument:(NSXMLDocument *)document
{
	NSError *error;
	NSArray *statusNodes = [document nodesForXPath:@"./response/status" error:&error];
	// Check for xml-node error or no nodes found.
	if (!error) {
		error = [BXClient errorWithStatus:[[statusNodes objectAtIndex:0] stringValue]];
	}
	return error;
}

- (void)authenticateWithError:(NSError **)error
{
	service.connectionUrl = @"http://www.buxfer.com/api/login.xml";
	[service addParamWithKey:@"userid" value:userId];
	[service addParamWithKey:@"password" value:password];
	NSXMLDocument *doc = [service sendRequestWithError:error];
	if (!*error)
		*error = [BXClient checkStatusWithDocument:doc];
	if (!*error) {
		NSArray *nodes = [doc nodesForXPath:@"./response/token" error:error];
		if (!*error) token = [[nodes objectAtIndex:0] stringValue];
	}
}

- (NSArray *)getContactsWithError:(NSError **)error
{
	if (token) {
		NSMutableArray *contacts = [NSMutableArray array];
		service.connectionUrl = @"http://www.buxfer.com/api/contacts.xml";
		[service addParamWithKey:@"token" value:token];
		NSXMLDocument *doc = [service sendRequestWithError:error];
		if (!*error)
			*error = [BXClient checkStatusWithDocument:doc];
		if (!*error) {
			NSArray *nodes = [doc nodesForXPath:@"./response/contacts/contact" error:error];
			for (NSXMLElement *contactNode in nodes) {
				BXContact *contact = [[BXContact alloc] init];
				if ([[contactNode elementsForName:@"id"] count] > 0) contact.identification = [[[contactNode elementsForName:@"id"] objectAtIndex:0] stringValue];
				if ([[contactNode elementsForName:@"name"] count] > 0) contact.name = [[[contactNode elementsForName:@"name"] objectAtIndex:0] stringValue];
				if ([[contactNode elementsForName:@"email"] count] > 0) contact.email = [[[contactNode elementsForName:@"email"] objectAtIndex:0] stringValue];
				if ([[contactNode elementsForName:@"balance"] count] > 0) contact.balance = [[[[contactNode elementsForName:@"balance"] objectAtIndex:0] stringValue] floatValue];
				[contacts addObject:[contact autorelease]];
			}
		}
		return contacts;
	} else {
		*error = [BXClient errorWithReason:@"No token available" type:kBXProgramError];
		return nil;
	}
}

- (NSArray *)getGroupsWithError:(NSError **)error
{
	if (token) {
		NSMutableArray *groups = [NSMutableArray array];
		service.connectionUrl = @"http://www.buxfer.com/api/groups.xml";
		[service addParamWithKey:@"token" value:token];
		NSXMLDocument *doc = [service sendRequestWithError:error];
		if (!*error)
			*error = [BXClient checkStatusWithDocument:doc];
		if (!*error) {
			NSArray *nodes = [doc nodesForXPath:@"./response/groups/group" error:error];
			for (NSXMLElement *groupNode in nodes) {
				BXGroup *group = [[BXGroup alloc] init];
				group.identification = [[[groupNode elementsForName:@"id"] objectAtIndex:0] stringValue];
				group.name = [[[groupNode elementsForName:@"name"] objectAtIndex:0] stringValue];
				group.consolidated = [[[[groupNode elementsForName:@"consolidated"] objectAtIndex:0] stringValue] boolValue];
				NSArray *memberNodes = [[[groupNode elementsForName:@"members"] objectAtIndex:0] elementsForName:@"member"];
				for (NSXMLElement *memberNode in memberNodes) {
					BXContact *contact = [[BXContact alloc] init];
					if ([[memberNode elementsForName:@"id"] count] > 0) contact.identification = [[[memberNode elementsForName:@"id"] objectAtIndex:0] stringValue];
					if ([[memberNode elementsForName:@"name"] count] > 0) contact.name = [[[memberNode elementsForName:@"name"] objectAtIndex:0] stringValue];
					if ([[memberNode elementsForName:@"email"] count] > 0) contact.email = [[[memberNode elementsForName:@"email"] objectAtIndex:0] stringValue];
					if ([[memberNode elementsForName:@"balance"] count] > 0) contact.balance = [[[[memberNode elementsForName:@"balance"] objectAtIndex:0] stringValue] floatValue];
					[group addContact:[contact autorelease]];
				}
				[groups addObject:[group autorelease]];
			}
		}
		return groups;
	} else {
		*error = [BXClient errorWithReason:@"No token available" type:kBXProgramError];
		return nil;
	}
}

- (NSArray *)getBudgetsWithError:(NSError **)error
{
	if (token) {
		NSMutableArray *budgets = [NSMutableArray array];
		service.connectionUrl = @"http://www.buxfer.com/api/budgets.xml";
		[service addParamWithKey:@"token" value:token];
		NSXMLDocument *doc = [service sendRequestWithError:error];
		if (!*error)
			*error = [BXClient checkStatusWithDocument:doc];
		if (!*error) {
			NSArray *nodes = [doc nodesForXPath:@"./response/budgets/budget" error:error];
			for (NSXMLElement *budgetNode in nodes) {
				BXBudget *budget = [[BXBudget alloc] init];
				if ([[budgetNode elementsForName:@"id"] count] > 0) budget.identification = [[[budgetNode elementsForName:@"id"] objectAtIndex:0] stringValue];
				if ([[budgetNode elementsForName:@"name"] count] > 0) budget.name = [[[budgetNode elementsForName:@"name"] objectAtIndex:0] stringValue];
				if ([[budgetNode elementsForName:@"limit"] count] > 0) budget.limit = [[[[budgetNode elementsForName:@"limit"] objectAtIndex:0] stringValue] floatValue];
				if ([[budgetNode elementsForName:@"remaining"] count] > 0) budget.remaining = [[[[budgetNode elementsForName:@"remaining"] objectAtIndex:0] stringValue] floatValue];
				if ([[budgetNode elementsForName:@"period"] count] > 0) budget.period = [[[budgetNode elementsForName:@"period"] objectAtIndex:0] stringValue];
				if ([[budgetNode elementsForName:@"currentPeriod"] count] > 0) budget.currentPeriod = [[[budgetNode elementsForName:@"currentPeriod"] objectAtIndex:0] stringValue];
				if ([[budgetNode elementsForName:@"tags"] count] > 0) {
					NSArray *tags = [[[[budgetNode elementsForName:@"tags"] objectAtIndex:0] stringValue] componentsSeparatedByString:@","];
					for (NSString *tag in tags)
						[budget addTag:tag];
				}
				if ([[budgetNode elementsForName:@"keywords"] count] > 0) {
					NSArray *keywords = [[[[budgetNode elementsForName:@"keywords"] objectAtIndex:0] stringValue] componentsSeparatedByString:@","];
					for (NSString *keyword in keywords)
						[budget addTag:keyword];
				}
				[budgets addObject:[budget autorelease]];
			}
		}
		return budgets;
	} else {
		*error = [BXClient errorWithReason:@"No token available" type:kBXProgramError];
		return nil;
	}
}

- (NSArray *)getTagsWithError:(NSError **)error
{
	if (token) {
		NSMutableArray *tags = [NSMutableArray array];
		service.connectionUrl = @"http://www.buxfer.com/api/tags.xml";
		[service addParamWithKey:@"token" value:token];
		NSXMLDocument *doc = [service sendRequestWithError:error];
		if (!*error)
			*error = [BXClient checkStatusWithDocument:doc];
		if (!*error) {
			NSArray *nodes = [doc nodesForXPath:@"./response/tags/tag" error:error];
			for (NSXMLElement *tagNode in nodes) {
				BXTag *tag = [[BXTag alloc] init];
				if ([[tagNode elementsForName:@"id"] count] > 0) tag.identification = [[[tagNode elementsForName:@"id"] objectAtIndex:0] stringValue];
				if ([[tagNode elementsForName:@"name"] count] > 0) tag.name = [[[tagNode elementsForName:@"name"] objectAtIndex:0] stringValue];
				if ([[tagNode elementsForName:@"parentId"] count] > 0) tag.parentId = [[[tagNode elementsForName:@"parentId"] objectAtIndex:0] stringValue];
				[tags addObject:[tag autorelease]];
			}
		}
		return tags;
	} else {
		*error = [BXClient errorWithReason:@"No token available" type:kBXProgramError];
		return nil;
	}
}

- (NSArray *)getImpactsWithError:(NSError **)error
{
	if (token) {
		NSMutableArray *impacts = [NSMutableArray array];
		service.connectionUrl = @"http://www.buxfer.com/api/impacts.xml";
		[service addParamWithKey:@"token" value:token];
		NSXMLDocument *doc = [service sendRequestWithError:error];
		if (!*error)
			*error = [BXClient checkStatusWithDocument:doc];
		if (!*error) {
			NSArray *nodes = [doc nodesForXPath:@"./response/impacts/impact" error:error];
			for (NSXMLElement *impactNode in nodes) {
				BXImpact *impact = [[BXImpact alloc] init];
				if ([[impactNode elementsForName:@"entity"] count] > 0) impact.entity = [[[impactNode elementsForName:@"entity"] objectAtIndex:0] stringValue];
				if ([[impactNode elementsForName:@"type"] count] > 0) impact.type = [[[impactNode elementsForName:@"type"] objectAtIndex:0] stringValue];
				if ([[impactNode elementsForName:@"balance"] count] > 0) impact.balance = [[[[impactNode elementsForName:@"balance"] objectAtIndex:0] stringValue] floatValue];
				if ([[impactNode elementsForName:@"description"] count] > 0) impact.description = [[[impactNode elementsForName:@"description"] objectAtIndex:0] stringValue];
				[impacts addObject:[impact autorelease]];
			}
		}
		return impacts;
	} else {
		*error = [BXClient errorWithReason:@"No token available" type:kBXProgramError];
		return nil;
	}
}

- (NSArray *)getAccountsWithError:(NSError **)error
{
	if (token) {
		NSMutableArray *accounts = [NSMutableArray array];
		service.connectionUrl = @"http://www.buxfer.com/api/accounts.xml";
		[service addParamWithKey:@"token" value:token];
		NSXMLDocument *doc = [service sendRequestWithError:error];
		if (!*error)
			*error = [BXClient checkStatusWithDocument:doc];
		if (!*error) {
			NSArray *nodes = [doc nodesForXPath:@"./response/accounts/account" error:error];
			for (NSXMLElement *accountNode in nodes) {
				BXAccount *account = [[BXAccount alloc] init];
				if ([[accountNode elementsForName:@"id"] count] > 0) account.identification = [[[accountNode elementsForName:@"id"] objectAtIndex:0] stringValue];
				if ([[accountNode elementsForName:@"name"] count] > 0) account.name = [[[accountNode elementsForName:@"name"] objectAtIndex:0] stringValue];
				if ([[accountNode elementsForName:@"bank"] count] > 0) account.bank = [[[accountNode elementsForName:@"bank"] objectAtIndex:0] stringValue];
				if ([[accountNode elementsForName:@"balance"] count] > 0) account.balance = [[[[accountNode elementsForName:@"balance"] objectAtIndex:0] stringValue] floatValue];
				if ([[accountNode elementsForName:@"lastSynced"] count] > 0) account.lastSynced = [NSDate dateWithNaturalLanguageString:[[[[accountNode elementsForName:@"lastSynced"] objectAtIndex:0] stringValue]];
				[accounts addObject:[account autorelease]];
			}
		}
		return accounts;
	} else {
		*error = [BXClient errorWithReason:@"No token available" type:kBXProgramError];
		return nil;
	}
}

- (BXAnalysis *)getAnalysisWithError:(NSError **)error
{
	return [self getAnalysisWithError:error accountName:nil month:nil];
}
					
- (BXAnalysis *)getAnalysisWithError:(NSError **)error accountName:(NSString *)accountName month:(NSString *)monthYear
{
	if (token) {
		BXAnalysis *analysis = [[BXAnalysis alloc] init];
		service.connectionUrl = @"http://www.buxfer.com/api/analysis.xml";
		[service addParamWithKey:@"token" value:token];
		if (accountName && [accountName compare:@""] == NSOrderedSame) [service addParamWithKey:@"accountName" value:accountName];
		if (monthYear && [monthYear compare:@""] == NSOrderedSame) [service addParamWithKey:@"month" value:monthYear];
		NSXMLDocument *doc = [service sendRequestWithError:error];
		if (!*error)
			*error = [BXClient checkStatusWithDocument:doc];
		if (!*error) {
			NSArray *nodes = [doc nodesForXPath:@"./response/analysis/rawData/item" error:error];
			for (NSXMLElement *itemNode in nodes) {
				BXItem *item = [[BXItem alloc] init];
				if ([[itemNode elementsForName:@"tag"] count] > 0) item.tag = [[[itemNode elementsForName:@"tag"] objectAtIndex:0] stringValue];
				if ([[itemNode elementsForName:@"amount"] count] > 0) item.amount= [[[[itemNode elementsForName:@"amount"] objectAtIndex:0] stringValue] floatValue];
				[analysis addObject:[item autorelease]];
			}
			nodes = [doc nodesForXPath:@"./response/analysis/imageURL" error:error];
			if (nodes && [nodes count] > 0)
				analysis.imageURL = [NSURL URLWithString:[[nodes objectAtIndex:0] stringValue]];
		}
		return analysis;
	} else {
		*error = [BXClient errorWithReason:@"No token available" type:kBXProgramError];
		return nil;
	}
}
					
- (void)dealloc
{
	[service release], service = nil;
	[super dealloc];
}

@synthesize token;
@synthesize userId;
@synthesize password;
@synthesize service;
@end
