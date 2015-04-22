//
//  MainHaftalikAntremanButton.m
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 22/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "MainHaftalikAntremanButton.h"

@implementation MainHaftalikAntremanButton

-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if(self){
        [self makeSettings];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)makeSettings{
    self.titleLabel.font=[UIFont systemFontOfSize:11];
    
    self.backgroundColor=[UIColor colorWithRed:30.0f/255.0f green:31.0f/255.0f blue:25.0f/255.0f alpha:1];
    
    UIColor *softWhite=[UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
    [self setTitleColor:softWhite forState:UIControlStateNormal];
    [self setTitleColor:softWhite forState:UIControlStateHighlighted];

}
@end
