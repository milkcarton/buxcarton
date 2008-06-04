//
//  BXContact.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 30/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXContact : NSObject {
	@private int identification;
	@private NSString *name;
	@private NSString *email;
	@private float balance;
}

- (int)identification;								// Returns the identification value.
- (void)setIdentification:(int)identificationVar;	// Sets the identification value.
- (float)balance;									// Returns the balance value.
- (void)setBalance:(float)balanceVar;				// Sets the balance value.

@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *email;
@property (getter=identification,setter=setIdentification:) int identification;
@property (getter=balance,setter=setBalance:) float balance;
@end
