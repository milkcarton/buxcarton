//
//  BXAccount.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXAccount : NSObject {
	@private NSString *identification;
	@private NSString *name;
	@private NSString *bank;
	@private float balance;
	@private NSDate *lastSynced;
}

- (float)balance;									// Returns the balance value.
- (void)setBalance:(float)balanceVar;				// Sets the balance value.

@property (copy, readwrite) NSString *identification;
@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *bank;
@property (copy, readwrite) NSDate *lastSynced;
@property (getter=balance,setter=setBalance:) float balance;
@end
