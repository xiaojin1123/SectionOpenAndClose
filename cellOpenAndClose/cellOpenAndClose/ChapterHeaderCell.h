//
//  ChapterHeaderCell.h
//  cellOpenAndClose
//
//  Created by 11 on 2017/5/22.
//  Copyright © 2017年 11. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellModel;

@class ChapterExerciseViewController;
@interface ChapterHeaderCell : UITableViewCell <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UILabel *chapterName2;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *chapterIdArray;

@property (nonatomic, strong) ChapterExerciseViewController *chapterVC;
- (void)configureCellWithModel:(CellModel *)model;

- (void)showTableView;
- (void)hiddenTableView;
@end
