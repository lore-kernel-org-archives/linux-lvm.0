From: "Justin Hamilton" <JHamilton@Earthling.Net>
Subject: RE: [linux-lvm] ERROR: 0.8final/tools/lib/liblvm.h:50: gnu/types.h: No such file or directory
Date: Sun, 30 Jul 2000 16:48:40 -0400
Message-ID: <NDBBKIEANAMHBNPAILKPCECGCLAA.JHamilton@Earthling.Net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <001001bffa0e$39902f60$4425ebc3@miguel>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Thanks for the replies, however I think my problem is actually quiet a bit
simpler :)

I am trying to use a 2.2.15 kernel and of course there is no LVM support
there :(


Here's the big picture of what I am trying to do:

I have three disks: 10GB SCSI, 12GB & 13GB HPT366.

I want to carve them into 2GB pv's, put them in 1 or more vg's, and use lv's
to build my FS's.

So far so good.  Now I want to use ReiserFS on those lv's.

Getting a single kernel version that supports: a) HPT366; b) LVM; c)
ReiserFS, does not seem possible at this time!

So I guess I'll wait for RedHat 7 to give me all of this.

If I'm wrong, and it can be done, then please don't hesitate to let me know.

Thanks

Justin
