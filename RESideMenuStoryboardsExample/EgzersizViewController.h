//
//  EgzersizViewController.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 01/04/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Antreman.h"

@interface EgzersizViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewButtons;

@property (nonatomic, strong) Antreman *selectAntreman;
@property (weak, nonatomic) IBOutlet UITableView *egzersizTable;

@end
