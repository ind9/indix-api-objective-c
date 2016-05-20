//
//  IndixApiClient.h
//  ApiExample
//
//  Created by Nalin Chhajer on 18/05/16.
//  Copyright © 2016 Indix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

extern NSInteger const kIXAPIV2DefaultPageSize;
extern NSString * const kIXRSortTypeRelevance;
extern NSString * const kIXRSortTypeMostRecent;
extern NSString * const kIXRSortTypePriceHighToLow;
extern NSString * const kIXRSortTypePriceLowToHigh;

@interface IndixApiClient : NSObject

// App ID and Key to make this api work
+ (NSString *)getServiceTokenAppId;
+ (NSString *)getServiceTokenAppKey;
+ (void)setIndixAppId:(NSString *)appId appKey:(NSString *)key;


+ (AFHTTPRequestOperation *)getCategories:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getBrands:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getStores:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

// Search Suggestions
+ (AFHTTPRequestOperation *)getSearchSuggestions:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

// Search
+ (AFHTTPRequestOperation *)getProductSummary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductOffersStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductOffersPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductCatalogStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductCatalogPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductUniversal:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (BOOL)isPaginationPossibleForPage:(NSInteger)page andTotalCount:(NSInteger)count;
+ (BOOL)isPaginationPossibleForOffersInStore:(NSInteger)page andTotalCount:(NSInteger)count;


// Search Lookup
+ (AFHTTPRequestOperation *)getProductLookupSummary:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductLookupOffersStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductLookupOffersPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductLookupCatalogStandard:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductLookupCatalogPremium:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)getProductLookupUniversal:(NSDictionary *)dictionary success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (NSMutableDictionary *)patchQueryToProductDescription:(NSDictionary *)dictionary;


// Rest methods
+ (AFHTTPRequestOperationManager *)prepareHttpRequestManager;
+ (AFHTTPRequestOperation *)httpGetRequestForEndPoint:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;



@end
