Return-Path: <mjt@tls.msk.ru>
Message-ID: <3AF66D95.9440B97E@tls.msk.ru>
Date: Mon, 07 May 2001 13:40:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't pvcreate second partition...
References: <20010506173613.78224.qmail@web10805.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
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

Darren Young wrote:
> 
> Funny, I had the same issue at the same time. I
> created /dev/hdb7 with fdisk and then a pvcreate just
> after. pvcreate stated that the dev didn't exist.
> Reboot fixed the problem. This could be a problem for
> machines already up in production with small windows
> for restarts. Why is this necessary and will it become
> a "non-issue" in future releases? If this will be
> necessary forever, then some simple planning would
> solve the problem, at least on new installations. Any
> way around this?

Linux kernel NOT rereads partition table of a BUSY disk.
If you mount at least one filesystem from it, or used
a swap space on it, or opened /dev/[hs]d* device etc etc,
disk will be marked as busy.  Well, linux kernel never
*rereads* disk partition, it reads them on a first disk
usage, when usage count increases from 0 to 1 (this is
shown on console when you first access a disk -- kernel
reports disk's geometry etc).  And "forgots" about a disk
(but still showing it in /proc/partitions) when it's usage
becomes zero again. This is a long-standing issue that
will not be fixed in a near future.  Probably IBM's LVMS
will have some infrastructure to address this, but I'm
not shure.  To "fix" this, *significant* block layer
changes should be made, and all filesystems should be
prepared to handle partition table change at run time.
And there is nothing LVM or any other component can do
here.

[]
> An off topic question, but I think this is the best
> place to start. How could one build "network logical
> volumes"? Let's say I have 5 machines running LVM and
[...]
You can look to various nbd (Network Block Device)
implementations, and build a softraid on top of them.
For NBDs, look to links at linux-ha.org site.

Regards,
 Michael.
