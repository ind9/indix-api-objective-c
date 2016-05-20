//
//  IXMProductPrice.m
//  RetailerApp
//
//  Created by Nalin Chhajer on 27/05/15.
//  Copyright (c) 2015 indix. All rights reserved.
//

#import "IXMProductPrice.h"

@implementation IXMProductPrice

- (instancetype)initWithV2Model:(NSDictionary *)offerDictionary storeDict:(NSDictionary *)storeDict currency:(NSString *)currency {
    if (self = [super init]) {
        self.storeName = [storeDict objectForKey:@"storeName"];
        self.listPrice = [[offerDictionary objectForKey:@"listPrice"] stringValue];
        self.salePrice = [[offerDictionary objectForKey:@"salePrice"] stringValue];
        self.sellerName = [offerDictionary objectForKey:@"seller"];
        self.availabilityStatus = [offerDictionary objectForKey:@"availability"];
        self.productUrl = [offerDictionary objectForKey:@"productUrl"];
        self.priceType = currency;
        self.pId = [offerDictionary objectForKey:@"pid"];
        self.imageUrl = [offerDictionary objectForKey:@"imageUrl"];
        
        
        NSInteger timeStamp = [[offerDictionary objectForKey:@"lastRecordedAt"] integerValue];
        self.lastRecordedAt = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        
    }
    return self;
}

@end
