//
//  UIImage+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/16/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "UIImage+QSAdditions.h"

@implementation UIImage (QSAdditions)

- (NSData *)pngRepresentation {
    return UIImagePNGRepresentation(self);
}
- (NSString *)base64Representation {
    return [[self pngRepresentation] base64Encode];
}


+ (id)resizeableImageNamed:(NSString *)imageName edgeInsets:(UIEdgeInsets)edgeInsets {
    return [[self imageNamed:imageName] resizableImageWithCapInsets:edgeInsets];
}


@end
