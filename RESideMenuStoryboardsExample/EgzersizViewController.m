 //
//  EgzersizViewController.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 01/04/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "EgzersizViewController.h"
#import "HelperMethods.h"
#import "sporYonetim.h"
#import "APIManager.h"
#import "Antreman.h"
#import "AntremanUye.h"
#import "AntremanEgzersiz.h"
#import "ExerciseTableViewCell.h"
#import "MemberTrainingRequest.h"
#import "ExerciseIDModel.h"

@interface EgzersizViewController ()
@property (nonatomic, retain) NSMutableArray *antEgzersizArray;
@end

@implementation EgzersizViewController
@synthesize antEgzersizArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self pageProperties];
    
    //antremanlardaki egzersizler alınıyor.
    [self getExercisesFromTraining];
   
}

-(void)getExercisesFromTraining{
    listBacak=[NSMutableArray new];
    listCardio=[NSMutableArray new];
    listGogus=[NSMutableArray new];
    listKarin=[NSMutableArray new];
    listKol=[NSMutableArray new];
    listOmuz=[NSMutableArray new];
    listSirt=[NSMutableArray new];
    listFull=[NSMutableArray new];
    
    [[APIManager sharedManager] getTrainingsForMotion:_selectAntreman.ID completion:^(id trainingForMotion, NSError *error){
        if(error!=nil)
            return;
        
        antEgzersizArray =trainingForMotion;
        
        if(antEgzersizArray.count>0){
            for (AntremanEgzersiz *exercise in antEgzersizArray) {
                if(exercise.KasNumarasi==1)
                    [listKol addObject:exercise];
                if(exercise.KasNumarasi==2)
                    [listGogus addObject:exercise];
                if(exercise.KasNumarasi==3)
                    [listBacak addObject:exercise];
                if(exercise.KasNumarasi==4)
                    [listOmuz addObject:exercise];
                if(exercise.KasNumarasi==5)
                    [listSirt addObject:exercise];
                if(exercise.KasNumarasi==6)
                    [listKarin addObject:exercise];
                if(exercise.KasNumarasi==7)
                    [listCardio addObject:exercise];
            }
            
            if(listKol.count>0){
                NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:listKol forKey:@"data"];
                [listFull addObject:firstItemsArrayDict];
            }
            if(listGogus.count>0){
                NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:listGogus forKey:@"data"];
                [listFull addObject:firstItemsArrayDict];
            }
            if(listBacak.count>0){
                NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:listBacak forKey:@"data"];
                [listFull addObject:firstItemsArrayDict];
            }
            if(listOmuz.count>0){
                NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:listOmuz forKey:@"data"];
                [listFull addObject:firstItemsArrayDict];
            }
            if(listSirt.count>0){
                NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:listSirt forKey:@"data"];
                [listFull addObject:firstItemsArrayDict];
            }
            if(listKarin.count>0){
                NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:listKarin forKey:@"data"];
                [listFull addObject:firstItemsArrayDict];
            }
            if(listCardio.count>0){
                NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:listCardio forKey:@"data"];
                [listFull addObject:firstItemsArrayDict];
            }
            
            [_egzersizTable reloadData];
        }
    }];
}
-(void)pageProperties{
    _viewButtons.backgroundColor=MainBlueColor;
    _egzersizTable.backgroundColor= FumeColor;
    
    [_egzersizTable registerNib:[UINib nibWithNibName:@"ExerciseTableViewCell" bundle:nil]  forCellReuseIdentifier:@"cellforExercise"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableView Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return listFull.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cellforExercise";
    ExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[ExerciseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    NSDictionary *dictionary = [listFull objectAtIndex:indexPath.section];
    NSArray *list = [dictionary objectForKey:@"data"];
    AntremanEgzersiz *egzersiz = [list objectAtIndex:indexPath.row];

    cell.lblEgzersizAdi.text=egzersiz.Adi;
    cell.lblSetSayisi.text=[NSString stringWithFormat:@"%d Set",egzersiz.SetSayisi];
    cell.lblTekrarSayisi.text=[NSString stringWithFormat:@"%d Tekrar",egzersiz.TekrarSayisi];
    cell.lblCihazNo.text=[NSString stringWithFormat:@"%@ No'lu Cihaz",egzersiz.CihazNo];
    cell.lblSelectedEgzersizID.text=[NSString stringWithFormat:@"%d",egzersiz.ID];
    
    [cell.imgEgzersiz setImage:[UIImage imageNamed:egzersiz.KasGrubuImgText]];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dictionary = [listFull objectAtIndex:section];
    NSArray *list = [dictionary objectForKey:@"data"];
    return list.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  60;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] ;
    
    //header text
    NSDictionary *dictionary = [listFull objectAtIndex:section];
    NSArray *list = [dictionary objectForKey:@"data"];
    AntremanEgzersiz *firstExercise = (AntremanEgzersiz*)[list objectAtIndex:0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width - 10, 18)] ;
    label.text = firstExercise.KasGrubu;
    label.textColor = ViewBackgroundColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}

