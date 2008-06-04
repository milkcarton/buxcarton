//
//  BXImpact.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXImpact.h"

@implementation BXImpact

- (float)balance
{
	return balance;
}

- (void)setBalance:(float)balanceVar
{
	balance = balanceVar;
}

@synthesize entity;
@synthesize type;
@synthesize description;
@end
