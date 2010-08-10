//
//  GBProtocolData.m
//  appledoc
//
//  Created by Tomaz Kragelj on 26.7.10.
//  Copyright (C) 2010, Gentle Bytes. All rights reserved.
//

#import "GBDataObjects.h"
#import "GBProtocolData.h"

@implementation GBProtocolData

#pragma mark Initialization & disposal

+ (id)protocolDataWithName:(NSString *)name {
	return [[[self alloc] initWithName:name] autorelease];
}

- (id)initWithName:(NSString *)name {
	NSParameterAssert(name != nil && [name length] > 0);
	GBLogDebug(@"Initializing protocol with name %@...", name);
	self = [super init];
	if (self) {
		_protocolName = [name copy];
		_adoptedProtocols = [[GBAdoptedProtocolsProvider alloc] init];
		_methods = [[GBMethodsProvider alloc] init];
	}
	return self;
}

#pragma mark Overriden methods

- (void)mergeDataFromObject:(id)source {
	if (!source || source == self) return;
	GBLogDebug(@"%@: Merging data from %@...", self, source);
	NSParameterAssert([[source nameOfProtocol] isEqualToString:self.nameOfProtocol]);
	[super mergeDataFromObject:source];
	GBProtocolData *sourceProtocol = (GBProtocolData *)source;
	[self.adoptedProtocols mergeDataFromProtocolsProvider:sourceProtocol.adoptedProtocols];
	[self.methods mergeDataFromMethodsProvider:sourceProtocol.methods];
}

- (NSString *)description {
	return self.nameOfProtocol;
}

#pragma mark Properties

@synthesize nameOfProtocol = _protocolName;
@synthesize adoptedProtocols = _adoptedProtocols;
@synthesize methods = _methods;

@end