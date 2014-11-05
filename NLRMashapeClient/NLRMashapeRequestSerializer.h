//
//  NLRMashapeRequestSerializer.h
//  NLRMashapeClient
//
//  Created by Natan Rolnik on 01/11/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "AFURLRequestSerialization.h"

@interface NLRMashapeRequestSerializer : AFHTTPRequestSerializer

- (instancetype)initWithMashapeAppKey:(NSString *)mashapeKey;

@end
