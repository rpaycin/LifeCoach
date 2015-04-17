//
//  TableViewCell.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 17/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "TableViewCell.h"
#import "sporYonetim.h"

@implementation TableViewCell

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
        
        NSArray *nibArray=[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];

        self=[nibArray objectAtIndex:0];
    }
    return self;
}

@end
