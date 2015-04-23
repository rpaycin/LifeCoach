//
//  GetTrainingForSelectedDateResponse.h
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 23/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "JSONModel.h"

@interface GetTrainingForSelectedDateResponse : JSONModel
@property int AntremanID;
@property (nonatomic, copy) NSString<Optional> *AntremanAdi;
@property (nonatomic, copy) NSString<Optional> *AntremanSuresi;
@end
