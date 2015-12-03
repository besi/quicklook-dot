#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>
#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>
#include "Dot.h"

/* -----------------------------------------------------------------------------
    Generate a thumbnail for file

   This function's job is to create thumbnail for designated file as fast as possible
   ----------------------------------------------------------------------------- */

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize)
{
    NSData *data = [Dot dataFromDotFile:(__bridge NSURL *)url withTimeout:1];

    if ([data length] > 0) {
        CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
        if (source) {
            CGFloat max = (maxSize.width > maxSize.height) ? maxSize.width : maxSize.height;
            NSDictionary *options = @{
                (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize: @(max),
                (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageIfAbsent: (id)kCFBooleanTrue
            };
            CGImageRef image = CGImageSourceCreateThumbnailAtIndex(source, 0, (__bridge CFDictionaryRef)options);
            if (image) {
                QLThumbnailRequestSetImage(thumbnail, image, NULL);
                CGImageRelease(image);
            }
            CFRelease(source);
        }
    }

    return noErr;
}

void CancelThumbnailGeneration(void* thisInterface, QLThumbnailRequestRef thumbnail)
{
    // implement only if supported
}
