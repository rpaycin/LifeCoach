//
//  ExerciseTableViewCell.m
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 16/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "ExerciseTableViewCell.h"
#import "sporYonetim.h"

@implementation ExerciseTableViewCell

- (void)awakeFromNib {
    self.backgroundColor= FumeColor;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
