//
//  ViewController.h
//  SOSOMapAPIDEMO
//
//  Created by Apple on 13-6-17.
//  Copyright (c) 2013年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QAppKeyCheck.h"


@interface ViewController : UIViewController<QAppKeyCheckDelegate>
@property(nonatomic, retain) QAppKeyCheck* appKeyCheck;
@property (nonatomic,retain)IBOutlet UIButton * m_pMapBtn;
@property (nonatomic,retain)IBOutlet UIButton * m_pStreetViewBtn;

-(IBAction)showMapCtrl:(id)sender;
-(IBAction)showStreetCtrl:(id)sender;

@end
