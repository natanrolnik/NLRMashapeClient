//
//  NLRMashapeClient.h
//  NLRMashapeClient
//
//  Created by Natan Rolnik on 01/11/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NLRMashapeClient : AFHTTPSessionManager

- (instancetype)initWithAPIName:(NSString *)APIname mashapeAppKey:(NSString *)mashapeKey;

@end
