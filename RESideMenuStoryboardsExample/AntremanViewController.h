//
//  AntremanViewController.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 19/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AntremanViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *antremanTableView;
@end
