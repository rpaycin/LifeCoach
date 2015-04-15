//
//  EgzersizTableViewCell.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 08/04/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "EgzersizTableViewCell.h"

@implementation EgzersizTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSArray *nibArray=[[NSBundle mainBundle] loadNibNamed:@"EgzersizTableViewCell" owner:self options:nil];
        self=[nibArray objectAtIndex:0];
        
        //self.vwOrderStatus.layer.cornerRadius=10;
        
        //[self setBackgroundColor:[UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1]];
        //[UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1]
    }
    return self;
}

@end
