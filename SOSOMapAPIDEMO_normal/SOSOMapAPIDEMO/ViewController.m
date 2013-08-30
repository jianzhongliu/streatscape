//
//  ViewController.m
//  SOSOMapAPIDEMO
//
//  Created by Apple on 13-6-17.
//  Copyright (c) 2013年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"
#import "StreetViewController.h"
#import <mach/mach_time.h>

@interface ViewController()
{
    NSMutableDictionary* _viewControllerList;
    UIViewController * curController;
}
@property(nonatomic,retain) NSDictionary* viewControllerList;
@end

@implementation ViewController

@synthesize viewControllerList = _viewControllerList;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithCapacity:14];
    // Do any additional setup after loading the view, typically from a nib.
    QAppKeyCheck* check = [[QAppKeyCheck alloc] init];
    [check start:@"99bfda1eebb2b9cdb9bc0993bf345743" withDelegate:self];
    
    self.appKeyCheck = check;
    [check release];
    
    
    MapViewController * mapViewViewControllerDemo = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil] ;
    [dic setObject:mapViewViewControllerDemo forKey:@"MapViewCtrl"];
    
    StreetViewController * streetViewController = [[StreetViewController alloc]initWithNibName:@"StreetViewController" bundle:nil];
    [dic setObject:streetViewController forKey:@"StreetViewCtrl"];

    
    [mapViewViewControllerDemo release];
    
    [self.navigationController setModalInPopover:NO];
    self.viewControllerList = dic;
    [dic release];
	
}
- (void)viewDidUnload
{
    self.m_pMapBtn = nil;
    self.m_pStreetViewBtn = nil;
}
- (void)showAlertView:(NSString*)title widthMessage:(NSString*)message
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView sizeToFit];
	[alertView show];
	[alertView release];
    mach_timebase_info_data_t info;
    mach_timebase_info(&info);
    uint64_t start = mach_absolute_time();
    UIImage * image = [UIImage imageNamed:@"pin_yellow.png"];
//    image.
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width/2,image.size.height/2));
    [image drawInRect:CGRectMake(0,0,image.size.width/2,image.size.height/2)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"%lrli",mach_absolute_time()-start);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(IBAction)showMapCtrl:(id)sender{
    MapViewController * demo = [_viewControllerList objectForKey:@"MapViewCtrl"];
    [self.navigationController pushViewController:demo animated:YES];
}
-(IBAction)showStreetCtrl:(id)sender{
    StreetViewController * demo = [_viewControllerList objectForKey:@"StreetViewCtrl"];
    [self.navigationController pushViewController:demo animated:YES];
}
- (void)notifyAppKeyCheckResult:(QErrorCode)errCode
{
    NSLog(@"errcode = %d",errCode);
    printf("ILOve you!");
    
    if (errCode == QErrorNone) {
        NSLog(@"恭喜您，APPKey验证通过！");
    }
    else if(errCode == QNetError)
    {
        [self showAlertView:@"AppKey验证结果" widthMessage:@"网络好像不太给力耶！请检查下网络是否畅通?"];
    }
    else if(errCode == QAppKeyCheckFail)
    {
        [self showAlertView:@"AppKey验证结果" widthMessage:@"您的APPKEY好像是有问题喔，请检查下APPKEY是否正确？"];
    }
}

@end
