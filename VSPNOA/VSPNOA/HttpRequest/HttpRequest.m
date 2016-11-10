//
//  HttpRequest.m
//  VSPNOA
//
//  Created by 万万万小胖 on 2016/11/8.
//  Copyright © 2016年 VSPN. All rights reserved.
//

#import "HttpRequest.h"
#import "AFNetworking/AFNetworking.h"

@implementation HttpRequest

static HttpRequest *httpRequest = nil;
+ (HttpRequest *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [[self alloc]init];
        }
    });
    return httpRequest;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [super allocWithZone:zone];
        }
    });
    return httpRequest;
}

/**
 *  GET方法 获取网络数据
 *
 *  @param url         url地址
 *  @param dic         如果有需要传的值就写成
 *  @param success     获取数据成功block
 *  @param fail        失败block
 */
- (void)getURL:(NSString *)url parameterDic:(NSDictionary *)dic  success:(void(^)(id responsObj)) success fail:(void(^)(NSError *error))fail{
    
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //请求的结果是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //类型不一致替换一致xx类别的
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"xx", nil];
    
    
    
    manager.requestSerializer = [AFJSONRequestSerializer new];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager GET:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        success(response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);

    }];
    
    
}

- (void)postURL:(NSString *)url parameterDic:(NSDictionary *)dic success:(void (^)(id))success fail:(void (^)(NSError *error))fail{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //请求的结果是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
    

}

@end
