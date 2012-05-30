//
//  SNChoiceListAPI.h
//  FulcrumAPITest
//
//  Created by Ben Rigas on 5/30/12.
//  Copyright (c) 2012 Spatial Networks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNChoiceList.h"

@interface SNChoiceListAPI : NSObject

+ (void) getChoiceListsSuccess:(void (^)(NSArray* choiceLists))success failure:(void (^)(NSError* error))failure;
+ (void) deleteChoiceList:(SNChoiceList*)choiceList success:(void (^)())success failure:(void (^)(NSError* error))failure;
+ (void) updateChoiceList:(SNChoiceList*)choiceList success:(void (^)())success failure:(void (^)(NSError* error))failure;
+ (void) createChoiceList:(SNChoiceList*)choiceList success:(void (^)())success failure:(void (^)(NSError* error, NSArray* validationErrors))failure;

@end
