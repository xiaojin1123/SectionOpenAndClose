//
//  ChapterHeaderCell.m
//  cellOpenAndClose
//
//  Created by 11 on 2017/5/22.
//  Copyright © 2017年 11. All rights reserved.
//

#import "ChapterHeaderCell.h"
#import "CellModel.h"
#import "AppDelegate.h"
#import "CellOpenAndCloseVC.h"
#import "ContentTableViewCell.h"

@implementation ChapterHeaderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.dataArray = [NSMutableArray array];
        self.chapterIdArray = [NSMutableArray array];
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(13, -4, 19, 64)];
    [self.contentView addSubview:self.imageView2];
    self.chapterName2 = [[UILabel alloc] initWithFrame:CGRectMake(45, 8, 183, 21)];
    self.chapterName2.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.chapterName2];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 59, [UIScreen mainScreen].bounds.size.width, 1) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ContentTableViewCell class] forCellReuseIdentifier:@"testCell"];
}

- (void)showTableView {
    [self.contentView addSubview:self.tableView];
}

- (void)hiddenTableView {
    [self.tableView removeFromSuperview];
}


- (void)configureCellWithModel:(CellModel *)model {
    [self.dataArray removeAllObjects];
    NSArray *array = model.pois;
    for (NSDictionary *dict in array) {
        NSString *str = dict[@"chapterName"];
        [self.dataArray addObject:str];
        
        NSString *chapterId = dict[@"chapterID"];
        [self.chapterIdArray addObject:chapterId];
    }
    
    CGRect frame = self.tableView.frame;
    frame.size.height = 60 * array.count;
    self.tableView.frame = frame;
    [self.tableView reloadData];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *str = self.dataArray[indexPath.row];
    
    cell.image = [[UIImageView alloc] initWithFrame:CGRectMake(13, 0, 19, 60)];
    [cell.contentView addSubview:cell.image];
    cell.label = [[UILabel alloc] initWithFrame:CGRectMake(45, 8, 183, 21)];
    cell.label.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:cell.label];
    
    cell.label.text = str;
    
    //判断cell的位置选择折叠图片
    if (indexPath.row == self.dataArray.count - 1) {
        cell.image.image = [UIImage imageNamed:@"三级圆环"];
        [cell.image setContentMode:UIViewContentModeScaleAspectFit];
    }else{
        cell.image.image = [UIImage imageNamed:@"三级圆环"];
        [cell.image setContentMode:UIViewContentModeScaleAspectFit];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

@end
