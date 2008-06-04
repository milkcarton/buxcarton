//
//  BXAccount.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXAccount.h"

@implementation BXAccount

- (int)identification
{
	return identification;
}

- (void)setIdentification:(int)identificationVar
{
	identification = identificationVar;
}

- (float)balance
{
	return balance;
}

- (void)setBalance:(float)balanceVar
{
	balance = balanceVar;
}

@synthesize name;
@synthesize bank;
@synthesize lastSynced;
@end
