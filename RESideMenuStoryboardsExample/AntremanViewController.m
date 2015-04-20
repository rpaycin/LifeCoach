//
//  AntremanViewController.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 19/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "AntremanViewController.h"
#import "TrainingTableViewCell.h"
#import "HelperMethods.h"
#import "sporYonetim.h"
#import "APIManager.h"
#import "Antreman.h"
#import "EgzersizViewController.h"


@interface AntremanViewController ()
@property (nonatomic, retain) NSMutableArray *antArray;
@end

@implementation AntremanViewController
@synthesize antArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //sayfa ayarları
    [self pageProperties];
    
    //antremanlar alınıyor
    [self getTrainings];
}

-(void)getTrainings{
    BaseRequest *request=[BaseRequest new];
    request.memberID=[[HelperMethods getUserDefaults:MemberID] integerValue];
    request.companyID=[[HelperMethods getUserDefaults:CompanyID] integerValue];
    
    [[APIManager sharedManager] getTrainingsForMember:request completion:^(id trainingForMember, NSError *error){
        antArray =trainingForMember;
        [_antremanTableView reloadData];
        
    }];
}
-(void)pageProperties{
    [_antremanTableView registerNib:[UINib nibWithNibName:@"TrainingTableViewCell" bundle:nil]  forCellReuseIdentifier:@"cellforTraining"];

    //egzersizler bittiği zaman
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(finishExercise:)
                                                 name:@"FinishExercise"
                                               object:nil];
}

- (void) finishExercise:(NSNotification *) notification
{
    [self getTrainings];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cellforTraining";
    TrainingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[TrainingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    
    Antreman *training = (Antreman *) [antArray objectAtIndex:indexPath.row];
    cell.lblAnremanBaslik.text=training.AntremanAdi;
    cell.lblAntremanAciklama.text=training.Aciklama;
    cell.lblAntremanGun.text=training.ToplamYapilanAntremanSayisi;
    
    if ([training.SonYapilmaTarihi rangeOfString:@"0001"].location == NSNotFound)
        cell.lblSonYapilmaTarihi.text=training.SonYapilmaTarihi;
    
    [cell.img setImage:[UIImage imageNamed:@"fit"]];
    return cell;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //
{
    return antArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  97;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Antreman *ant = (Antreman *) [antArray objectAtIndex:indexPath.row];
    
    EgzersizViewController *egzersiz  = [self.storyboard instantiateViewControllerWithIdentifier:@"egzersizViewController"];
    egzersiz.selectAntreman=ant;
    [UIView animateWithDuration:1
                     animations:^{
                         [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
                     }];
    [self.navigationController pushViewController:(UIViewController*)egzersiz animated:NO];
}
@end
