//
//  GrafikViewController.h
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 29/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "BaseViewController.h"
#import "XYPieChart.h"

@interface GrafikViewController : BaseViewController<XYPieChartDelegate, XYPieChartDataSource>

@property (strong, nonatomic) IBOutlet XYPieChart *pieChart;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;

@property(nonatomic, strong) NSMutableArray *slices;

@end
