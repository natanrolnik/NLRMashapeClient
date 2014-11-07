//
//  ViewController.m
//  NLRMashapeClient
//
//  Created by Natan Rolnik on 01/11/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "ViewController.h"
#import "NLRMashapeClient.h"

@interface ViewController ()

@property (nonatomic, strong) NLRMashapeClient *weatherMashapeClient;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.weatherMashapeClient = [[NLRMashapeClient alloc] initWithAPIName:@"george-vustrey-weather" mashapeAppKey:@"PUT-HERE-YOUR-KEY"]; //GET A KEY FOR YOUR APP. YOU MUST GENERATE A KEY FOR EACH APP YOU WILL USE.
}

- (IBAction)makeRequest:(id)sender
{
    [self.weatherMashapeClient GET:@"api.php" parameters:@{@"location" : @"Tel Aviv"} success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *responseDescription = [responseObject description];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success!" message:responseDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        
        NSLog(@"%@", responseDescription);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
