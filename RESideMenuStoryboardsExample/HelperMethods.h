//
//  HelperMethods.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperMethods : NSObject

+ (void) saveUserDefaults:(NSString *)key andValue:(id)value;
+ (void) removeUserDefaults:(NSString *)key;
+ (id) getUserDefaults:(NSString *) userKey;

@end
