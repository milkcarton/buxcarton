//
//  BXAnalysis.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 07/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BXItem.h"

@interface BXAnalysis : NSObject {
	@private NSMutableArray *rawData;		// Contains BXItems.
	@private NSURL *imageURL;
}

- (void)addItem:(BXItem *)item;				// Adds a BXItem to the tags array.

@property (copy, readonly) NSArray *rawData;
@property (copy, readwrite) NSURL *imageURL;
@end
