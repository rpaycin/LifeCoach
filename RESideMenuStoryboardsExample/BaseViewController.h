//
//  BaseViewController.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"

@interface BaseViewController : UIViewController
{
    CustomIOS7AlertView *alert;
    UIView *demoView;
}
- (void) showPopup : (NSString *) message;
- (void)onForwardClick:(NSString *)forwardStoryboardID;
@end
