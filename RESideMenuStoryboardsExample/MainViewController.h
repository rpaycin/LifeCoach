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
#import "MainHaftalikAntremanLabel.h"

@interface MainViewController : BaseViewController{
    NSString *memberID;
    NSString *memberName;
    NSString *companyID;
}

@property (weak, nonatomic) IBOutlet SYValue *lblKullanici;
@property (weak, nonatomic) IBOutlet SYValue *lblTarih;
@property (weak, nonatomic) IBOutlet SYValue *lblAntremanAciklama;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun1;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun1Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun2;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun2Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun3;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun3Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun4;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun4Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun5;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun5Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun6;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun6Text;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun7;
@property (weak, nonatomic) IBOutlet MainHaftalikAntremanLabel *lblGun7Text;
@property (weak, nonatomic) IBOutlet SYValue *lblSonYapilanAntreman;


- (IBAction)btnTestClick:(id)sender;
@end
