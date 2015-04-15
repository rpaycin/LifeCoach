 //
//  EgzersizViewController.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 01/04/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "EgzersizViewController.h"
#import "TableViewCell.h"
#import "HelperMethods.h"
#import "sporYonetim.h"
#import "APIManager.h"
#import "Antreman.h"
#import "AntremanUye.h"
#import "AntremanEgzersiz.h"
#import "EgzersizTableViewCell.h"

@interface EgzersizViewController ()
@property (nonatomic, retain) NSMutableArray *antEgzersizArray;
@end

@implementation EgzersizViewController
@synthesize antEgzersizArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[APIManager sharedManager] getTrainingsForMotion:_selectAntreman.ID completion:^(id trainingForMotion, NSError *error){
        if(error!=nil)
            return;
        
        antEgzersizArray =trainingForMotion;
        if(antEgzersizArray.count>0)
            [_egzersizTable reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"EgzersizTableViewCell";
    EgzersizTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[EgzersizTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    /*cell.lblAnremanBaslik.textAlignment=NSTextAlignmentLeft;
    cell.lblAntremanAciklama.textAlignment=NSTextAlignmentLeft;
    cell.lblAntremanGun.textAlignment=NSTextAlignmentLeft;
    cell.lblAntremanGunBaslik.textAlignment=NSTextAlignmentLeft;*/
    //cell.lblEgzersizAdi.text=@"Edip";
    
    AntremanEgzersiz *ant = (AntremanEgzersiz *) [antEgzersizArray objectAtIndex:indexPath.row];
    
    
    UIImage *img;
    
    img= [UIImage imageNamed:@"fit"];
    
    
    [cell.imgEgzersiz setImage:img];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //
{
    return 1;//antEgzersizArray.count;
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

@end
