//
//  GBApplicationStringsProvider.m
//  appledoc
//
//  Created by Tomaz Kragelj on 1.10.10.
//  Copyright (C) 2010, Gentle Bytes. All rights reserved.
//

#import "GBApplicationStringsProvider.h"

@implementation GBApplicationStringsProvider

#pragma mark Initialization & disposal

+ (id)provider {
	return [[[self alloc] init] autorelease];
}

#pragma mark Object output strings

- (NSDictionary *)objectPage {
	static NSMutableDictionary *result = nil;
	if (!result) {
		result = [[NSMutableDictionary alloc] init];
		[result setObject:@"%@ Class Reference" forKey:@"classTitle"];
		[result setObject:@"%@(%@) Category Reference" forKey:@"categoryTitle"];
		[result setObject:@"%@ Protocol Reference" forKey:@"protocolTitle"];
	}
	return result;
}

- (NSDictionary *)objectSpecifications {
	static NSMutableDictionary *result = nil;
	if (!result) {
		result = [[NSMutableDictionary alloc] init];
		[result setObject:@"Inherits from" forKey:@"inheritsFrom"];
		[result setObject:@"Conforms to" forKey:@"conformsTo"];
		[result setObject:@"Declared in" forKey:@"declaredIn"];
	}
	return result;
}

- (NSDictionary *)objectOverview {
	static NSMutableDictionary *result = nil;
	if (!result) {
		result = [[NSMutableDictionary alloc] init];
		[result setObject:@"Overview" forKey:@"title"];
	}
	return result;
}

- (NSDictionary *)objectTasks {
	static NSMutableDictionary *result = nil;
	if (!result) {
		result = [[NSMutableDictionary alloc] init];
		[result setObject:@"Tasks" forKey:@"title"];
		[result setObject:@"Other Methods" forKey:@"otherMethodsSectionName"];
		[result setObject:@"required method" forKey:@"requiredMethod"];
	}
	return result;
}

- (NSDictionary *)objectMethods {
	static NSMutableDictionary *result = nil;
	if (!result) {
		result = [[NSMutableDictionary alloc] init];
		[result setObject:@"Class Methods" forKey:@"classMethodsTitle"];
		[result setObject:@"Instance Methods" forKey:@"instanceMethodsTitle"];
		[result setObject:@"Properties" forKey:@"propertiesTitle"];
		[result setObject:@"Parameters" forKey:@"parametersTitle"];
		[result setObject:@"Return Value" forKey:@"resultTitle"];
		[result setObject:@"Discussion" forKey:@"discussionTitle"];
		[result setObject:@"Exceptions" forKey:@"exceptionsTitle"];
		[result setObject:@"See Also" forKey:@"seeAlsoTitle"];
		[result setObject:@"Declared In" forKey:@"declaredInTitle"];
	}
	return result;
}

@end