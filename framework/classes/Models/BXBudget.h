//
//  BXBudget.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 31/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXBudget : NSObject {
	@private NSString *identification;
	@private NSString *name;
	@private float limit;
	@private float remaining;
	@private NSString *period;
	@private NSString *currentPeriod;
	@private NSMutableArray *tags;			// Collection of Tags.
	@private NSMutableArray *keywords;		// Collection of NSString's.
}

- (float)limit;										// Rerturns the limit value.
- (void)setLimit:(float)limitVar;					// Sets the limit value.
- (float)remaining;									// Returns the remaining value.
- (void)setRemaining:(float)remainingVar;			// Sets the remaining value.
- (void)addTag:(NSString *)tag;						// Adds a NSString to the tags array.
- (void)addKeyword:(NSString *)keyword;				// Adds a NSString to the keywords array.

@property (copy, readwrite) NSString *identification;
@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *period;
@property (copy, readwrite) NSString *currentPeriod;
@property (copy, readonly) NSArray *tags;
@property (copy, readonly) NSArray *keywords;
@property (getter=limit,setter=setLimit:) float limit;
@property (getter=remaining,setter=setRemaining:) float remaining;
@end
