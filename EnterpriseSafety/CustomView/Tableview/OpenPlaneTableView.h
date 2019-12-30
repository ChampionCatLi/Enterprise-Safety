//
//  OpenPlaneTableView.h
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/30.
//  Copyright © 2019 chao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenCourseData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenPlaneTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSArray * data;

@end

NS_ASSUME_NONNULL_END
