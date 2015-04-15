//
//  TableViewCell.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 17/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYDescriptionValue.h"
#import "SYValue.h"

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet SYDescriptionValue *lblAnremanBaslik;
@property (weak, nonatomic) IBOutlet SYValue *lblAntremanAciklama;
@property (weak, nonatomic) IBOutlet SYValue *lblAntremanGun;
@property (weak, nonatomic) IBOutlet SYDescriptionValue *lblAntremanGunBaslik;

@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
