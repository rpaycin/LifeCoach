//
//  GetTrainingForSelectedDateRequest.h
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 23/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface GetTrainingForSelectedDateRequest : JSONModel
@property (nonatomic) int memberID;
@property (nonatomic) int companyID;
@property (nonatomic) int selectedDay;
@end
