//
//  MainViewController.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SYValue.h"

@interface MainViewController : BaseViewController{
    NSString *memberID;
    NSString *memberName;
    NSString *companyID;
}

@property (weak, nonatomic) IBOutlet SYValue *lblKullanici;
@property (weak, nonatomic) IBOutlet SYValue *lblTarih;
@property (weak, nonatomic) IBOutlet SYValue *lblAntremanAciklama;
@property (weak, nonatomic) IBOutlet UILabel *lblGun1;
@property (weak, nonatomic) IBOutlet UILabel *lblGun2;
@property (weak, nonatomic) IBOutlet UILabel *lblGun3;
@property (weak, nonatomic) IBOutlet UILabel *lblGun4;
@property (weak, nonatomic) IBOutlet UILabel *lblGun5;
@property (weak, nonatomic) IBOutlet UILabel *lblGun6;
@property (weak, nonatomic) IBOutlet UILabel *lblGun7;


- (IBAction)btnTestClick:(id)sender;
@end
