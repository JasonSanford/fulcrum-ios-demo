//
//  SNFormElement.h
//  FulcrumAPITest
//
//  Created by Ben Rigas on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNFormElement : NSObject

@property BOOL disabled;
@property BOOL hidden;
@property (nonatomic, retain) NSString* key;
@property (nonatomic, retain) NSString* type;
@property (nonatomic, retain) NSString* dataName;
@property BOOL required;
@property (nonatomic, retain) NSString* label;


- (id)initWithAttributes:(NSMutableDictionary*)attributes;
- (NSMutableDictionary*) attributes;

@end
