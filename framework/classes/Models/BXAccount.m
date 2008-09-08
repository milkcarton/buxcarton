//
//  BXAccount.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXAccount.h"

@implementation BXAccount

- (float)balance
{
	return balance;
}

- (void)setBalance:(float)balanceVar
{
	balance = balanceVar;
}

@synthesize identification;
@synthesize name;
@synthesize bank;
@synthesize lastSynced;
@end
