//
//  AutoClient.h
//  carcost
//
//  Created by Matt Schmulen on 11/10/13.
//  Copyright (c) 2013 Matt Schmulen. All rights reserved.
//

#import "AFHTTPSessionManager.h"
//#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"

@interface AutoClient : AFHTTPSessionManager
+ (AutoClient *)sharedClient;

-(void)getData;

- (NSURLSessionDataTask *)VehiclePosition:(NSString *)vid completion:( void (^)(NSArray *results, NSError *error) )completion;

//- (NSURLSessionDataTask *)simple:(NSString *)vid completion:( void (^)(NSArray *results, NSError *error) )completion;
//- (NSURLSessionDataTask *)VehicleSpeed:(NSString *)vid completion:( void (^)(NSArray *results, NSError *error) )completion;
//- (NSURLSessionDataTask *)VehicleInformationOdometer:(NSString *)vid completion:( void (^)(NSArray *results, NSError *error) )completion;


//- (NSURLSessionDataTask *)searchForTerm:(NSString *)term completion:( void (^)(NSArray *results, NSError *error) )completion;

//Get the odo reading  findO VehiclePosition
//https://api-jp-t-itc.com/DataSender/services/GetVehicleInfo?apilkey=78bf15279175&userid=jpTKY-211&OdoUnit=1&OdoDst=1



//https://api-jp-t-itc.com/DataSender/services/SearchDataReset?apilkey=78bf15279175&userid=jpTKY-211




@end
