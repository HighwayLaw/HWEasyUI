//
//  HWUIDelegate.h
//  TestApp
//
//  Created by liuhaiwei on 2021/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWEasyUIProxy : NSObject <UITableViewDelegate, UITableViewDataSource>

+ (instancetype)sharedInstance;

- (void)clickOnButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
