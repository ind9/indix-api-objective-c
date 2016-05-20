# Indix API Objective-C Client
This is an API client library for the Indix API written in Objective-C. For detailed documentation, please visit the [Indix Developer Portal](https://developer.indix.com/).

## Installation
You can install this client using Cocoapods

```
pod 'indix-api'
```

## Usage
First initialize `IndixApiClient`, you can do this in your `AppDelegate`

```objective-c
[IndixApiClient setIndixAppId:@"YOUR_INDIX_APP_ID" appKey:@"YOUR_INDIX_APP_KEY"];
```

Visit [developer.indix.com](the Indix developer portal) to get your own App ID and Key.

## Search for Brands, Stores or Categories
### Brands
```objective-c
[IndixApiClient getBrands:@{ @"q":@"nike"} success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
```
### Stores
```objective-c
[IndixApiClient getStores:@{ @"q":@"Amazon.com"} success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
```
### Categories
*Note: This endpoint downloads all categories. This is not a search end point.*
```objective-c
[IndixApiClient getCategories:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
```

## Search suggestions
```objective-c
[IndixApiClient getSearchSuggestions:@{ @"q":@"red", @"countryCode":@"US" } success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
```

## Search for products
```objective-c
[IndixApiClient getProductSummary:@{ @"q":@"nike", @"countryCode":@"US" } success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];    
```

List of all methods, each of which will return different types of product information.

```objective-c
[IndixApiClient getProductSummary];
[IndixApiClient getProductOffersStandard];
[IndixApiClient getProductOffersPremium];
[IndixApiClient getProductCatalogStandard];
[IndixApiClient getProductCatalogPremium];
[IndixApiClient getProductUniversal];
```

## Lookup a specific product
```objective-c
[IndixApiClient getProductLookupSummary:@{ @"mpid":@"nike", @"8e1d8cd338ada38624d2f9322b259402":@"US" } success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }]; 
```
List of all methods, each of which will return different types of product information.
```objective-c
[IndixApiClient getProductLookupSummary];
[IndixApiClient getProductLookupOffersStandard];
[IndixApiClient getProductLookupOffersPremium];
[IndixApiClient getProductLookupCatalogStandard];
[IndixApiClient getProductLookupCatalogPremium];
[IndixApiClient getProductLookupUniversal];
```

## Parsing the response
This library comes a utility class that converts response from server to concrete class that can be consumed. You can use `IXRApiV2Parser` to do parsing. 
 
```objective-c
[IndixApiClient getProductSummary:@{ @"q":@"nike", @"countryCode":@"US" } success:^(id responseObject) {
		NSArray *parsedArray = [IXRApiV2Parser parseProductArrayFromSearchDictionary:responseObject];
        NSLog(@"%@", parsedArray);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];    
```
