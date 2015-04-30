//
//  GrafikViewController.m
//  RESideMenuStoryboardsExample
//
//  Created by Obase Bilgisayar on 29/04/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "GrafikViewController.h"

@interface GrafikViewController ()

@end

@implementation GrafikViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _slices=[NSMutableArray new];
    
    [_slices addObject:[NSNumber numberWithInt:90]];
    [_slices addObject:[NSNumber numberWithInt:10]];
    
    [_pieChart setDataSource:self];
    [_pieChart setStartPieAngle:M_PI_2];
    [_pieChart setAnimationSpeed:1.0];
    [_pieChart setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    //[_pieChart setLabelRadius:160];
    [_pieChart setShowPercentage:YES];
    [_pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    //[_pieChart setPieCenter:CGPointMake(240, 240)];
    //[_pieChart setUserInteractionEnabled:NO];
    [_pieChart setLabelShadowColor:[UIColor blackColor]];
    
    [_percentageLabel.layer setCornerRadius:180];
     [_pieChart reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return _slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[_slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    if(index==0)
        return [UIColor greenColor];
    else
        return [UIColor redColor];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
    NSString *str = [NSString stringWithFormat:@"$%@",[_slices objectAtIndex:index]];
}
#pragma mark - XYPieChart Delegate Bitti

@end
