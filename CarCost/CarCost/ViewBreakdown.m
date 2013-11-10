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
#import "ModelExpense.h"


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
        car.name = @"tss-Mountain View";
        car.cost = @"33 miles $9.22";
        car.image = @"driver-thumb.png";
        [ _tableData addObject:car];
        
        ModelCar *cara = [[ModelCar alloc] init];
        cara.cost = @"54.22";
        cara.name = @"Gas Chevron";
        cara.image = @"driver-thumb.png";
        [ _tableData addObject:cara];
        
        ModelCar *cark = [[ModelCar alloc] init];
        cark.name = @"tss-San Mateo ";
        cark.cost = @"25 miles $12.22";
        cark.image = @"driver-thumb.png";
        [ _tableData addObject:cark];
        
        ModelCar *carc = [[ModelCar alloc] init];
        carc.cost = @"22.22";
        carc.name = @"Car Maintenance";
        carc.image = @"driver-thumb.png";
        [ _tableData addObject:carc];
        
        ModelCar *carm = [[ModelCar alloc] init];
        carm.name = @"tss-San Mateo ";
        carm.cost = @"25 miles $12.22";
        carm.image = @"driver-thumb.png";
        [ _tableData addObject:carm];
        
        ModelCar *carn = [[ModelCar alloc] init];
        carn.name = @"Redwood City";
        carn.cost = @"25 miles $12.22";
        carn.image = @"driver-thumb.png";
        [ _tableData addObject:carn];
        
        ModelExpense *e = [[ModelExpense alloc] init];
        e.name = @"San Diego - Milage";
        e.cost = @" 33 miles 11.22";
        e.image = @"driver-thumb.png";
        e.description = @" automatic milage from auto cloud";
        
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
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"         %@", [model name] ];
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"         %@", [model cost] ];
        //cell.imageView.image = [UIImage imageNamed:@"gas-thumb.png"];
        
        //cell.imageView.image = [UIImage imageNamed:[model image]];
        
        UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(10,3, 32, 32)];
        imv.image=[UIImage imageNamed:[model image]];
        [cell.contentView addSubview:imv];
        
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
