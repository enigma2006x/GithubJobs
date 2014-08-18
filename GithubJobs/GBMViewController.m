//
//  GBMViewController.m
//  GithubJobs
//
//  Created by GBM Mobile on 8/15/14.
//  Copyright (c) 2014 GBM. All rights reserved.
//

#import "GBMViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface GBMViewController ()

@end

@implementation GBMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated{
    
    NSString *endpoint = [[NSBundle bundleForClass:[self class]]infoDictionary][@"GithubJobsEndpoint"];
    
    NSURL *url = [NSURL URLWithString:[endpoint stringByAppendingString:@"?description=ios&location=NY"]];
    
    NSURLSessionDataTask *jobtask = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                    
                                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                                       
                                                                        if(error){
                                                                            
                                                                            [SVProgressHUD dismiss];
                                                                            
                                                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An error occured"
                                                                                                                            message:error.localizedDescription
                                                                                                                           delegate:nil
                                                                                                                  cancelButtonTitle:@"Dismiss"
                                                                                                                  otherButtonTitles:nil];
                                                                            
                                                                            [alert show];
                                                                            

                                                                            
                                                                            return;
                                                                            
                                                                        }
                                                                        
                                                                        NSError *jsonError = nil;
                                                                        
                                                                        self.jobs = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                    options:0
                                                                                                                      error:&jsonError];
                                                                        
                                                                        
                                                                        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"Jobs %lu", (unsigned long) self.jobs.count]];
                                                                        [self.tableView reloadData];
                                                                        
                                                                    });
                                                                    
                                                                    
                                                                }];
    
    [SVProgressHUD showWithStatus:@"Fectching jobs..."];
    [jobtask resume];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.jobs.count;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.jobs[indexPath.row][@"title"];
    
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSURL *jobUrl = [NSURL URLWithString:self.jobs[indexPath.row][@"url"]];
    [[UIApplication sharedApplication] openURL:jobUrl];
    
}

@end
