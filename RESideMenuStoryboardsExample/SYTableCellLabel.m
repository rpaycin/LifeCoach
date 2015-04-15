//
//  SYTableCellLabel.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 28/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "SYTableCellLabel.h"
#import "sporYonetim.h"

@implementation SYTableCellLabel

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

-(void) makeSettings{
    //self.textColor=[UIColor blackColor];//[UIColor orangeColor];
    // self.font =[UIFont boldSystemFontOfSize:13.0];//[UIFont boldSystemFontOfSize:16.0];
    self.textColor =DescriptionLabelColor;
    self.textAlignment= NSTextAlignmentCenter;
    self.font= [UIFont fontWithName:@"Arial-BoldMT" size:12];
    self.numberOfLines=2;
}

@end
