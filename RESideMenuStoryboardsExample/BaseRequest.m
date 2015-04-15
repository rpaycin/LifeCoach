//
//  BaseRequest.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

-(NSDictionary*)prepareRequestDictionary{
    
    NSDictionary *dictionary = @{@"MemberID": [NSString stringWithFormat:@"%d",self.memberID,nil],
                                 @"CompanyID":[NSString stringWithFormat:@"%d",self.companyID,nil]};
    return dictionary;
    
}
@end
