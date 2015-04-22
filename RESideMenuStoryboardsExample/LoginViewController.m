//
//  LoginViewController.m
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "LoginViewController.h"
#import "APIManager.h"
#import "BaseRequest.h"
#import "sporYonetim.h"
#import "MainViewController.h"
#import "BaseViewController.h"

NSArray *dene;
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self pageProperties];
    
    [self observeKeyboard];
    _txtEmail.text=@"edipaksahin@gmail.com";
    _txtPassword.text=@"1234";
}

-(void)pageProperties{
    self.view.backgroundColor=ViewBackgroundColor;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoginControlClick:(id)sender {
    
    if (_txtEmail.text.length ==0) {
        [self showPopup:@"Kullanıcı Adı Boş Bırakılamaz!"];

    }
    else if(_txtPassword.text.length==0){
        [self showPopup:@"Şifre Boş Bırakılamaz!"];
    }
    else{
        NSString *email=_txtEmail.text;
        NSString *password=_txtPassword.text;
   
        [[APIManager sharedManager] loginControl:email password:password completion:^(id loginInfo, NSError *error){
            if(error==nil){
                [APP_DELEGATE performSelector:@selector(showMainForm) withObject:nil];
            }
            else{
                [self showPopup:@"Kullanıcı bulunamadı!"];
            }
    }];
  }
}

-(void)observeKeyboard{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
}

- (void)keyboardDidShow: (NSNotification *) notif{
    [self setScrollViewForKeyboard:true];
}

- (void)keyboardDidHide: (NSNotification *) notif{
    [self setScrollViewForKeyboard:false];
}

-(void) setScrollViewForKeyboard:(bool)isUp{
    int value=0;
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ){
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        
        if(screenHeight>=480 && screenHeight<=560)
            value=isUp?-100:100;
        else
            value= isUp?-45:45;
    }
    
    _loginScrollView.frame = CGRectMake(_loginScrollView.frame.origin.x,
                                        _loginScrollView.frame.origin.y+value,
                                        _loginScrollView.frame.size.width,
                                        _loginScrollView.frame.size.height);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField.tag==11){
        UIResponder* nextResponder = [textField.superview viewWithTag:12];
        [nextResponder becomeFirstResponder];
        return NO;
    }
    else{
        [textField resignFirstResponder];
        [self btnLoginControlClick:nil];
        return true;
    }
}
@end
