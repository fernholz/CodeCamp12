//
//  SDCSession.h
//  SDC12
//
//  Created by Derek Fernholz on 10/16/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

/*
 {
 "abstract": "Learn about the great new features coming in the next version of ASP.NET and Visual Studio.  There are some great enhancements to all of the editors (CSS snippets, CSS vendor prefixes, JavaScript go to definition, etc).  Discover the new model binding and repository capabilities in Web Forms, along with unobtrusive jQuery validation support for validators.  See how to bundle and minify CSS and JavaScript files simply to drastically improve web site performance.   The new Page Inspector shows the DOM and styles applied to pages, while indicating directly where the given markup originated in the ASP.NET project so it can be easily adjusted.  Review how the new asynchronous features allow much better scalability by freeing ASP.NET threads during long running asynchronous requests. ", 
 "id": "5", 
 "resource_uri": "/api/v1/session/5/", 
 "room": 1, 
 "slug": "aspnet-and-visual-studio-2012", 
 "speaker": ["/api/v1/speaker/1/"], 
 "time": "8",
 "title": "ASP.NET and Visual Studio 2012", 
 "year": 2012
 }
 */

#import <Foundation/Foundation.h>

@interface SDCSession : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *abstract;
@property (nonatomic, copy) NSString *room;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *speaker;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
