//
//  BXBudget.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 31/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXBudget.h"

@implementation BXBudget

- (float)limit
{
	return limit;
}

- (void)setLimit:(float)limitVar
{
	limit = limitVar;
}

- (float)remaining
{
	return remaining;
}

- (void)setRemaining:(float)remainingVar
{
	remaining = remainingVar;
}

- (void)addTag:(NSString *)tag
{
	[tags addObject:tag];
}

- (void)addKeyword:(NSString *)keyword
{
	[keywords addObject:keyword];
}

@synthesize identification;
@synthesize name;
@synthesize period;
@synthesize currentPeriod;
@synthesize tags;
@synthesize keywords;
@end
