//
//  SSPublicDefine.h
//  SSuite
//
//  Created by zhangtao on 2020/9/17.
//  Copyright © 2020 ssuite. All rights reserved.
//

#ifndef SSPublicDefine_h
#define SSPublicDefine_h

#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
#define m6Scale               (SCREEN_WIDTH/750)
#define SCREEN_FIX(P)         ((float)floor((SCREEN_WIDTH * P) / 375.0))

#define STATUS_BAR_HEIGHT     [UIApplication sharedApplication].statusBarFrame.size.height
#define NAV_BAR_HEIGHT        (STATUS_BAR_HEIGHT + 44.f)

#define IsIPhoneX        (STATUS_BAR_HEIGHT >= 44?YES:NO)
#define SCREEN_SAFE_BOTTOM    (IsIPhoneX ? 34.f : 0.f)
#define TAB_BAR_HEIGHT        (SCREEN_SAFE_BOTTOM + 49.f)

#define ISIOS8 ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define ISIOS9 ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define ISIOS11 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)

#endif /* SSPublicDefine_h */
