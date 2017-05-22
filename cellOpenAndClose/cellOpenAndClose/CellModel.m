//
//  CellModel.m
//  cellOpenAndClose
//
//  Created by 11 on 2017/5/22.
//  Copyright © 2017年 11. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

-(instancetype)initWithDict:(NSDictionary *)info{
    self= [super init];
    if(self)
    {
        self.pois = info[@"sub"];
    }
    return self;
}
@end
