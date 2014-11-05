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

@property (nonatomic, strong) NLRMashapeClient *mashapeClient;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.mashapeClient = [[NLRMashapeClient alloc] initWithAPIName:@"george-vustrey-weather" mashapeAppKey:@"3QNzamv3LHmshiieGW72VL7wbWrBp1M39a2jsnGA8n1KjUajR4"];
}

- (IBAction)makeRequest:(id)sender
{
    [self.mashapeClient GET:@"api.php?location=Tel+Aviv" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *responseDescription = [responseObject description];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success!" message:responseDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        
        NSLog(@"%@", responseDescription);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
