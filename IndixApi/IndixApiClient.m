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

NSString *const kIXAPIV2SearchSuggestionEndPoint = @"/v2/products/suggestions";
NSString *const kIXAPIV2SearchProductsEndPoint = @"/v2/summary/products";

NSString *const kIXAPIV2ProductDescriptionEndPoint = @"/v2/universal/products/%@";
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

+ (void)setServiceTokenId:(NSString *)appId appKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:appId forKey:kIXAPIV2ServiceTokenAPIID];
    [defaults setObject:key forKey:kIXAPIV2ServiceTokenAPIKey];
    [defaults synchronize];
}

+ (AFHTTPRequestOperation *)requestSearchSuggestionForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSDictionary *queryParameter = [self patchQueryToSearchSuggestion:dictionary];
    [queryParameter setValue:[dictionary objectForKey:@"q"] forKey:@"q"];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchSuggestionEndPoint parameter:queryParameter withManager:operationManger success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    return operation;
}

+ (NSMutableDictionary *)patchQueryToSearchSuggestion:(NSDictionary *)dictionary {
    NSMutableDictionary *queryParameter = [[NSMutableDictionary alloc] init];
    if ([dictionary objectForKey:@"country_code"]) {
        [queryParameter setValue:[dictionary objectForKey:@"countryCode"] forKey:@"countryCode"];
    }
    
    return queryParameter;
}

// query and patch
+ (AFHTTPRequestOperation *)requestSKUSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSDictionary *queryParameter = [self patchQueryToProductSearchUsingNumber:dictionary];
    [queryParameter setValue:[dictionary objectForKey:@"sku"] forKey:@"sku"];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchProductsEndPoint parameter:queryParameter withManager:operationManger success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)requestMPNSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSDictionary *queryParameter = [self patchQueryToProductSearchUsingNumber:dictionary];
    [queryParameter setValue:[dictionary objectForKey:@"mpn"] forKey:@"mpn"];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchProductsEndPoint parameter:queryParameter withManager:operationManger success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)requestUPCSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSDictionary *queryParameter = [self patchQueryToProductSearchUsingNumber:dictionary];
    [queryParameter setValue:[dictionary objectForKey:@"upc"] forKey:@"upc"];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchProductsEndPoint parameter:queryParameter withManager:operationManger success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    return operation;
}

+ (AFHTTPRequestOperation *)requestGeneralSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductSearch:dictionary];
    [queryParameter setValue:[dictionary objectForKey:@"q"] forKey:@"q"];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:kIXAPIV2SearchProductsEndPoint parameter:queryParameter withManager:operationManger success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    return operation;
}

// pageNumber = 1 and above
// sortBy = PRICE_LOW_TO_HIGH, PRICE_HIGH_TO_LOW, MOST_RECENT
// count = 10 by default
// filter_enabled = true/false
// filter_by_categories -> sets
// filter_by_brands -> sets
// filter_by_stores -> sets
+ (NSMutableDictionary *)patchQueryToProductSearch:(NSDictionary *)dictionary {
    NSDictionary *params = [self patchPlainToProductSearch:dictionary];
    NSMutableDictionary *queryParameter = [[NSMutableDictionary alloc] initWithDictionary:params];
    
    if ([dictionary objectForKey:@"facetBy"] && [[dictionary objectForKey:@"facetBy"] count] > 0) {
        [queryParameter setValue:[dictionary objectForKey:@"facetBy"] forKey:@"facetBy"];
    }
    
    
    return queryParameter;
}




