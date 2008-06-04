//
//  BXGroup.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 30/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXGroup.h"

@implementation BXGroup

- (id)init
{
	self = [super init];
	members = [NSMutableArray array];
	return self;
}

- (int)identification
{
	return identification;
}

- (void)setIdentification:(int)identificationVar
{
	identification = identificationVar;
}

- (BOOL)consolidated
{
	return consolidated;
}

- (void)setConsolidated:(BOOL)consolidatedVar
{
	consolidated = consolidatedVar;
}

- (void)addContact:(BXContact *)contact
{
	[members addObject:contact];
}

@synthesize name;
@synthesize members;
@end