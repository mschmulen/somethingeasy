//
//  AutoClient.m
//  carcost
//
//  Created by Matt Schmulen on 11/10/13.
//  Copyright (c) 2013 Matt Schmulen. All rights reserved.
//

#import "AutoClient.h"

@implementation AutoClient


+ (AutoClient *)sharedClient {
    
    static AutoClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //Auto API
        NSURL *baseURL = [NSURL URLWithString:@"https://api-jp-t-itc.com"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        /*
        NSURL *baseURL = [NSURL URLWithString:@"https://itunes.apple.com/"];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"TuneStore iOS 1.0"}];
        */
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                              diskPath:nil];
        
        [config setURLCache:cache];
        
        _sharedClient = [[AutoClient alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        
        //_sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.responseSerializer = [AFXMLParserResponseSerializer serializer];
        //_sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/html" ,nil];
        
        //AFXMLRequestOperation
        
        // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
        //[self setDefaultHeader:@"Content-type" value:@"text/plain"];
        //[self setDefaultHeader:@"Accept" value:@"text/plain"];
        
        
        //This means that your server is sending "text/html" instead of the already supported types. After a little search, my solution was to add "text/html" to acceptableContentTypes set in AFURLResponseSerialization class. Just search for "acceptableContentTypes" and add @"text/html" to the set manually.
        
    });
    
    return _sharedClient;
}

- (NSURLSessionDataTask *)VehiclePosition:(NSString *)vid completion:( void (^)(NSArray *results, NSError *error) )completion {
    NSURLSessionDataTask *task = [self GET:@"/DataSender/services/GetVehicleInfo"
                                parameters:@{ @"apilkey" : @"78bf15279175",
                                              @"userid" : @"12345678901",
                                              @"OdoUnit" : @"1",
                                              @"OdoDst" : @"1"
                                              }
                                   success:^(NSURLSessionDataTask *task, id responseObject) {
                                       
                                       
                                       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                                       
                                       if (httpResponse.statusCode == 200) {
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               completion(responseObject[@"results"], nil);
                                           });
                                       } else {
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               completion(nil, nil);
                                           });
                                           NSLog(@"Received: %@", responseObject);
                                           NSLog(@"Received HTTP %d", httpResponse.statusCode);
                                       }
                                       
                                   } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                       
                                       NSLog(@"Error in the response : %@", @"responseObject");
                                       
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           completion(nil, error);
                                       });
                                   }];
    return task;
}


-(void)getData {
    
    NSURL *URL = [NSURL URLWithString:@"https://api-jp-t-itc.com/DataSender/services/"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/html" ,nil];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 2)];
    //[manager setResponseSerializer:[AFXMLParserResponseSerializer new]];
    
    //[self setDefaultHeader:@"Content-type" value:@"text/plain"];
    //[self setDefaultHeader:@"Accept" value:@"text/plain"];
    
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    AFJSONResponseSerializer * jsonResponseSerializer = [AFJSONResponseSerializer serializer];
    AFXMLParserResponseSerializer * xmlResponseSerializer = [ AFXMLParserResponseSerializer serializer ];
    AFHTTPResponseSerializer * httpResponseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer = xmlResponseSerializer;//httpResponseSerializer;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/html" ,nil];
    
    [manager GET:@"https://api-jp-t-itc.com/DataSender/services/GetVehicleInfo"
      parameters:@{ @"apilkey" : @"78bf15279175",
                    @"format": @"xml",
                    @"userid" : @"12345678901",
                    @"OdoUnit" : @"1",
                    @"OdoDst" : @"1"}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             NSLog(@"%@", responseObject);
             
             NSLog(@"Data: %@", responseObject);
             
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
              NSLog(@"FAIL  in the response : %@", @"responseObject");
         }];

    /*
     AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL];

    [manager GET:@"/GetVehicleInfo" parameters:@{ @"apilkey" : @"78bf15279175",
        @"userid" : @"12345678901",
        @"OdoUnit" : @"1",
        @"OdoDst" : @"1"}
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             NSLog(@" Success on Get DATA !!! ");
             
        //yack code
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             
             NSLog(@"FAIL  in the response : %@", @"responseObject");
         }];
     */
}



//- (NSURLSessionDataTask *)VehicleSpeed:(NSString *)vid completion:( void (^)(NSArray *results, NSError *error) )completion;
//- (NSURLSessionDataTask *)VehicleInformationOdometer:(NSString *)vid completion:( void (^)(NSArray *results, NSError *error) )completion;


@end
