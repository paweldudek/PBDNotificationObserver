//
//  PBDNotificationObserverTests.m
//  PBDNotificationObserverTests
//
//  Created by Paweł Dudek on 19/04/15.
//  Copyright (c) 2015 Paweł Dudek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PBDNotificationObserver.h"
#import <OCHamcrest/OCHamcrest.h>

@interface PBDNotificationObserverTests : XCTestCase

@end

@implementation PBDNotificationObserverTests

- (void)testVerifyNotificationName {
    PBDNotificationObserver *observer = [PBDNotificationObserver new];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"Fixture Name" object:nil];

    verifyNotification(observer, @"Fixture Name");
}

- (void)testVerifyNotificationNameWithMatcher {
    PBDNotificationObserver *observer = [PBDNotificationObserver new];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"Fixture Name" object:nil];

    id <HCMatcher> matcher = HC_hasProperty(@"name", @"Fixture Name");

    verifyNotification(observer, matcher);
}

@end
