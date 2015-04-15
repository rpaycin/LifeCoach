//
//  SYTableCellValueLabel.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 28/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "SYTableCellValueLabel.h"
#import "sporYonetim.h"

@implementation SYTableCellValueLabel

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
    /*self.textColor =[UIColor darkGrayColor];//[UIColor colorWithRed:0.122 green:0.11 blue:0.184 alpha:1];
     self.font =[UIFont boldSystemFontOfSize:10.0];//[UIFont boldSystemFontOfSize:16.0];
     self.numberOfLines=2;*/
    
    self.backgroundColor=[UIColor clearColor];
    self.textColor =ValueLabelColor;
    self.textAlignment= NSTextAlignmentCenter;
    self.font= [UIFont fontWithName:@"Arial" size:10];
    self.numberOfLines=2;
}

@end
