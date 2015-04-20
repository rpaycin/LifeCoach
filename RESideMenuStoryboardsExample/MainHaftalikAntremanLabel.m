//
//  MainHaftalikAntremanLabel.m
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 19/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "MainHaftalikAntremanLabel.h"

@implementation MainHaftalikAntremanLabel
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if(self){
        [self makeSettings];
    }
    return self;
}

-(void)makeSettings{
    self.backgroundColor=[UIColor colorWithRed:30.0f/255.0f green:31.0f/255.0f blue:25.0f/255.0f alpha:1];
    self.textColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
}

@end
