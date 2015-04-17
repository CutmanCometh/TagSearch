//
//  FindFilesByTag.h
//  FindFilesByTag
//
//  Created by Josh Walker on 4/17/15.
//  Copyright (c) 2015 7 September Digital. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//! Project version number for FindFilesByTag.
FOUNDATION_EXPORT double FindFilesByTagVersionNumber;

//! Project version string for FindFilesByTag.
FOUNDATION_EXPORT const unsigned char FindFilesByTagVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <FindFilesByTag/PublicHeader.h>


@interface FindFilesByTag : NSObject
{
    
}

/**
TODO expand the funtionality of this framework in the following ways
 -all tag searches are currently case sensitive. add the option for case insensitive searches
 -add more complex search abilites like:
   -search for only files that are tagged with A and B
   -search for files that are tagged with either A or B
   -regex searching
**/

//TODO this is horribly inneficient. figure out where it can be optimized

-(NSArray*)findFilesIn:(NSURL*)directory withTag:(NSString*)tag;
+(NSArray*)getTagsForFile:(NSURL*)file;
+(BOOL)file:(NSURL*)file isTaggedWith:(NSString*)tag;

-(id)init;
-(id)initWithOptions:(NSDictionary*)options;


@end