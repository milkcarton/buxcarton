//
//  BXTag.h
//  BuxCarton
//
//  Created by Jelle Vandebeeck on 31/05/08.
//  Copyright 2008 milkcarton. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BXTag : NSObject {
	@private NSString *identification;
	@private NSString *name;
	@private NSString *parentId;
}

@property (copy, readwrite) NSString *identification;
@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *parentId;
@end