+ (NSMutableDictionary *)patchPlainToProductSearch:(NSDictionary *)dictionary {
    NSMutableDictionary *queryParameter = [[NSMutableDictionary alloc] init];
    if ([dictionary objectForKey:@"pageNumber"]) {
        [queryParameter setValue:[dictionary objectForKey:@"pageNumber"] forKey:@"pageNumber"];
    }
    
    if ([dictionary objectForKey:@"sortBy"]) {
        NSString *sortType = [dictionary objectForKey:@"sortBy"];
        if ([sortType isEqualToString:kIXRSortTypeMostRecent]) {
            [queryParameter setValue:kIXRSortTypeMostRecent forKey:@"sortBy"];
        }
        else if ([sortType isEqualToString:kIXRSortTypePriceHighToLow]) {
            [queryParameter setValue:kIXRSortTypePriceHighToLow forKey:@"sortBy"];
        }
        else if ([sortType isEqualToString:kIXRSortTypePriceLowToHigh]) {
            [queryParameter setValue:kIXRSortTypePriceLowToHigh forKey:@"sortBy"];
        }
    }
    
    if ([dictionary objectForKey:@"storesCount"]) {
        [queryParameter setValue:[dictionary objectForKey:@"storesCount"] forKey:@"storesCount"];
    }
    
    if ([dictionary objectForKey:@"countryCode"]) {
        [queryParameter setValue:[dictionary objectForKey:@"countryCode"] forKey:@"countryCode"];
    }
    
    
    if ([dictionary objectForKey:@"lastRecordedIn"]) {
        [queryParameter setValue:[dictionary objectForKey:@"lastRecordedIn"] forKey:@"lastRecordedIn"];
    }
    
    if ([dictionary objectForKey:@"pageSize"]) {
        [queryParameter setValue:[dictionary objectForKey:@"pageSize"] forKey:@"pageSize"];
    }
    else {
        [queryParameter setValue:[NSString stringWithFormat:@"%d", (int)kIXAPIV2DefaultPageSize] forKey:@"pageSize"];
    }
    
    
    
    if ([dictionary objectForKey:@"availability"]) {
        [queryParameter setValue:[dictionary objectForKey:@"availability"] forKey:@"availability"];
    }
    
    if ([dictionary objectForKey:@"startPrice"]) {
        [queryParameter setValue:[dictionary objectForKey:@"startPrice"] forKey:@"startPrice"];
    }
    
    if ([dictionary objectForKey:@"endPrice"]) {
        [queryParameter setValue:[dictionary objectForKey:@"endPrice"] forKey:@"endPrice"];
    }
    
    
    if ([dictionary objectForKey:@"categoryId"]) {
        NSSet *set = [dictionary objectForKey:@"categoryId"];
        if ([set count] > 0) {
            [queryParameter setValue:[dictionary objectForKey:@"categoryId"] forKey:@"categoryId"];
            
        }
    }
    
    if ([dictionary objectForKey:@"brandId"]) {
        NSSet *set = [dictionary objectForKey:@"brandId"];
        if ([set count] > 0) {
            [queryParameter setValue:[dictionary objectForKey:@"brandId"] forKey:@"brandId"];
            
        }
    }
    
    if ([dictionary objectForKey:@"storeId"]) {
        NSSet *set = [dictionary objectForKey:@"storeId"];
        if ([set count] > 0) {
            [queryParameter setValue:[dictionary objectForKey:@"storeId"] forKey:@"storeId"];
        }
        
        
    }
    
    
    return queryParameter;
}


+ (NSMutableDictionary *)patchQueryToProductSearchUsingNumber:(NSDictionary *)dictionary {
    NSMutableDictionary *queryParameter = [[NSMutableDictionary alloc] init];
    if ([dictionary objectForKey:@"countryCode"]) {
        [queryParameter setValue:[dictionary objectForKey:@"countryCode"] forKey:@"countryCode"];
    }
    
    return queryParameter;
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
+ (AFHTTPRequestOperation *)requestProductDescriptionForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSMutableDictionary *queryParameter = [self patchQueryToProductDescription:dictionary];
    
    AFHTTPRequestOperation * operation = [self httpGetRequestForEndPoint:[NSString stringWithFormat:kIXAPIV2ProductDescriptionEndPoint, [dictionary objectForKey:@"mpid"]] parameter:queryParameter withManager:operationManger success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
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


+ (AFHTTPRequestOperation *)httpGetRequestForEndPoint:(NSString *)url parameter:(NSDictionary *)parameter withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    AFHTTPRequestOperationManager *manager = operationManger;
    if (!manager) {
        manager = [self prepareHttpRequestManager];
    }
    
    NSMutableDictionary *getparams = [[NSMutableDictionary alloc] init];
    if (parameter) {
        [getparams addEntriesFromDictionary:parameter];
    }
    [getparams setObject:[self getServiceTokenAppId] forKey:kIXAPIV2GetParameterAPIID];
    [getparams setObject:[self getServiceTokenAppKey] forKey:kIXAPIV2GetParameterAPIKEY];
    
    AFHTTPRequestOperation * operation = [manager GET:url parameters:getparams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
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
