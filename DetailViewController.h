//
//  DetailViewController.h
//  TaskState
//
//  Created by MAC OS  on 3/16/16.
//  Copyright (c) 2016 MAC OS . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(retain,nonatomic)NSArray *arr_vw_2;
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;

@end
