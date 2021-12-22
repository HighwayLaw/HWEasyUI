//
//  HWUIDelegate.m
//  TestApp
//
//  Created by liuhaiwei on 2021/12/20.
//

#import <UIKit/UIKit.h>
#import "HWEasyUIProxy.h"
#import "UITableView+HWEasyUI.h"

@interface HWEasyUIProxy ()

@end

@implementation HWEasyUIProxy

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //required protocol methods
    NSAssert(tableView.cellForRowHandler, @"cellForRowHandler cannot be nil");
    return tableView.cellForRowHandler(tableView, indexPath);
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //required protocol methods
    NSAssert(tableView.numberOfRowsHandler, @"numberOfRowsHandler cannot be nil");
    return tableView.numberOfRowsHandler(tableView, section);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.numberOfSectionsHandler) {
        return tableView.numberOfSectionsHandler(tableView);
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.heightForRowHandler) {
        return tableView.heightForRowHandler(tableView, indexPath);
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView.heightForHeaderHandler) {
        return tableView.heightForHeaderHandler(tableView, section);
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (tableView.heightForFooterHandler) {
        return tableView.heightForFooterHandler(tableView, section);
    }
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView.viewForHeaderHandler) {
        return tableView.viewForHeaderHandler(tableView, section);
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (tableView.viewForFooterHandler) {
        return tableView.viewForFooterHandler(tableView, section);
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.didSelectRowHandler) {
        tableView.didSelectRowHandler(tableView, indexPath);
    }
}

@end
