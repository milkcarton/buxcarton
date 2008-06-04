//
//  BXTransaction.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXTransaction : NSObject {
	@private int identification;
	@private NSString *description;
	@private NSDate *date;
	@private NSString *type;
	@private float amount;
	@private int accountId;
	@private NSMutableArray *tags;
	@private NSString *extraInfo;
}

- (int)identification;								// Returns the identification value.
- (void)setIdentification:(int)identificationVar;	// Sets the identification value.
- (float)amount;									// Returns the amount value.
- (void)setAmount:(float)amountVar;					// Sets the amount value.
- (int)accountId;									// Returns the accountId value.
- (void)setAccountId:(int)accountIdVar;				// Sets the accountId value.
- (void)addTag:(NSString *)tag;						// Adds a NSString to the tags array.

@property (copy, readwrite) NSString *description;
@property (copy, readwrite) NSDate *date;
@property (copy, readwrite) NSString *type;
@property (copy, readonly) NSArray *tags;
@property (copy, readwrite) NSString *extraInfo;
@property (getter=identification,setter=setIdentification:) int identification;
@property (getter=amount,setter=setAmount:) float amount;
@property (getter=accountId,setter=setAccountId:) int accountId;
@end
