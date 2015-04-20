//
//  BaseViewController.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "BaseViewController.h"
#import "HelperMethods.h"
#import "sporYonetim.h"
#import "APIManager.h"

@implementation BaseViewController

- (void)viewDidLoad {
    self.view.backgroundColor=ViewBackgroundColor;
}
- (void) showPopup : (NSString *) message {
    alert = [[CustomIOS7AlertView alloc] init];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(alertViewTocuhOutside:)];
    [alert addGestureRecognizer:tap];
    
    [alert setContainerView:[self createDemoView:message]];
    
    [alert setUseMotionEffects:true];
    
    [alert show];
}

- (UIView *)createDemoView:(NSString*)text
{
    demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 110)];
    
    UILabel *lblHeader=[[UILabel alloc]initWithFrame:CGRectMake(100, 18, 150, 27)];
    lblHeader.text=@"Spor Yönetimi";
    lblHeader.tag=34;
    lblHeader.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    
    
    UILabel *lbl= [[UILabel alloc] initWithFrame:CGRectMake(9, 48, 284, 21)];
    lbl.tag=35;
    lbl.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:14.0];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.text=text;
    lbl.minimumScaleFactor=.2f;
    lbl.numberOfLines=4;
    lbl.adjustsFontSizeToFitWidth = YES;
    //[lbl sizeToFit];
   
    [demoView addSubview:lblHeader];
    [demoView addSubview:lbl];
    return demoView;
}

- (void)orientationChanged:(NSNotification *)notification{
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    
    switch (orientation)
    {
        case UIInterfaceOrientationLandscapeLeft:{
            if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1 && demoView!=nil){
                UILabel *lblHeader=(UILabel *)[demoView viewWithTag:34];
                UILabel *lbl=(UILabel *)[demoView viewWithTag:35];
                
                lblHeader.frame=CGRectMake(222, 118, 59, 27);
                lbl.frame=CGRectMake(106, 148, 284, 21);
                
                lblHeader.transform=CGAffineTransformMakeRotation(0);
                lbl.transform=CGAffineTransformMakeRotation(0);
            }
        }
            break;
        case UIInterfaceOrientationLandscapeRight:
        {
            if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1 && demoView!=nil){
                UILabel *lblHeader=(UILabel *)[demoView viewWithTag:34];
                UILabel *lbl=(UILabel *)[demoView viewWithTag:35];
                
                lblHeader.frame=CGRectMake(222, 148, 59, 27);
                lbl.frame=CGRectMake(106, 118, 284, 21);
                
                lblHeader.transform=CGAffineTransformMakeRotation(M_PI);
                lbl.transform=CGAffineTransformMakeRotation(M_PI);
            }
        }
            break;
        case UIInterfaceOrientationUnknown:break;
    }
}


- (void)alertViewTocuhOutside:(UITapGestureRecognizer *)sender {
    [alert close];
}

- (void)onForwardClick:(NSString *)forwardStoryboardID {
    id nextView = [self.storyboard instantiateViewControllerWithIdentifier:forwardStoryboardID];
    [UIView animateWithDuration:1
                     animations:^{
                         [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
                     }];
    [self.navigationController pushViewController:(UIViewController*)nextView animated:NO];
}

-(UIBarButtonItem*) prepareBackButton{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Geri";
    return barButton;
}
@end
