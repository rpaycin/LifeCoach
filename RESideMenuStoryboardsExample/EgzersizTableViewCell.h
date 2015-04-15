//
//  EgzersizTableViewCell.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 08/04/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTableCellValueLabel.h"

@interface EgzersizTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgEgzersiz;
@property (weak, nonatomic) IBOutlet SYTableCellValueLabel *lblEgzersizAdi;

@end
