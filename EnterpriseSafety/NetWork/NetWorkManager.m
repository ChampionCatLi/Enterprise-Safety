//
//  NetWorkManager.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/18.
//  Copyright © 2019 chao. All rights reserved.
//

#import "NetWorkManager.h"
#define SERVER_BASE_URL  @"http://192.168.3.253:8080"


@implementation NetWorkManager

+(void) setup{
    [XMCenter setupConfig:^(XMConfig * _Nonnull config) {
        config.generalServer=SERVER_BASE_URL;
        config.callbackQueue=dispatch_get_main_queue();
        config.consoleLog=YES;
        config.generalHeaders=@{@"Accept":@"application/json"};
    }];
    
    [XMCenter setResponseProcessBlock:^id(XMRequest * _Nonnull request, id  _Nullable responseObject, NSError * _Nullable __autoreleasing * _Nullable error) {
        if([responseObject isKindOfClass:[NSDictionary class]]&&[[responseObject allKeys]count]>0){}
        NSString * status =[responseObject objectForKey:@"status" ];
        if ([status isEqualToString:@"ok"]) {
            return responseObject;
        }
        
        return nil;
    }];
    
    
}

@end
