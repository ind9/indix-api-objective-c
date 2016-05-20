//
//  IXMProductDetail.h
//  RetailerApp
//
//  Created by Nalin Chhajer on 27/05/15.
//  Copyright (c) 2015 indix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IXMProductDescriptionAttributes.h"

@interface IXMProductDetail : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *skuNumber;
@property (nonatomic, strong) NSString *upcNumber;
@property (nonatomic, strong) NSString *mpnNumber;
@property (nonatomic, strong) NSArray *sellerNames;

@property (nonatomic, strong) NSArray *productDescriptionArray;


- (instancetype)initWithV2Model:(NSDictionary *)productDictionary;
- (NSString *)commaSperatedSellerName;

@end
