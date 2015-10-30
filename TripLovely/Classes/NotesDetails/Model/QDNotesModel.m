//
//  QDNotesModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDNotesModel.h"
#import "QDSectionModel.h"

@implementation QDNotesModel

#warning !!!!!!!!!!!!做到此处，需要赋值model
+ (id)notesModelWithDict:(NSDictionary *)dict {
    
    QDNotesModel *notesModel = [[QDNotesModel alloc] initWithDictionary:dict error:nil];
    
    
    
    
    
    NSMutableArray *dataM = [NSMutableArray array];
    
    for (NSDictionary *diction in notesModel.trip_days) {
        
        QDSectionModel *sectionModel = [QDSectionModel sectionModelWithDict:diction array:notesModel.notes_likes_comments];
        
        [dataM addObject:sectionModel];
        
    }
    
    notesModel.trip_days = dataM;
    
    
    notesModel.serial_id = dict[@"serial_id"];
    notesModel.serial_position = dict[@"serial_position"];
    
    notesModel.Id = dict[@"id"];
    
    return notesModel;
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}

@end
