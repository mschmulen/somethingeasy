//
//  ViewController.m
//  carcost
//
//  Created by Matt Schmulen on 11/9/13.
//  Copyright (c) 2013 Matt Schmulen. All rights reserved.
//

#import "ViewController.h"
#import "ViewBreakdown.h"
#import "ModelCar.h"
#import <AFNetworking.h>
#import "AutoClient.h"


#import <AFNetworking/AFHTTPRequestOperation.h>
//#import "AFXMLRequestOperation.h"


//#import <AFXMLRequestOperation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *tableData;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UILabel *labelTotalCost;
@property ( strong, nonatomic) NSString *tmpInnerTagText;

@end

@implementation ViewController

- (IBAction)actionTimeChanged:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        self.labelTotalCost.text = @"$2,334.77";
    }
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        self.labelTotalCost.text = @"$1,134.77";
    }

    if (self.segmentedControl.selectedSegmentIndex == 2) {
        self.labelTotalCost.text = @"$834.77";
    }

    if (self.segmentedControl.selectedSegmentIndex == 3) {
        self.labelTotalCost.text = @"$434.77";
    }
    
}

- (IBAction)actionConfigure:(id)sender {
    
    NSLog(@"configure");
    
}//end actionConfigure

- (NSMutableArray *) tableData
{
    if ( !_tableData){
        _tableData = [[NSMutableArray alloc] init];
        
        ModelCar *car = [[ModelCar alloc] init];
        car.name = @"Silver Prius";
        car.cost = @"22.22";
        car.image = @"driver-thumb.png";
        [ _tableData addObject:car];
        
        ModelCar *cara = [[ModelCar alloc] init];
        cara.cost = @"22.22";
        cara.name = @"Mark Stir";
        cara.image = @"driver-thumb.png";
        [ _tableData addObject:cara];
        
        ModelCar *carj = [[ModelCar alloc] init];
        carj.cost = @"22.22";
        carj.name = @"Blue Prius";
        carj.image = @"driver-thumb.png";
        [ _tableData addObject:carj];
        
        ModelCar *carm = [[ModelCar alloc] init];
        carm.cost = @"22.22";
        carm.name = @"Blue Prius";
        carm.image = @"driver-thumb.png";
        [ _tableData addObject:carm];
        
        ModelCar *cark = [[ModelCar alloc] init];
        cark.cost = @"85.22";
        cark.name = @"John Jacobs";
        cark.image = @"driver-thumb.png";
        [ _tableData addObject:cark];

        
    }
    
    return _tableData;
};


-(void)getData
{
    [[AutoClient sharedClient] getData];
    
    /*
    NSURLSessionDataTask *taskVehiclePosition = [[AutoClient sharedClient] VehiclePosition:@"yack"
                                                                                completion:^(NSArray *results, NSError *error) {
                                                                                    if (results) {
                                                                                        
                                                                                        NSLog(@"Success: VehiclePosition  %@", @"yack");
                                                                                        //self.results = results;
                                                                                        //[self.tableView reloadData];
                                                                                        
                                                                                    } else {
                                                                                        NSLog(@"ERROR: VehiclePosition %@", error);
                                                                                    }
                                                                                }];
    */
    
    
    /*
    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
        NSLog(@"success");
        XMLParser.delegate = self;
        [XMLParser parse];
        NSLog(@"xmlParser is %@",XMLParser);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
        NSLog(@"failure with error %@",error);
    }];
    
    NSLog(@"Making request");
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weather.yahooapis.com/forecastrss?w=2442047&u=c"]];
    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
        XMLParser.delegate = self;
        [XMLParser parse];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
        NSLog(@"failure with error %@",error);
    }];
    [operation start];
    */
    
    
    
    
    
    /*
    NSURLSessionDataTask *task = [[AutoClient sharedClient] searchForTerm:@"apple"
                                                                 completion:^(NSArray *results, NSError *error) {
                                                                     if (results) {
                                                                         
                                                                         NSLog(@"Success: %@", @"yack");
                                                                         //self.results = results;
                                                                         //[self.tableView reloadData];
                                                                         
                                                                     } else {
                                                                         NSLog(@"ERROR: %@", error);
                                                                     }
                                                                 }];
     */
    
    
  
    
    
    /*
    NSURL *URL = [NSURL URLWithString:@"http://example.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL];
    [manager GET:@"/resources" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@" respsponse  %@", responseObject[@"resources"]);
        
        // [resources addObjectsFromArray:responseObject[@"resources"]];
        
    } failure:nil];
    */
    
    
    /*
    NSURL *URL = [NSURL URLWithString:@"http://example.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL];
    [manager GET:@"/resources" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [resources addObjectsFromArray:responseObject[@"resources"]];
        
        [manager SUBSCRIBE:@"/resources" usingBlock:^(NSArray *operations, NSError *error) {
            for (AFJSONPatchOperation *operation in operations) {
                switch (operation.type) {
                    case AFJSONAddOperationType:
                        [resources addObject:operation.value];
                        break;
                    default:
                        break;
                }
            }
        
        } error:nil];
    } failure:nil];
 */
};


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"showReport"]){
        //ViewReportViewController *cvc = (ViewReportViewController *)[segue destinationViewController];
        //cvc.contacts = self.contacts;
        //cvc.delegate = self;
    }
    if([[segue identifier] isEqualToString:@"showBreakdown"]){
        ViewBreakdown *cvc = (ViewBreakdown *)[segue destinationViewController];
        //cvc.contacts = self.contacts;
        //cvc.delegate = self;
    }
}

#pragma mark - Parsing lifecycle

- (void)startTheParsingProcess:(NSData *)parserData
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:parserData]; //parserData passed to NSXMLParser delegate which starts the parsing process
    
    [parser setDelegate:self];
    [parser parse]; // starts the event-driven parsing operation.
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"yweather:astronomy"])
    {
        NSLog(@"Sunrise: %@,  Sunset: %@", [attributeDict valueForKey:@"sunrise"], [attributeDict valueForKey:@"sunset"]);
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    self.tmpInnerTagText = string; // Make a temp NSString to store the text in-between tags
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"title"])
    {
        NSLog(@"%@", self.tmpInnerTagText);
    }
    if ([elementName isEqualToString:@"description"])
    {
        NSLog(@"%@", self.tmpInnerTagText);
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"Paser Error = %@", parseError);
    //TODO: Create Alert message error
}



#pragma mark - UITableView delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if ( [[ [self.tableData objectAtIndex:indexPath.row] class] isSubclassOfClass:[ModelCar class]])
    {
        ModelCar *model = (ModelCar *)[self.tableData objectAtIndex:indexPath.row];
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"         %@", [model name] ];
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"         $%@", [model cost] ];
        //cell.imageView.image = [UIImage imageNamed:@"gas-thumb.png"];
        
        //cell.imageView.image = [UIImage imageNamed:[model image]];
        
        UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(10,3, 32, 32)];
        imv.image=[UIImage imageNamed:[model image]];
        [cell.contentView addSubview:imv];
        //[imv release];
        
        
    }
    
    return cell;
}

#pragma mark - UIViewController methods
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self getData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
