//
//  ViewController.m
//  TaskState
//
//  Created by MAC OS  on 3/16/16.
//  Copyright (c) 2016 MAC OS . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tbl_vw;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    NSURL *url=[NSURL URLWithString:@"https://raw.githubusercontent.com/nshntarora/Indian-Cities-JSON/master/cities.json"];
    arr_st=[[NSArray alloc]init];
    arr_ct=[[NSArray alloc]init];
    
    NSData *data=[NSData dataWithContentsOfURL:url];
    arr=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    for (int i=0; i<[[arr valueForKey:@"state"]count]; i++)
    {
        NSPredicate *prd=[NSPredicate predicateWithFormat:@"SELF==%@",[[arr valueForKey:@"state"]objectAtIndex:i]];
        
        if ([[arr_st filteredArrayUsingPredicate:prd]count]==0)
        {
            NSString *st=[[arr valueForKey:@"state"]objectAtIndex:i];
            //NSString *st2=[st stringByReplacingOccurrencesOfString:@"\"" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [st length])];
            
            arr_st=[arr_st arrayByAddingObject:st];
        }
    }
    NSLog(@"%@",arr_st);
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_st.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[arr_st objectAtIndex:indexPath.row];//temp
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSPredicate *prd=[NSPredicate predicateWithFormat:@"state==%@",[arr_st objectAtIndex:indexPath.row]];
    
    DetailViewController *detail=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detail.arr_vw_2=[arr filteredArrayUsingPredicate:prd];//id,city
    
    [self.navigationController pushViewController:detail animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
