# PBDNotificationObserver

https://travis-ci.org/paweldudek/PBDNotificationObserver.svg?branch=master

This is a small helper class that helps writing tests that assert whether a specific notification was posted. 

## Motivation

Let's assume we want to test whether a specific notification was posted by our object. You would normally do this by registering a block observer and checking whether it captured an actual notification:

```objc

NSNotification *capturedNotification = nil;

id <NSObject> token = [[NSNotificationCenter defaultCenter] addObserverForName:SomeNotification
                                                                        object:anObject
                                                                         queue:nil
                                                                    usingBlock:^(NSNotification *note) {
                                                                        capturedNotification = note;
                                                                    }];

// Run code that posts the notification

XCTAssertNotNil(capturedNotification);

[[NSNotificationCenter defaultCenter] removeObserver:token];

```

That's quite a lot of code, which really decreases code readability and thus requires more focus for you (and other developers) to understand what's happening here. 

This small tool solves this issue by introducing a notification observer:

```objc
PBDNotificationObserver *observer = [PBDNotificationObserver new];

// Run code that posts the notification

verifyNotification(observer, SomeNotification);
```

You can also pass [OCHamcrest](https://github.com/hamcrest/OCHamcrest) matchers instead of notification name. 

## Usage

You can either drop in `PBDNotificationObserver` into your project directly or use Cocoapods:

```
pod 'PBDNotificationObserver', '0.0.1'
```
