#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>
#include <Foundation/Foundation.h>

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   ----------------------------------------------------------------------------- */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
	NSAutoreleasePool *pool; NSMutableDictionary *props,*imgProps; 
	
	NSMutableString *html; 
	NSData *image;
	pool = [[NSAutoreleasePool alloc] init];
	// Initializes the Core Data stack to read from the file and returns a managed object
	
	
	props=[[[NSMutableDictionary alloc] init] autorelease];
	[props setObject:@"UTF-8" forKey:(NSString *)kQLPreviewPropertyTextEncodingNameKey];
	[props setObject:@"text/html" forKey:(NSString *)kQLPreviewPropertyMIMETypeKey];
	html=[[[NSMutableString alloc] init] autorelease]; [html appendString:@"<html><body bgcolor=white>"]; [html appendString:@"<img src=\"cid:tabs.png\"><br>"];		[html appendString:@"</h1><br><br><h2>Description:</h2><br>"]; [html appendString:@"<br><h2>Start Date:</h2><br>"]; [html appendString:@"<br><h2>End Date:</h2><br>"];[html appendString:@"</body></html>"];
//	image=[NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@%@",[[NSBundle bundleWithIdentifier:@"com.apple.eventsmanager.qlgenerator"] bundlePath], @"/Contents/Resources/tabs.png"]];
//	imgProps=[[[NSMutableDictionary alloc] init] autorelease];
//	[imgProps setObject:@"image/png" forKey:(NSString *)kQLPreviewPropertyMIMETypeKey];
//	[imgProps setObject:image forKey:(NSString *)kQLPreviewPropertyAttachmentDataKey];
//	[props setObject:[NSDictionary dictionaryWithObject:imgProps forKey:@"tabs.png"] forKey:(NSString *)kQLPreviewPropertyAttachmentsKey];
	QLPreviewRequestSetDataRepresentation(preview,(CFDataRef)[html dataUsingEncoding:NSUTF8StringEncoding],kUTTypeHTML,(CFDictionaryRef)props);
	
	
	[pool release]; return noErr;
}


void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview)
{
    // implement only if supported
}
