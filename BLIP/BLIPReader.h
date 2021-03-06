//
//  BLIPReader.h
//  MYNetwork
//
//  Created by Jens Alfke on 5/10/08.
//  Copyright 2008 Jens Alfke. All rights reserved.
//

#import "TCPStream.h"
#import "BLIP_Internal.h"
@class BLIPResponse;


/** INTERNAL class that reads BLIP frames from the socket. */
@interface BLIPReader : TCPReader

- (void) _addPendingResponse: (BLIPResponse*)response;

@end
