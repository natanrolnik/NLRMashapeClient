//
//  NLRMashapeClient.m
//  NLRMashapeClient
//
//  Created by Natan Rolnik on 01/11/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "NLRMashapeClient.h"
#import "NLRMashapeRequestSerializer.h"

@implementation NLRMashapeClient

- (instancetype)initWithAPIName:(NSString *)APIname mashapeAppKey:(NSString *)mashapeKey
{
    NSAssert(APIname != nil, @"When creating NLRMashapeClient, you must pass the parameter APIName. For example, if the URL of the api you are using is \"https://gatheringpoint-word-cloud-maker.p.mashape.com/\", you should pass \"gatheringpoint-word-cloud-maker\"");
    
    NSString *urlString = [NSString stringWithFormat:@"https://%@.p.mashape.com/", APIname];
    NSURL *url = [NSURL URLWithString:urlString];
    
    self = [super initWithBaseURL:url];
    
    NLRMashapeRequestSerializer *requestSerializer = [[NLRMashapeRequestSerializer alloc] initWithMashapeAppKey:mashapeKey];
    self.requestSerializer = requestSerializer;
    
    return self;
}

@end
