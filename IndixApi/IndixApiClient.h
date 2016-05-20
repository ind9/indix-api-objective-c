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
+ (void)setServiceTokenId:(NSString *)appId appKey:(NSString *)key;

// Search Suggestions
+ (AFHTTPRequestOperation *)requestSearchSuggestionForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

// Search
// query - string
+ (AFHTTPRequestOperation *)requestSKUSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (AFHTTPRequestOperation *)requestMPNSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (AFHTTPRequestOperation *)requestUPCSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (AFHTTPRequestOperation *)requestGeneralSearchForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (BOOL)isPaginationPossibleForPage:(NSInteger)page andTotalCount:(NSInteger)count;

+ (AFHTTPRequestOperation *)requestProductDescriptionForQuery:(NSDictionary *)dictionary withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
+ (NSMutableDictionary *)patchQueryToProductDescription:(NSDictionary *)dictionary;

+ (BOOL)isPaginationPossibleForOffersInStore:(NSInteger)page andTotalCount:(NSInteger)count;

// Rest methods
+ (AFHTTPRequestOperationManager *)prepareHttpRequestManager;
+ (AFHTTPRequestOperation *)httpGetRequestForEndPoint:(NSString *)url parameter:(NSDictionary *)parameter withManager:(AFHTTPRequestOperationManager *)operationManger success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


// Testing
+ (NSMutableDictionary *)patchQueryToProductSearch:(NSDictionary *)dictionary;



@end
