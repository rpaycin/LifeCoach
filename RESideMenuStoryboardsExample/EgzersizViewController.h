//
//  EgzersizViewController.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 01/04/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Antreman.h"
#import "BaseViewController.h"

@interface EgzersizViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *listBiceps;
    NSMutableArray *listGogus;
    NSMutableArray *listOmuz;
    NSMutableArray *listSirt;
    NSMutableArray *listKarin;
    NSMutableArray *listCardio;
    NSMutableArray *listKanat;
    NSMutableArray *listBaldir;
    NSMutableArray *listOnKol;
    NSMutableArray *listOnBacak;
    NSMutableArray *listTriceps;
    NSMutableArray *listArkaBacak;
    NSMutableArray *listTrapezius;
    NSMutableArray *listFull;
}
@property (weak, nonatomic) IBOutlet UIView *viewButtons;

@property (nonatomic, strong) Antreman *selectAntreman;
@property (weak, nonatomic) IBOutlet UITableView *egzersizTable;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (weak, nonatomic) IBOutlet UIButton *btnFinish;
- (IBAction)btnStartClick:(id)sender;
- (IBAction)btnFinishClick:(id)sender;

@end
