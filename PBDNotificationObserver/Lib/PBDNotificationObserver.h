/*
 * Copyright (c) 2015 Paweł Dudek. All rights reserved.
 */
#import <Foundation/Foundation.h>


OBJC_EXPORT void VerifyNotificationsCountWithLocation(id observer, id matcherOrNotificationName, unsigned count, id testCase, const char *fileName, int lineNumber);

#define verifyNotificationsCount(observer, matcherOrNotificationName, count) VerifyNotificationsCountWithLocation(observer, matcherOrNotificationName, count, self, __FILE__, __LINE__)

#define verifyNotification(observer, matcherOrNotificationName) verifyNotificationsCount(observer, matcherOrNotificationName, 1)

@interface PBDNotificationObserver : NSObject
@end
