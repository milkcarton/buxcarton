//
//  BXItem.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 01/06/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXItem : NSObject {
	@private NSString *tag;
	@private float amount;
}

- (float)amount;								// Returns the amount value.
- (void)setAmount:(float)amountVar;				// Sets the amount value.

@property (copy, readwrite) NSString *tag;
@property (getter=amount,setter=setAmount:) float amount;
@end
