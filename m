Return-Path: <mason@suse.com>
Date: Fri, 19 Jan 2001 16:04:42 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] Patch for Kernel 2.2.16
Message-ID: <20320000.979938282@tiny>
In-Reply-To: <20010119181735.B14771@srv.sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: andrea@suse.de


On Friday, January 19, 2001 06:17:35 PM +0000 "Heinz J. Mauelshagen"
<Heinz.Mauelshagen@t-online.de> wrote:

>> After testing a bit more, I have found a bug in the snapshot creation.
>> Under load, you can get a 
>> 'kernel panic: brw_kiovec: iobuf not locked for I/O'
> 
> I think Andrea Arcangeli's patch set the previously introduced
> 
> iobuf->locked = 1; 
> 
> to 0 again.
> Change it to 1 and test.
> This should fix it.
> 

Yes, this diff looks like it came from Andrea's code, but his brw_kiovec
doesn't panic when the iobuf isn't locked.

-chris
