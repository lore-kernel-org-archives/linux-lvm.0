Return-Path: <corryk@us.ibm.com>
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
Message-ID: <OF1CCD62F0.EF95DF65-ON85256A96.00536B19@raleigh.ibm.com>
From: "Kevin M Corry" <corryk@us.ibm.com>
Date: Fri, 27 Jul 2001 10:20:42 -0500
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> > pvcreate would have stamped it's own metadata over md's metadata, so
> > I'm not surprised md had trouble.  This is not a bug in md or
> > reiserfs, just user error that LVM should have caught.

Given his example, pvcreate would have overwritten Reiser's metadata, not
md's, so md shouldn't have really cared.

>
> With respect to the problem I had with /etc/mtab: the root partition is
> not handled by LVM at all.  It is strictly a md device.  I assume
> /etc/mtab got hosed when umount segfaulted (because of the ReiserFS
> bug).  But the root partition (and /etc on the root partition) is
> md/raid1 with ext2.  This seems to me to be a real md bug.  What do you
> think?

Don't go blaming md yet. I was playing around with some new code on my
test box and crashed the system. When it came back, I had the exact same
problem with I/O errors to /etc/mtab. The system simply would not mount
any drives besides root. I actually had to fsck the mounted root fs to
correct the /etc/mtab problem. My root is ext2 on LVM. No md or Reiser.
But I don't believe the problem had anything to do with LVM. I believe
it was just due to really bad filesystem corruption.

-Kevin

-----------------
corryk@us.ibm.com
http://www.sf.net/project/evms/
