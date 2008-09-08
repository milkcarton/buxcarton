//
//  BXAnalysis.m
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 07/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import "BXAnalysis.h"

@implementation BXAnalysis

- (void)addItem:(BXItem *)item
{
	[rawData addObject:item];
}

@synthesize rawData;
@synthesize imageURL;
@end
