//
//  CellModel.h
//  cellOpenAndClose
//
//  Created by 11 on 2017/5/22.
//  Copyright © 2017年 11. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

/**
 *  是否显示
 */
@property (nonatomic,assign) BOOL isShow;
/**
 *  显示的数组
 */
@property (nonatomic,strong) NSArray *pois;
/**
 *  快速创建数据
 */
-(instancetype)initWithDict:(NSDictionary *)info;

@end
