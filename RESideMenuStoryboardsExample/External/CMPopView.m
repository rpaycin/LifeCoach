//
//  CMPopView.m
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 22/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "CMPopView.h"

@implementation CMPopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray *nibContents = [[NSBundle mainBundle]loadNibNamed:@"CMPopView" owner:self options:nil ];
        
        [self setUserInteractionEnabled:YES];
        
        [self addSubview:nibContents[0]];
    }
    return self;
}
@end
