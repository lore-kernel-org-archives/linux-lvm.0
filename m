Return-Path: <banal@home.com>
Message-ID: <3AF16FB0.98B6D2AB@home.com>
Date: Thu, 03 May 2001 07:48:16 -0700
From: Evan Day <banal@home.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Software RAID on LVM
References: <Pine.LNX.4.31L2.0105030602060.3414-100000@theendoftime.net>
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

fox@theendoftime.net wrote:
> One thing I've not gotten a full sense of is can you have a RAID 1 array
> sit ontop of a LVM filesystem?  I understand that LVM does not have any
> internal RAID capabilities (that's the sense I've been getting...though I
> might be on glue...never count out that possibility with me ;) but might
> be possible to have the internal Software RAID in Linux to sit ontop of a
> filesystem using the LVM.

I run LVM on top of a RAID-1 array (i.e. pvcreate /dev/md0).  I tried it the
other way around (RAID-1 on LVM, i.e. /dev/md1 and /dev/md2 in the raidtab), 
but ran into problems with device numbering changing between configuration
and rebooting, but I never did try to resolve it.  It would be great to have
LVM do logical volume level mirroring like HP-UX LVM, but not necessary
since the kernel does RAID separately (unlike the HP-UX kernel).

> Also, what type of filesystem is recommended for use with LVM (and
> possibly RAID 1?  I'm quite hopeful for that...)  I'm thinking ReiserFS is
> the FS of choice here, but would anyone mind clairifying for me why it
> would be better, or which you think would be better?

I like reiserfs - as mentioned before it is a little easier to resize than
ext2, journaling is nice if you want quick repairs, and it has some 
interesting features coming down the pipe along with anticipated increases
in performance as the code base matures.  I'm using reiserfs now and have
had zero problems (so far) and have already taken advantage of the ability
to resize mounted filesystems several times.

-Evan
