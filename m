From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] Automatically GROW an LV to max size
Message-Id: <NBBBKLKHMJHIJLHOGAOJKEONJDAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020123172346.L8275@ultraviolet.org>
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
Date: Wed Jan 23 19:31:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

I imagine this would be fairly easy to do with a script?
Check the size with fdisk, then pass that along to
the lvm tools.
Perl should be able to handle that?

This is a suggestion only, I'm no programmer!
8-)

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Tracy R Reed
> Sent: Thursday, 24 January 2002 2:24 p.m.
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Automatically GROW an LV to max size
> 
> 
> I'm the system administrator for MP3.com. I talked to some Sistina
> developers who visited the office a year or so ago but don't recall their
> names now, sorry. One if the things I asked for in LVM (and would still
> like to see) is a switch to create an LV that is as big as the remaining
> disk space available. 
> 
> We have a redhat based kickstart install that sets up a basic / and then
> creates an LV out of the rest of the disk. Currently we have hard coded
> the size of the remaining disk but it would be really slick if we could
> just pass an option to lvcreate which would just create an lv with the
> most space possible. 
> 
> Right now if we ever install on anything other than one of our standard
> 36G disks we have to delete the lv that was made and resize it or if the
> disk is smaller than 36G the hard coded lvcreate size will fail due to
> lack of space. 
> 
> There's got to be a cleaner way to do it.
> 
> -- 
> Tracy Reed      http://www.ultraviolet.org
> 
