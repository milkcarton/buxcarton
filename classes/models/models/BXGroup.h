//
//  BXGroup.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 30/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BXContact.h"

@interface BXGroup : NSObject {
	@private int identification;
	@private NSString *name;
	@private BOOL consolidated;
	@private NSMutableArray *members;		// Collection of BXContacts.
}

- (int)identification;								// Returns the identification value.
- (void)setIdentification:(int)identificationVar;	// Sets the identification value.
- (BOOL)consolidated;								// Returns the consolidated value.
- (void)setConsolidated:(BOOL)consolidatedVar;		// Sets the consolidated value.
- (void)addContact:(BXContact *)contact;			// Adds a contact to the member array.

@property (copy, readwrite) NSString *name;
@property (copy, readonly) NSArray *members;
@property (getter=identification,setter=setIdentification:) int identification;
@property (getter=consolidated,setter=setConsolidated:) BOOL consolidated;
@end
