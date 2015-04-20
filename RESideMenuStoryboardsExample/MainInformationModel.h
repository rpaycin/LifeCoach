//
//  MainInformationModel.h
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 20/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "JSONModel.h"

@interface MainInformationModel : JSONModel

@property (nonatomic, copy) NSString<Optional> *LastTrainingName;

@property (nonatomic, copy) NSArray *TrainingWeekList;

@end
