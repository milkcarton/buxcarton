//
//  BXAccount.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXAccount : NSObject {
	@private int identification;
	@private NSString *name;
	@private NSString *bank;
	@private float balance;
	@private NSDate *lastSynced;
}

- (int)identification;								// Returns the identification value.
- (void)setIdentification:(int)identificationVar;	// Sets the identification value.
- (float)balance;									// Returns the balance value.
- (void)setBalance:(float)balanceVar;				// Sets the balance value.

@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *bank;
@property (copy, readwrite) NSDate *lastSynced;
@property (getter=identification,setter=setIdentification:) int identification;
@property (getter=balance,setter=setBalance:) float balance;
@end
