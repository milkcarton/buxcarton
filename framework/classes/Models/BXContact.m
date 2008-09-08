//
//  BXContact.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 30/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXContact.h"

@implementation BXContact

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
@synthesize email;
@end
