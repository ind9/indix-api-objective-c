//
//  IndixApiClient.m
//  ApiExample
//
//  Created by Nalin Chhajer on 18/05/16.
//  Copyright © 2016 Indix. All rights reserved.
//

#import "IndixApiClient.h"

NSString *const kIXAPIV2ServiceTokenAPIID = @"IXAPIServiceTokenAPIID";
NSString *const kIXAPIV2ServiceTokenAPIKey = @"IXAPIServiceTokenAPIKey";

NSString *const kIXAPIV2BaseURL = @"https://api.indix.com";
NSString *const kIXAPIV2GetParameterAPIID = @"app_id";
NSString *const kIXAPIV2GetParameterAPIKEY = @"app_key";

NSString *const kIXAPIV2StoresEndPoint = @"/v2/stores";
NSString *const kIXAPIV2BrandsEndPoint = @"/v2/brands";
NSString *const kIXAPIV2CategoriesEndPoint = @"/v2/categories";

NSString *const kIXAPIV2SearchSuggestionEndPoint = @"/v2/products/suggestions";

NSString *const kIXAPIV2SearchSummaryProductsEndPoint = @"/v2/summary/products";
NSString *const kIXAPIV2SearchOffersStandardProductsEndPoint = @"/v2/OffersStandard/products";
NSString *const kIXAPIV2SearchOffersPremiumProductsEndPoint = @"/v2/OffersPremium/products";
NSString *const kIXAPIV2SearchCatalogStandardProductsEndPoint = @"/v2/catalogStandard/products";
NSString *const kIXAPIV2SearchCatalogPremiumProductsEndPoint = @"/v2/catalogPremium/products";
NSString *const kIXAPIV2SearchUniversalProductsEndPoint = @"/v2/universal/products";

NSInteger const kIXAPIV2DefaultPageSize = 10;

NSString *const kIXRSortTypeRelevance = @"RELEVANCE";
NSString *const kIXRSortTypeMostRecent = @"MOST_RECENT";
NSString *const kIXRSortTypePriceHighToLow = @"PRICE_HIGH_TO_LOW";
NSString *const kIXRSortTypePriceLowToHigh = @"PRICE_LOW_TO_HIGH";

@implementation IndixApiClient

+ (NSString *)getServiceTokenAppId {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *serviceTokenId = [defaults stringForKey:kIXAPIV2ServiceTokenAPIID];
    return serviceTokenId;
}

+ (NSString *)getServiceTokenAppKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *serviceTokenId = [defaults stringForKey:kIXAPIV2ServiceTokenAPIKey];
    return serviceTokenId;
}

+ (void)setIndixAppId:(NSString *)appId appKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:appId forKey:kIXAPIV2ServiceTokenAPIID];
    [defaults setObject:key forKey:kIXAPIV2ServiceTokenAPIKey];
    [defaults synchronize];
}

+ (AFHTTPRequestOperation *)getBrands:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2BrandsEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getStores:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2StoresEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getCategories:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2CategoriesEndPoint parameter:nil success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getSearchSuggestions:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchSuggestionEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductSummary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchSummaryProductsEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductOffersStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchOffersStandardProductsEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductOffersPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchOffersPremiumProductsEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductCatalogStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchCatalogStandardProductsEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductCatalogPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchCatalogPremiumProductsEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductUniversal:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchUniversalProductsEndPoint parameter:dictionary success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}


+ (BOOL)isPaginationPossibleForPage:(NSInteger)page andTotalCount:(NSInteger)count {
    
    NSInteger firstItem = (page - 1) * kIXAPIV2DefaultPageSize + 1;
    if (firstItem <= count) {
        return YES;
    }
    return NO;
}

+ (BOOL)isPaginationPossibleForOffersInStore:(NSInteger)page andTotalCount:(NSInteger)count {
    
    NSInteger firstItem = (page - 1) * 50 + 1;
    if (firstItem <= count) {
        return YES;
    }
    return NO;
}

// pid - *
+ (AFHTTPRequestOperation *)getProductLookupSummary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductDescription:dictionary];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:[NSString stringWithFormat:@"%@,%@", kIXAPIV2SearchSummaryProductsEndPoint,[dictionary objectForKey:@"mpid"]] parameter:queryParameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductLookupOffersStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductDescription:dictionary];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:[NSString stringWithFormat:@"%@,%@", kIXAPIV2SearchOffersStandardProductsEndPoint,[dictionary objectForKey:@"mpid"]] parameter:queryParameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductLookupOffersPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductDescription:dictionary];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:[NSString stringWithFormat:@"%@,%@", kIXAPIV2SearchOffersPremiumProductsEndPoint,[dictionary objectForKey:@"mpid"]] parameter:queryParameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductLookupCatalogStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductDescription:dictionary];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:[NSString stringWithFormat:@"%@,%@", kIXAPIV2SearchCatalogStandardProductsEndPoint,[dictionary objectForKey:@"mpid"]] parameter:queryParameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductLookupCatalogPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductDescription:dictionary];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:[NSString stringWithFormat:@"%@,%@", kIXAPIV2SearchCatalogPremiumProductsEndPoint,[dictionary objectForKey:@"mpid"]] parameter:queryParameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)getProductLookupUniversal:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductDescription:dictionary];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:[NSString stringWithFormat:@"%@,%@", kIXAPIV2SearchUniversalProductsEndPoint,[dictionary objectForKey:@"mpid"]] parameter:queryParameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    return operation;
}

// type - default
+ (NSMutableDictionary *)patchQueryToProductDescription:(NSDictionary *)dictionary {
    NSMutableDictionary *queryParameter = [[NSMutableDictionary alloc] init];
    
    
    if ([dictionary objectForKey:@"pageNumber"]) {
        [queryParameter setValue:[dictionary objectForKey:@"pageNumber"] forKey:@"pageNumber"];
    }
    
    if ([dictionary objectForKey:@"countryCode"]) {
        [queryParameter setValue:[dictionary objectForKey:@"countryCode"] forKey:@"countryCode"];
    }
    
    
    return queryParameter;
}


+ (AFHTTPRequestOperation *)httpGetRequestForEndPoint:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperationManager *manager = [self prepareHttpRequestManager];
    
    NSMutableDictionary *getparams = [[NSMutableDictionary alloc] init];
    if (parameter) {
        [getparams addEntriesFromDictionary:parameter];
    }
    [getparams setObject:[self getServiceTokenAppId] forKey:kIXAPIV2GetParameterAPIID];
    [getparams setObject:[self getServiceTokenAppKey] forKey:kIXAPIV2GetParameterAPIKEY];
    
    AFHTTPRequestOperation * operation = [manager GET:url parameters:getparams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
    
    return operation;
}

+ (AFHTTPRequestOperationManager *)prepareHttpRequestManager {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kIXAPIV2BaseURL]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // [manager.requestSerializer setValue:@"calvinAndHobbessRock" forHTTPHeaderField:@"X-I do what I want"];
    return manager;
}

@end
