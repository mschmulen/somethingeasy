//
//  ViewReport.m
//  carcost
//
//  Created by Matt Schmulen on 11/9/13.
//  Copyright (c) 2013 Matt Schmulen. All rights reserved.
//

#import "ViewReport.h"
#import "ModelCar.h"

@interface ViewReport ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *tableData;
@end

@implementation ViewReport



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



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
