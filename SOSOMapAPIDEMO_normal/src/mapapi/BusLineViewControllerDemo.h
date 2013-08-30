//
//  BusLineViewControllerDemo.h
//  SOSOMapAPIDemo
//
//  Created by wei lv on 12-8-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QMapKit.h"
#import "QSearch.h"

@interface BusLineViewControllerDemo : UIViewController<QMapViewDelegate, QSearchDelegate>
{
    IBOutlet QMapView* _mapView;
    QSearch* _search;
}

@property(nonatomic, retain) IBOutlet QMapView* mapView;
@property(nonatomic, retain) QSearch* search;

@end