#pragma UITableView Delegates Bitti
- (IBAction)btnStartClick:(id)sender {
    [self showMessageForTraining:1 message:@"Antremana başlamak istediğinize emin misiniz?"];
}

- (IBAction)btnFinishClick:(id)sender {
    [self showMessageForTraining:2 message:@"Antremana bitirmek istediğinize emin misiniz?"];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (alertView.tag==1 && buttonIndex == 0) {
        //başla butonu
        [self startExercise];
    }
    else if (alertView.tag==2 && buttonIndex == 0) {
        //bitir butonu
        [self finishExercise];
    }
}

-(void)startExercise{
    _btnStart.enabled=false;
    _btnFinish.enabled=true;
    
    //ilk başlama hareketi ekleniyor
    NSMutableArray *list=[NSMutableArray new];
    [list addObject:@"0"];
    MemberTrainingRequest *request=[self prepareStartFinishTrainingRequest:1 listDidExercises:list];

    [[APIManager sharedManager] addStartAndFinish:request completion:^(id result, NSError *error){

    }];

}

-(void)finishExercise{
    //seçilmiş egzersizler
    NSMutableArray *listSelectedExercise=[NSMutableArray new];
    for (int i=0; i<antEgzersizArray.count;i++) {
        NSIndexPath* indexpath = [NSIndexPath indexPathForRow:i inSection:0];
        ExerciseTableViewCell* cell = (ExerciseTableViewCell*)[_egzersizTable cellForRowAtIndexPath:indexpath];
        
        if(cell.chkYapildimi.on){
            ExerciseIDModel *model=[ExerciseIDModel new];
            model.ExerciseID=cell.lblSelectedEgzersizID.text;
            [listSelectedExercise addObject:model];
        }
        
    }
    //antremanları yenile ve antremanlara dön
    MemberTrainingRequest *request=[self prepareStartFinishTrainingRequest:0 listDidExercises:listSelectedExercise];
    
    [[APIManager sharedManager] addStartAndFinish:request completion:^(id result, NSError *error){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"FinishExercise" object:self];
        [[self navigationController] popViewControllerAnimated:YES];
    }];

}

-(void)showMessageForTraining:(int)alertTag message:(NSString*)message{
    UIAlertView *alertTraining = [[UIAlertView alloc] initWithTitle:@"Life Coach"
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:@"Evet"
                                                  otherButtonTitles:@"Hayır",nil];
    alertTraining.tag=alertTag;
    [alertTraining show];
}

-(MemberTrainingRequest*)prepareStartFinishTrainingRequest:(int)isStart listDidExercises:(NSMutableArray*)listDidExercises{
    //request oluşturuluyor
    MemberTrainingRequest *request=[MemberTrainingRequest new];
    request.IsStart=isStart;
    request.memberID=[[HelperMethods getUserDefaults:MemberID] integerValue];
    request.companyID=[[HelperMethods getUserDefaults:CompanyID] integerValue];
    request.TrainingID=[_selectAntreman.ID integerValue];
    
    if(listDidExercises!=nil)
        request.ListDidExercises=listDidExercises;
    
    return request;
}
@end
