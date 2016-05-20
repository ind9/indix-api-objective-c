//
//  IXMBrandFilter.m
//  RetailerApp
//
//  Created by Nalin Chhajer on 29/07/15.
//  Copyright (c) 2015 indix. All rights reserved.
//

#import "IXMBrandFilter.h"

@implementation IXMBrandFilter

- (instancetype)initWithV2ProductModel:(NSDictionary *)dict {
    if (self = [super init]) {
        self.key = [[dict objectForKey:@"id"] stringValue];
        self.name = [dict objectForKey:@"name"];
        self.count = [[dict objectForKey:@"count"] stringValue];
    }
    return self;
}

@end
