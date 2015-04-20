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

@interface EgzersizViewController ()
@property (nonatomic, retain) NSMutableArray *antEgzersizArray;
@end

@implementation EgzersizViewController
@synthesize antEgzersizArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self pageProperties];
    
    //antremanlardaki egzersizler alınıyor. Şimdi antremanId yanlış geliyor. apiden düzeltilcek
    [[APIManager sharedManager] getTrainingsForMotion:_selectAntreman.ID completion:^(id trainingForMotion, NSError *error){
        if(error!=nil)
            return;
        
        antEgzersizArray =trainingForMotion;
        if(antEgzersizArray.count>0)
            [_egzersizTable reloadData];
        
    }];
}

-(void)pageProperties{
    _viewButtons.backgroundColor=MainBlueColor;
    _egzersizTable.backgroundColor= FumeColor;
    _egzersizTable.userInteractionEnabled=NO;
    
    [_egzersizTable registerNib:[UINib nibWithNibName:@"ExerciseTableViewCell" bundle:nil]  forCellReuseIdentifier:@"cellforExercise"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cellforExercise";
    ExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[ExerciseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    AntremanEgzersiz *egzersiz = (AntremanEgzersiz *) [antEgzersizArray objectAtIndex:indexPath.row];

    cell.lblEgzersizAdi.text=egzersiz.Adi;
    cell.lblSetSayisi.text=[NSString stringWithFormat:@"%d Set",egzersiz.SetSayisi];
    cell.lblTekrarSayisi.text=[NSString stringWithFormat:@"%d Tekrar",egzersiz.TekrarSayisi];
    cell.lblCihazNo.text=[NSString stringWithFormat:@"%@ No'lu Cihaz",egzersiz.CihazNo];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //
{
    return antEgzersizArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  60;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (IBAction)btnStartClick:(id)sender {
    [self showMessageForTraining:1 message:@"Antremana başlamak istediğinize emin misiniz?"];
}

- (IBAction)btnFinishClick:(id)sender {
    [self showMessageForTraining:2 message:@"Antremana bitirmek istediğinize emin misiniz?"];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (alertView.tag==1 && buttonIndex == 0) {
        //başla butonu
        _btnStart.enabled=false;
        _btnFinish.enabled=true;
        _egzersizTable.userInteractionEnabled=YES;
    }
    else if (alertView.tag==2 && buttonIndex == 0) {
        //bitir butonu
        [[NSNotificationCenter defaultCenter]postNotificationName:@"FinishExercise" object:self];
        [[self navigationController] popViewControllerAnimated:YES];
    }
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
@end
