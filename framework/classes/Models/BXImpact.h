//
//  BXImpact.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXImpact : NSObject {
	@private NSString *entity;
	@private NSString *type;
	@private float balance;
	@private NSString *description;
}

- (float)balance;							// Returns the balance value.
- (void)setBalance:(float)balanceVar;		// Sets the balance value.

@property (copy, readwrite) NSString *entity;
@property (copy, readwrite) NSString *type;
@property (copy, readwrite) NSString *description;
@property (getter=balance,setter=setBalance:) float balance;
@end
