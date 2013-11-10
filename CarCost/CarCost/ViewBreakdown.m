//
//  ViewCar.m
//  carcost
//
//  Created by Matt Schmulen on 11/9/13.
//  Copyright (c) 2013 Matt Schmulen. All rights reserved.
//

#import "ViewBreakdown.h"
//#import "ViewReportViewController.h"
#import "ModelCar.h"


@interface ViewBreakdown ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *tableData;
@end

@implementation ViewBreakdown
- (IBAction)actionAddExpense:(id)sender {
}

- (NSMutableArray *) tableData
{
    if ( !_tableData){
        _tableData = [[NSMutableArray alloc] init];
        
        ModelCar *car = [[ModelCar alloc] init];
        car.name = @"MY CAR B";
        [ _tableData addObject:car];
        
        ModelCar *cara = [[ModelCar alloc] init];
        cara.name = @"MY CAR A";
        [ _tableData addObject:cara];
        
    }
    
    return _tableData;
};

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"showReport"]){
        //ViewReportViewController *cvc = (ViewReportViewController *)[segue destinationViewController];
        //cvc.contacts = self.contacts;
        //cvc.delegate = self;
    }
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
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@ $ %@", [model name], [model name] ];
    }
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
