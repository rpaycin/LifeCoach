//
//  SYValue.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 18/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "SYValue.h"
#import "sporYonetim.h"

@implementation SYValue

-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if(self){
        [self makeSettings];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        [self makeSettings];
    }
    return self;
}

-(void)makeSettings{
    self.backgroundColor=[UIColor clearColor];
    self.textColor = [UIColor blackColor];
    self.numberOfLines=2;
}

@end
