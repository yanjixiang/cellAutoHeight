//
//  ViewController.m
//  cell高度自适应
//
//  Created by 闫继祥 on 2019/8/8.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CustomTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"高度自适应";
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(@0);
        
    }];
    
    [self GetData];
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"--------000-----%f",self.tableView.frame.size.height);
    
}
- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
    }
    return _dataSource;
    
}
- (void)GetData {
    for (int i = 0; i < 10; i ++) {
        CustomModel *model = [[CustomModel alloc] init];
        model.idStr = [NSString stringWithFormat:@"%d",i];
        model.iconImg = @"zhanweitu";
        model.nameStr = @"消息通知";
        model.titleStr = @"这里是消息通知";
        model.timeStr = @"2019-09-08";
        model.detailStr = @"我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我";
        if ( i == 0) {
            model.detailStr = @"";
        }
        if (i == 1) {
            model.detailStr = @"我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我重大消息通知重大消息通知重大消息通知重大消息通知重大消息通知重大消息通知";
        }
        [self.dataSource addObject:model];
    }
    
}
#pragma mark
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = NO;
    CustomModel *model = self.dataSource[indexPath.row];
    cell.model = model;
    
    return cell;
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        //高度自适应
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        _tableView.estimatedRowHeight = 50;
        
    }
    
    return _tableView;
    
}

@end
