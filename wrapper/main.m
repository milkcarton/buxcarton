//
//  main.m
//  BuxCartonWrapper
//
//  Created by Jelle Vandebeeck on 04/06/08.
//  Copyright milkcarton 2008. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <BuxCarton/BXClient.h>
#import <BuxCarton/BXContact.h>

int main(int argc, char *argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	BXClient *buxfer = [[BXClient alloc] init];
	buxfer.userId = @"jelle.vandebeeck@mac.com";
	buxfer.password = @"bizkit";
	NSError *error;
	[buxfer authenticateWithError:&error];
	if (!error) {
		NSArray *contacts = [buxfer getContactsWithError:&error];		// Fetch all the contacts.
		NSLog(@"contacts: %i", [contacts count]);
		
		NSArray *groups = [buxfer getGroupsWithError:&error];			// Fetch all the groups.
		NSLog(@"groups: %i", [groups count]);
		
		NSArray *budgets = [buxfer getBudgetsWithError:&error];			// Fetch all the groups.
		NSLog(@"budgets: %i", [budgets count]);
		
		NSArray *tags = [buxfer getTagsWithError:&error];				// Fetch all the tags.
		NSLog(@"tags: %i", [tags count]);
		
		NSArray *impacts = [buxfer getImpactsWithError:&error];			// Fetch all the impacts.
		NSLog(@"impacts: %i", [impacts count]);
	}
	[buxfer release];
	
	[pool release];
	
	return 1;
    //return NSApplicationMain(argc,  (const char **) argv);
}
