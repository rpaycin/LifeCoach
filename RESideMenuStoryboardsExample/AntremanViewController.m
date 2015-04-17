//
//  AntremanViewController.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 19/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "AntremanViewController.h"
#import "TableViewCell.h"
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
    
    [self pageProperties];
    
    //antremanlar alınıyor
    BaseRequest *request=[BaseRequest new];
    request.memberID=[[HelperMethods getUserDefaults:MemberID] integerValue];
    request.companyID=[[HelperMethods getUserDefaults:CompanyID] integerValue];
    
    [[APIManager sharedManager] getTrainingsForMember:request completion:^(id trainingForMember, NSError *error){
        antArray =trainingForMember;
        [_antremanTableView reloadData];
        
    }];
    
}

-(void)pageProperties{
    self.view.backgroundColor=ViewBackgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    cell.lblAnremanBaslik.textAlignment=NSTextAlignmentLeft;
    cell.lblAntremanAciklama.textAlignment=NSTextAlignmentLeft;
    cell.lblAntremanGun.textAlignment=NSTextAlignmentLeft;
    cell.lblAntremanGunBaslik.textAlignment=NSTextAlignmentLeft;
    
    Antreman *ant = (Antreman *) [antArray objectAtIndex:indexPath.row];
    cell.lblAnremanBaslik.text=ant.AntremanAdi;
    cell.lblAntremanAciklama.text=ant.Aciklama;
    cell.lblAntremanGun.text=ant.AntremanGunSayisi;
    
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
    return  88;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
   return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
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
