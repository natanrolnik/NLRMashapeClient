//
//  NLRMashapeRequestSerializer.h
//  NLRMashapeClient
//
//  Created by Natan Rolnik on 01/11/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NLRMashapeRequestSerializer : AFHTTPRequestSerializer

- (instancetype)initWithMashapeAppKey:(NSString *)mashapeKey;

@end
