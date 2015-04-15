//
//  BaseRequest.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequest : NSObject

@property (nonatomic) int memberID;
@property (nonatomic) int companyID;

-(NSDictionary*)prepareRequestDictionary;
@end
