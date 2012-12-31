//
//  MGOrderedDictionaryTests.m
//  MGOrderedDictionaryTests
//
//	Created by Gwynne Raskind on 31/12/12.
//	Copyright 2012 Gwynne Raskind. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

#import "MGOrderedDictionaryTests.h"
#import "MGOrderedDictionary.h"

@implementation MGOrderedDictionaryTests

/*
- (void)insertObject:(id)anObject forKey:(id<NSCopying>)aKey atIndex:(NSUInteger)anIndex;
- (id)keyAtIndex:(NSUInteger)anIndex;
- (NSEnumerator *)reverseKeyEnumerator;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;

- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key;

- (NSUInteger)indexOfKey:(id)anObject;
- (NSUInteger)indexOfKey:(id)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfKeyIdenticalTo:(id)anObject;
- (NSUInteger)indexOfKeyIdenticalTo:(id)anObject inRange:(NSRange)range;
- (id)lastKey;

- (void)sortUsingFunction:(NSInteger (*)(id, id, void *))compare context:(void *)context;
- (void)sortUsingSelector:(SEL)comparator;
#if NS_BLOCKS_AVAILABLE
- (void)sortUsingComparator:(NSComparator)cmptr;
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
#endif
*/

- (void)testCreationAndAccess
{
	MGOrderedDictionary *dict = [[MGOrderedDictionary alloc] initWithDictionary:@{ @"test": @"success" }];
	
	STAssertNotNil(dict, @"Ordered dictionary was nil");
	STAssertEqualObjects([dict keyAtIndex:0], @"test", @"Ordered dictionary missing its key");
	STAssertEqualObjects([dict objectForKey:@"test"], @"success", @"Ordered dictionary missing its value");
	
	[dict insertObject:@"fun" forKey:@"something" atIndex:0];
	STAssertEquals(dict.count, (NSUInteger)2, @"Ordered dictionary didn't insert new value");
	STAssertEqualObjects([dict keyAtIndex:0], @"something", @"Ordered dictionary didn't insert in the right place");
	STAssertEqualObjects([dict keyAtIndex:1], @"test", @"Ordered dictionary didn't maintain ordering");
	STAssertEqualObjects([dict objectForKey:@"something"], @"fun", @"Ordered dictionary didn't return the right value for key");
}

- (void)testSubscriptOperators
{
	MGOrderedDictionary *dict = [[MGOrderedDictionary alloc] init];
	
	dict[@"a"] = @"b";
	dict[@"c"] = @"d";
	
	STAssertEqualObjects(dict[0], @"a", @"First key was wrong");
	STAssertEqualObjects(dict[@"a"], @"b", @"First access by keyed subscript was wrong");
	STAssertEqualObjects(dict[dict[0]], @"b", @"First access by nesting indexed subscript in keyed subscript was wrong");
	STAssertEqualObjects(dict[1], @"c", @"Second key was wrong");
	STAssertEqualObjects(dict[@"c"], @"d", @"Second access by keyed subscript was wrong");
	STAssertEqualObjects(dict[dict[1]], @"d", @"Second access by nesting indexed subscript in keyed subscript was wrong");
}

- (void)testSorting
{
	MGOrderedDictionary *dict = [[MGOrderedDictionary alloc] init];
	
	dict[@"z"] = @0;
	dict[@"y"] = @1;
	dict[@"x"] = @2;
	dict[@"w"] = @3;
	dict[@"v"] = @4;
	dict[@"u"] = @5;
	dict[@"t"] = @6;
	dict[@"s"] = @7;
	dict[@"r"] = @8;
	dict[@"q"] = @9;
	
	STAssertEqualObjects(dict.allKeys, (@[@"z", @"y", @"x", @"w", @"v", @"u", @"t", @"s", @"r", @"q"]), @"Key array wasn't correctly inserted.");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wselector"
	[dict sortUsingSelector:@selector(localizedCompare:)];
#pragma clang diagnostic pop
	STAssertEqualObjects(dict.allKeys, (@[@"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"]), @"Key array isn't correctly sorted.");
}

@end
