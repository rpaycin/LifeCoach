//
//  MemberTrainingRequest.h
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 21/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "JSONModel.h"
#import "ExerciseIDModel.h"

@protocol ExerciseIDModel @end
@interface MemberTrainingRequest : JSONModel

@property (nonatomic) int memberID;
@property (nonatomic) int companyID;
@property (nonatomic) int TrainingID;
@property (nonatomic,strong) NSArray<ExerciseIDModel> *ListDidExercises;
@property (nonatomic) int IsStart;

@end
