//
//  ViewController.h
//  TaskState
//
//  Created by MAC OS  on 3/16/16.
//  Copyright (c) 2016 MAC OS . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arr_st;
    NSArray *arr_ct;
    NSArray *arr;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@end

