//
//  MyViewController.h
//  Swift-Objc
//
//  Created by Yang Li on 2020/8/5.
//  Copyright © 2020 Yang Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyViewController : UIViewController

- (void) test1 NS_SWIFT_NAME(myTest());

- (void) test2 NS_SWIFT_UNAVAILABLE("please use myTest");

@end

NS_ASSUME_NONNULL_END
