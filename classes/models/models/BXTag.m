//
//  BXTag.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 31/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXTag.h"

@implementation BXTag

- (int)identification
{
	return identification;
}

- (void)setIdentification:(int)identificationVar
{
	identification = identificationVar;
}

- (int)parentId
{
	return parentId;
}

- (void)setParentId:(int)parentIdVar
{
	parentId = parentIdVar;
}

@synthesize name;
@end
