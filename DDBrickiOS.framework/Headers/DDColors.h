//
//  DDColors.h
//  iMarboo
//
//  Created by amoblin on 15/12/9.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#ifndef DDColors_h
#define DDColors_h

#import "UIColor+DD.h"

#define DDColorWhite              DDHexColorFFFFFF

#define DDHexColorFFFFFF          [UIColor colorWithHexString:@"ffffff"]
#define DDHexColorf0f0f0          [UIColor colorWithHexString:@"f0f0f0"]
#define DDHexColorFF8903          [UIColor colorWithHexString:@"ff8903"]
#define DDHexColor5AC1FF          [UIColor colorWithHexString:@"5AC1FF"]
#define DDHexColor0076FF          [UIColor colorWithHexString:@"0076FF"]
#define DDHexColorCCCCCC          [UIColor colorWithHexString:@"cccccc"]
#define DDHexColorE0E0E0          [UIColor colorWithHexString:@"e0e0e0"]
#define DDHexColorB4B4B4          [UIColor colorWithHexString:@"b4b4b4"]
#define DDHexColor646464          [UIColor colorWithHexString:@"646464"]
#define DDHexColor39AAFF          [UIColor colorWithHexString:@"39AAFF"]
#define DDHexColor7EC821          [UIColor colorWithHexString:@"7EC821"]
#define DDHexColor333333          [UIColor colorWithHexString:@"333333"]
#define DDHexColor000000          [UIColor blackColor]
#define DDHexColor666666          [UIColor colorWithHexString:@"666666"]

#define DDHexColorPrimary         [UIColor colorWithHexString:@"337ab7"]
#define DDHexColorSuccess         [UIColor colorWithHexString:@"5cb85c"]
#define DDHexColorInfo            [UIColor colorWithHexString:@"5bc0de"]
#define DDHexColorWarning         [UIColor colorWithHexString:@"f0ad4e"]
#define DDHexColorDanger          [UIColor colorWithHexString:@"d9534f"]


#define UIColorWithRGBA(r,g,b,a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGBA(r,g,b, a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(r,g,b)       [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorFromHex(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif /* DDColors_h */
