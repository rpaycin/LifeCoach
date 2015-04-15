//
//  HelperMethods.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "HelperMethods.h"
#import "sporYonetim.h"

@implementation HelperMethods

+ (NSString*) getUserDefaults:(NSString *) userKey{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str= [defaults objectForKey:userKey] ;
    return str;
}

+ (void) saveUserDefaults:(NSString *)key andValue:(id)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSKeyedArchiver archivedDataWithRootObject:value] forKey:key];
    [defaults synchronize];
     */
}

+ (void) removeUserDefaults:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

@end
