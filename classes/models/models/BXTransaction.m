//
//  BXTransaction.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXTransaction.h"

@implementation BXTransaction

- (int)identification
{
	return identification;
}

- (void)setIdentification:(int)identificationVar
{
	identification = identificationVar;
}

- (float)amount
{
	return amount;
}

- (void)setAmount:(float)amountVar
{
	amount = amountVar;
}

- (int)accountId
{
	return accountId;
}

- (void)setAccountId:(int)accountIdVar
{
	accountId = accountIdVar;
}

- (void)addTag:(NSString *)tag
{
	[tags addObject:tag];
}

@synthesize description;
@synthesize date;
@synthesize type;
@synthesize tags;
@synthesize extraInfo;
@end
