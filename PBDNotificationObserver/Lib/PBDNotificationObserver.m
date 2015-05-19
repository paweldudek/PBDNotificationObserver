/*
 * Copyright (c) 2015 Paweł Dudek. All rights reserved.
 */
#import "PBDNotificationObserver.h"
#import <OCHamcrest/OCHamcrest.h>

@interface PBDNotificationObserver ()
@property(nonatomic, strong) NSMutableArray *capturedNotifications;
@end

void VerifyNotificationsCountWithLocation(id observer, id matcherOrNotificationName, unsigned count, id testCase, const char *fileName, int lineNumber) {

    id <HCMatcher> matcher = nil;

    if ([matcherOrNotificationName conformsToProtocol:@protocol(HCMatcher)]) {
        matcher = matcherOrNotificationName;
    } else {
        matcher = HC_hasProperty(@"name", matcherOrNotificationName);
    }

    NSInteger numberOfMatches = 0;
    for (NSNotification *notification in [[observer capturedNotifications] copy]) {
        numberOfMatches += [matcher matches:notification];
    }

    BOOL success = numberOfMatches == count;
    NSString *reason = nil;
    if (success) {
        reason = [NSString stringWithFormat:@"Expected notification was not posted."];
    }
    else {
        reason = [NSString stringWithFormat:@"Expected %d matching notifications, but received %ld.", count,
                                            (long)numberOfMatches];
    }

    if (!success) {
        HCTestFailure *failure = [[HCTestFailure alloc] initWithTestCase:testCase
                                                                fileName:[NSString stringWithUTF8String:fileName]
                                                              lineNumber:(NSUInteger)lineNumber
                                                                  reason:reason];
        HCTestFailureHandler *chain = HC_testFailureHandlerChain();
        [chain handleFailure:failure];
    }
};

@implementation PBDNotificationObserver

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationPosted:)
                                                     name:nil
                                                   object:nil];

        self.capturedNotifications = [NSMutableArray new];
    }

    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -

- (void)notificationPosted:(NSNotification *)notification {
    [self.capturedNotifications addObject:notification];
}

@end
