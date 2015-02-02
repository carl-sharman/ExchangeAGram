//
//  Bridging-Header.h
//  ExchangeAGram
//
//  Created by Carl Sharman Work on 30/01/2015.
//  Copyright (c) 2015 United Learning. All rights reserved.
//

// The Bridging Header is needed because the FacebookSDK is in Objective C and we are writing in Swift. There is a build setting called "Objective C Bridging Header" that points to this file.

#import <FacebookSDK/FacebookSDK.h>
