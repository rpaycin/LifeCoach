//
//  ExerciseTableViewCell.h
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 16/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgEgzersiz;
@property (weak, nonatomic) IBOutlet UILabel *lblSetSayisi;
@property (weak, nonatomic) IBOutlet UILabel *lblEgzersizAdi;
@property (weak, nonatomic) IBOutlet UILabel *lblTekrarSayisi;

@end
