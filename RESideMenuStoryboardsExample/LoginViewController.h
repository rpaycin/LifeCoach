//
//  LoginViewController.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;

- (IBAction)btnLoginControlClick:(id)sender;
@end
