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
#import "MainHaftalikAntremanButton.h"

@interface MainViewController : BaseViewController{
    NSString *memberID;
    NSString *memberName;
    NSString *companyID;
}

@property (weak, nonatomic) IBOutlet SYValue *lblKullanici;
@property (weak, nonatomic) IBOutlet SYValue *lblTarih;
@property (weak, nonatomic) IBOutlet SYValue *lblAntremanAciklama;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun1;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun1Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun2;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun2Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun3;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun3Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun4;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun4Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun5;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun5Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun6;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun6Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun7;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanButton *btnGun7Text;
@property (weak, nonatomic) IBOutlet SYValue *lblSonYapilanAntreman;

- (IBAction)btnWeeklyTrainingClick:(id)sender;


- (IBAction)btnTestClick:(id)sender;
@end
