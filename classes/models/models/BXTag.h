//
//  BXTag.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 31/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXTag : NSObject {
	@private int identification;
	@private NSString *name;
	@private int parentId;
}

- (int)identification;								// Returns the identification value.
- (void)setIdentification:(int)identificationVar;	// Sets the identification value.
- (int)parentId;									// Returns the parentId value.
- (void)setParentId:(int)parentIdVar;				// Sets the parentId value.

@property (copy, readwrite) NSString *name;
@property (getter=identification,setter=setIdentification:) int identification;
@property (getter=parentId,setter=setParentId:) int parentId;
@end
