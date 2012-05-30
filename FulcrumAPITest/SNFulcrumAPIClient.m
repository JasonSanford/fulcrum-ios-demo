//
//  SNFulcrumAPIClient.m
//  FulcrumAPITest
//
//  Created by Ben Rigas on 5/25/12.
//  Copyright (c) 2012 Spatial Networks. All rights reserved.
//

#import "SNFulcrumAPIClient.h"

#import "AFJSONRequestOperation.h"

//#define FulcrumAPIBaseURLString @"https://web.fulcrumapp.com/api/v2/"
//#define FulcrumAPIToken @"194f63c86e7b763840bf2116d6ef484d410ca5259e53e252339324acb4cb432d"
#define FulcrumAPIBaseURLString @"http://staging.fulcrumapp.com/api/v2/"
#define FulcrumAPIToken @"9abdc810dcb871aa5d31567933bff70cd9cc43c0dc9e25f1f4717693df7bd7b0"

@implementation SNFulcrumAPIClient

+ (id)sharedInstance
{
    static SNFulcrumAPIClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[SNFulcrumAPIClient alloc] initWithBaseURL:
                            [NSURL URLWithString:FulcrumAPIBaseURLString]];
        __sharedInstance.parameterEncoding = AFJSONParameterEncoding;
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self setDefaultHeader:@"X-ApiToken" value:FulcrumAPIToken];
        
        
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

@end
