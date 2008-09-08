//
//  BXContact.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 30/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXContact : NSObject {
	@private NSString *identification;
	@private NSString *name;
	@private NSString *email;
	@private float balance;
}

- (float)balance;									// Returns the balance value.
- (void)setBalance:(float)balanceVar;				// Sets the balance value.

@property (copy, readwrite) NSString *identification;
@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *email;
@property (getter=balance,setter=setBalance:) float balance;
@end
