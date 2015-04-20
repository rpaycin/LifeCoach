//
//  MainViewController.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "MainViewController.h"
#import "HelperMethods.h"
#import "BaseRequest.h"
#import "APIManager.h"
#import "sporYonetim.h"
#import "TestViewController.h"
#import "MainInformationModel.h"


@implementation MainViewController


- (void)viewDidLoad {
    //kullanıcı login mi?
    [self isLogin];
    
    //haftanın günleri hazırlanıyor
    [self prepareDateForWeekTraining];
    
    [super viewDidLoad];

    //sayfa ayarları
    [self setPageProperties];

    //son yapılan antreman ve haftanın hangi günleri antreman yapılmış
    [self getMainInformationFromApi];
}

-(void)getMainInformationFromApi{
    BaseRequest *request=[BaseRequest new];
    request.memberID=[[HelperMethods getUserDefaults:MemberID] integerValue];
    request.companyID=[[HelperMethods getUserDefaults:CompanyID] integerValue];
    
    [[APIManager sharedManager] getMainInformation:request completion:^(id trainingForMember, NSError *error){
        if(error!=nil)
            return ;
        
        MainInformationModel *model=(MainInformationModel*)trainingForMember;
        //son yapılan antreman
        _lblSonYapilanAntreman.text=model.LastTrainingName;
        
        //haftanın hangi günleri antreman yapılmış
        for (int i=0 ;i<model.TrainingWeekList.count; i++) {
            int day=[[model.TrainingWeekList objectAtIndex:i] integerValue];
            [self changeWeekTraining:day];
        }
    }];
}
-(void)setPageProperties{
    //Kullanıcı
    _lblKullanici.text=memberName;
    
    
    //Tarih
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"dd.MM.yyyy"];
    NSString *date = [dateformate stringFromDate:[NSDate date]];
    
    _lblTarih.textAlignment=NSTextAlignmentRight;
    _lblTarih.text=date;
    
}

- (void) isLogin {
    memberID = [HelperMethods getUserDefaults:MemberID];
    companyID = [HelperMethods getUserDefaults:CompanyID];
    memberName = [HelperMethods getUserDefaults:MemberName];
    
    if(memberID!=nil && companyID!=nil && memberName!=nil)
        return;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id loginController = [storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
    [self presentViewController:loginController animated:NO completion:nil];
}

#pragma Haftalık Antremanlar
-(void)changeWeekTraining:(int)i{
    UIColor *trainingColor=MainBlueColor;
    if(i==1){
        _lblGun1.backgroundColor=trainingColor;
        _lblGun1Text.backgroundColor=trainingColor;
    }
    else if(i==2){
        _lblGun2.backgroundColor=trainingColor;
        _lblGun2Text.backgroundColor=trainingColor;
    }
    else if(i==3){
        _lblGun3.backgroundColor=trainingColor;
        _lblGun3Text.backgroundColor=trainingColor;
    }
    else if(i==4){
        _lblGun4.backgroundColor=trainingColor;
        _lblGun4Text.backgroundColor=trainingColor;
    }
    else if(i==5){
        _lblGun5.backgroundColor=trainingColor;
        _lblGun5Text.backgroundColor=trainingColor;
    }
    else if(i==6){
        _lblGun6.backgroundColor=trainingColor;
        _lblGun6Text.backgroundColor=trainingColor;
    }
    else if(i==7){
        _lblGun7.backgroundColor=trainingColor;
        _lblGun7Text.backgroundColor=trainingColor;
    }
}

-(void)prepareDateForWeekTraining{
    //bulunduğun haftanın hangi gün ve haftasında. Gün olarak 1 Pazar... 7 Cumartesi
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents =
    [gregorian components:(NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:today];
    NSInteger weekday = [weekdayComponents weekday];
    
    //eğer haftanın günü 2 - 7 aralığındaysa. Örneğin 6. 6 - 2 =4. Bulunduğun günden 4 gün geri ile başla
    //eğer haftanın günü 1 ise bulunduğun günden 6 eksilterek başla
    int backDay=(weekday>1)?(2-weekday):-6;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSDate *backFirstDay = [today dateByAddingTimeInterval:60*60*24*backDay];
    for (int i=0; i<7; i++) {
        NSDate *date=[backFirstDay dateByAddingTimeInterval:60*60*24*i];
        
        [df setDateFormat:@"dd"];
        NSString *day = [df stringFromDate:date];
        
        [df setDateFormat:@"MM"];
        NSString *month = [df stringFromDate:date];
        
        NSString *dateText=[NSString stringWithFormat:@"%@.%@",day,month];
        
        if(i==0)
            _lblGun1.text=dateText;
        else if(i==1)
            _lblGun2.text=dateText;
        else if(i==2)
            _lblGun3.text=dateText;
        else if(i==3)
            _lblGun4.text=dateText;
        else if(i==4)
            _lblGun5.text=dateText;
        else if(i==5)
            _lblGun6.text=dateText;
        else if(i==6)
            _lblGun7.text=dateText;
    }
}
#pragma Haftalık Antremanlar Bitti
@end
