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


@implementation MainViewController


- (void)viewDidLoad {
    [self isLogin];
    
    [super viewDidLoad];

    //sayfa ayarları
    [self setPageProperties];
    
    //api test
    BaseRequest *request=[BaseRequest new];
    request.memberID=[memberID integerValue];
    request.companyID=[companyID integerValue];

    
    [[APIManager sharedManager] getTrainingsForMember:request completion:^(id trainingForMember, NSError *error){
        NSString *str;
    }];

}

-(void)setPageProperties{
    _lblKullanici.text=memberName;
    
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"dd-MM-yyyy"]; // Date formater
    NSString *date = [dateformate stringFromDate:[NSDate date]];
    
    _lblTarih.textAlignment=NSTextAlignmentRight;
    _lblTarih.text=date;
    
    //self.view.backgroundColor=Backround;
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
@end
