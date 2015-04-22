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
#import "CMPopTipView.h"
#import "CMPopView.h"

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
        _btnGun1.backgroundColor=trainingColor;
        _btnGun1Text.backgroundColor=trainingColor;
    }
    else if(i==2){
        _btnGun2.backgroundColor=trainingColor;
        _btnGun2Text.backgroundColor=trainingColor;
    }
    else if(i==3){
        _btnGun3.backgroundColor=trainingColor;
        _btnGun3Text.backgroundColor=trainingColor;
    }
    else if(i==4){
        _btnGun4.backgroundColor=trainingColor;
        _btnGun4Text.backgroundColor=trainingColor;
    }
    else if(i==5){
        _btnGun5.backgroundColor=trainingColor;
        _btnGun5Text.backgroundColor=trainingColor;
    }
    else if(i==6){
        _btnGun6.backgroundColor=trainingColor;
        _btnGun6Text.backgroundColor=trainingColor;
    }
    else if(i==7){
        _btnGun7.backgroundColor=trainingColor;
        _btnGun7Text.backgroundColor=trainingColor;
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
            [_btnGun1 setTitle:dateText forState:UIControlStateNormal];
        else if(i==1)
            [_btnGun2 setTitle:dateText forState:UIControlStateNormal];
        else if(i==2)
            [_btnGun3 setTitle:dateText forState:UIControlStateNormal];
        else if(i==3)
            [_btnGun4 setTitle:dateText forState:UIControlStateNormal];
        else if(i==4)
            [_btnGun5 setTitle:dateText forState:UIControlStateNormal];
        else if(i==5)
            [_btnGun6 setTitle:dateText forState:UIControlStateNormal];
        else if(i==6)
            [_btnGun7 setTitle:dateText forState:UIControlStateNormal];
    }
}

 

- (IBAction)btnWeeklyTrainingClick:(id)sender {
    CMPopView *contentView=[[CMPopView alloc]initWithFrame:CGRectMake(0, 0, 300, 120)];
    contentView.lblBaslik.text=@"test";
    CMPopTipView *popTipView=[[CMPopTipView alloc] initWithCustomView:contentView];
    
    
    popTipView.delegate = self;
    [popTipView setBackgroundColor: MainBlueColor];
    [popTipView setBorderColor:MainBlueColor];
    
    popTipView.hasGradientBackground = NO;
    popTipView.cornerRadius = 0;
    
    popTipView.hasShadow = NO;
    
    
    popTipView.animation = 1;
    popTipView.has3DStyle = false;
    
    popTipView.dismissTapAnywhere = YES;
    [popTipView autoDismissAnimated:YES atTimeInterval:10.0];
    
    [popTipView presentPointingAtView:sender inView:self.view animated:YES];
}

- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView
{
}
#pragma Haftalık Antremanlar Bitti

@end
