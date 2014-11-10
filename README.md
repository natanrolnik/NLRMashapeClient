NLRMashapeClient
================

An easy way to call Mashape APIs

### Motivation

When calling some API provided via Mashape, you can use the request example they provide. The problem is, that most developers are (at least I am :smiley:) more familiar with AFNetworking than with [Unirest for Objective-C](http://unirest.io/objective-c), used in their example. Not only this, but the `success`/`failure` completion blocks and `AFHTTPSessionManager`, and the whole structure of `AFNetworking` are much better. For this reason, I decided to build a Mashape client on top of `AFNetworking`.

### Usage

Let's take as an example ["Ultimate Weather Forecasts"](https://www.mashape.com/george-vustrey/ultimate-weather-forecasts), a free API that return weather conditions. After you login to Mashape and have at least one application, you will get a `Mashape Key` for each app to make the requests for this app.

First, create a subclass of NLRMashapeClient, and declare the singleton method as shown below.

```
#import "NLRMashapeClient.h"

@interface WeatherClient : NLRMashapeClient

+ (instancetype)sharedClient;

@end

```

Now, you should implement the singleton method with the correct API name and Mashape App Key. The API name is the part in the URL before the `.p.mashape.com`. For example, if the base URL for the weather API is `https://george-vustrey-weather.p.mashape.com`, you should use `george-vustrey-weather`. The app key you can take from the application page inside Mashape, and then press the "GET THE KEYS" button.

```

#import "WeatherClient.h"

@implementation WeatherClient

+ (instancetype)sharedClient
{
    static dispatch_once_t once;
    static id sharedInstance;

    dispatch_once(&once, ^{
        sharedInstance = [[self alloc]  initWithAPIName:@"george-vustrey-weather" mashapeAppKey:@"THE-KEY-FOR-YOUR-APP"];
    });

    return sharedInstance;
}

@end

```

For each Mashape API you will use, you should use one subclass/singleton of `NLRMashapeClient`.

**After your client is initialized correctly, you are done with configuration, and you can make as many calls as you wish, without needing to set the headers, keys, only what matters: the endpoint and parameters!**

For example, if the `GET` examplified is `https://george-vustrey-weather.p.mashape.com/api.php`, and the parameter is `location`, you just call:

```
    [[WeatherClient sharedClient]] GET:@"api.php" parameters:@{@"location" : @"Tel Aviv"} success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
```

For a single call, the Objective-C example provided by Mashape is much simpler. But if you need to make more than one call, want to pass the parameters in a dictionary, want to use `NSURLSession`, and are familiar with `AFNetworking`, so this was made for you :heart_eyes:!

If you want to play more with this, you can just use the example project (it requires [CocoaPods](www.cocoapods.org) and running `pod install` before running).

### Installation

Definitely, the best way to use `NLRMashapeClient` is with CocoaPods.

Add to your podfile the following line:

```
pod 'NLRMashapeClient', '~> 0.1'
```
