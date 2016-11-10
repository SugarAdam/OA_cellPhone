//
//  HttpRequest.h
//  VSPNOA
//
//  Created by 万万万小胖 on 2016/11/8.
//  Copyright © 2016年 VSPN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

+ (HttpRequest *)shareInstance;

- (void)getURL:(NSString *)url parameterDic:(NSDictionary *)dic  success:(void(^)(id responsObj))success fail:(void(^)(NSError *error))fail;

- (void)postURL:(NSString *)url parameterDic:(NSDictionary *)dic success:(void(^)(id responsObj))success fail:(void(^)(NSError *error))fail;



@end
