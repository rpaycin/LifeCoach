//
//  TrainingTableViewCell.h
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 20/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblAnremanBaslik;
@property (weak, nonatomic) IBOutlet UILabel *lblAntremanAciklama;
@property (weak, nonatomic) IBOutlet UILabel *lblAntremanGun;
@property (weak, nonatomic) IBOutlet UILabel *lblSonYapilmaTarihi;
@property (weak, nonatomic) IBOutlet UILabel *lblSonYapilmaTarihiBaslik;

@property (weak, nonatomic) IBOutlet UIImageView *img;
@end
