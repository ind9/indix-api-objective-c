//
//  ApiExampleTests.m
//  ApiExampleTests
//
//  Created by Nalin Chhajer on 18/05/16.
//  Copyright © 2016 Indix. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IndixApiClient.h"
#import "IXRApiV2Parser.h"

@interface ApiExampleTests : XCTestCase

@end

@implementation ApiExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIndixAPIV2KeyIsValid {
    [IndixApiClient setServiceTokenId:@"foo" appKey:@"bar"];
    NSString * api_ID = [IndixApiClient getServiceTokenAppId];
    NSString * api_key = [IndixApiClient getServiceTokenAppKey];
    XCTAssertEqualObjects(api_ID, @"foo", @"Indix api key is not same");
    XCTAssertEqualObjects(api_key, @"bar", @"Indix api key is not same");
}

- (void)testV2ParsingForProduct {
    NSData *jsonData = [self.class contentOfFile:@"product_search_v2" type:@"txt"];
    XCTAssertNotNil(jsonData, @"File reading failed");
    NSError *error;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    XCTAssertNil(error, @"Error parsing json");
    XCTAssertNotNil(dataDictionary, @"Json parsing failed");
    
    // parsing
    NSArray *prodArray = [IXRApiV2Parser parseProductArrayFromSearchDictionary:dataDictionary];
    XCTAssertNotNil(prodArray, @"Invalid test json.");
    
    NSInteger count = [IXRApiV2Parser parseProductCountFromSearchDictionary:dataDictionary];
    XCTAssert(count>0, @"Thsi value cannot be zero");
    
}

- (void)testV2PatchingQueryForProductSearch {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{@"pageNumber": @"1", @"sortBy": kIXRSortTypeMostRecent, @"storesCount":@"10"}];
    NSDictionary * oDict = [IndixApiClient patchQueryToProductSearch:dict];
    
    XCTAssertEqualObjects([oDict objectForKey:@"pageNumber"], @"1", @"This items should be equal");
    XCTAssertEqualObjects([oDict objectForKey:@"sortBy"], @"MOST_RECENT", @"This items should be equal");
    XCTAssertEqualObjects([oDict objectForKey:@"storesCount"], @"10", @"This items should be equal");
}

- (void)testV2PatchingQueryForProductDescription {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{@"countryCode": @"US", @"pageNumber": @"1"}];
    NSDictionary * oDict = [IndixApiClient patchQueryToProductDescription:dict];
    XCTAssertEqualObjects([oDict objectForKey:@"pageNumber"], @"1", @"This items should be equal");
    XCTAssertEqualObjects([oDict objectForKey:@"countryCode"], @"US", @"This items should be equal");
}

- (void)testV2PaginationForProductSearch {
    XCTAssert([IndixApiClient isPaginationPossibleForPage:1 andTotalCount:9], @"Pagination logic failed");
    XCTAssert(![IndixApiClient isPaginationPossibleForPage:2 andTotalCount:9], @"Pagination logic failed");
    XCTAssert([IndixApiClient isPaginationPossibleForPage:1 andTotalCount:1], @"Pagination logic failed");
    XCTAssert(![IndixApiClient isPaginationPossibleForPage:1 andTotalCount:0], @"Pagination logic failed");
    XCTAssert(![IndixApiClient isPaginationPossibleForPage:2 andTotalCount:10], @"Pagination logic failed");
}

- (void)testV2PaginationForProductOffersInStores {
    XCTAssert([IndixApiClient isPaginationPossibleForOffersInStore:1 andTotalCount:9], @"Pagination logic failed");
    XCTAssert(![IndixApiClient isPaginationPossibleForOffersInStore:2 andTotalCount:9], @"Pagination logic failed");
    XCTAssert([IndixApiClient isPaginationPossibleForOffersInStore:1 andTotalCount:1], @"Pagination logic failed");
    XCTAssert(![IndixApiClient isPaginationPossibleForOffersInStore:1 andTotalCount:0], @"Pagination logic failed");
    XCTAssert(![IndixApiClient isPaginationPossibleForOffersInStore:2 andTotalCount:10], @"Pagination logic failed");
}

- (void)testV2ParsingForProductDetails {
    NSData *jsonData = [self.class contentOfFile:@"product_desc_v2" type:@"txt"];
    XCTAssertNotNil(jsonData, @"File reading failed");
    NSError *error;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    XCTAssertNil(error, @"Error parsing json");
    XCTAssertNotNil(dataDictionary, @"Json parsing failed");
    
    // parsing
    IXMProductDetail *prodDetail = [IXRApiV2Parser parseDetailFromProductDetailDictionary:dataDictionary];
    XCTAssertNotNil(prodDetail, @"Parsing failed for parseDetailFromProductDetailDictionary");
    NSArray *prodpriceArray = [IXRApiV2Parser parsePriceDetailsFromProductDetailDictionary:dataDictionary];
    XCTAssertNotNil(prodpriceArray, @"Parsing failed for parsePriceDetailsFromProductDetailDictionary");
    XCTAssertNotNil(prodDetail.name, @"Name not found");
    XCTAssertNotNil(prodDetail.imageURL, @"ImageUrl not found");
}

- (void)testV2PatchForProductPriceRange {
    XCTAssertEqualObjects([IXProduct patchProductPriceRange:@"29-29"], @"$29", @"Patching failed to parse the product");
    XCTAssertEqualObjects([IXProduct patchProductPriceRange:@"29"], @"$29", @"Patching failed to parse the product");
    XCTAssertEqualObjects([IXProduct patchProductPriceRange:@" 29 - 29 "], @"$29", @"Patching failed to parse the product");
    XCTAssertEqualObjects([IXProduct patchProductPriceRange:@"29-30"], @"$29 - $30", @"Patching failed to parse the product");
    XCTAssertEqualObjects([IXProduct patchProductPriceRange:@"NA"], @"NA", @"Patching failed to parse the product");
    
    XCTAssertEqualObjects([IXProduct patchProductPriceRange:@"457575758858585"], @"$457575758858585", @"Patching failed to parse the product");
    
    XCTAssertEqualObjects([IXProduct patchProductPriceRange:@"$29 - $29"], @"$29 - $29", @"Patching failed to parse the product");
}

+ (NSData *)contentOfFile:(NSString *)name type:(NSString *)type {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:name ofType:type];
    NSData *json = [NSData dataWithContentsOfFile:path];
    return json;
}

@end
