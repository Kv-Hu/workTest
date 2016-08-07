//
//  DDMacros.h
//  iMarboo
//
//  Created by amoblin on 15/12/20.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#ifndef DDMacros_h
#define DDMacros_h

#ifdef DEBUG
#define DDLog(format, ...) NSLog( @"%s:%d %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(format), ##__VA_ARGS__] )
#else
#define DDLog(format, ...)
#endif

#define IOS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#endif /* DDMacros_h */
