Return-Path: <ralph@oro.net>
Date: Mon, 26 Feb 2001 14:09:05 -0800
From: Ralph Jennings <ralph@oro.net>
Message-ID: <20010226140905.A523@oro.net>
References: <005101c0a073$730d2b60$0f01a8c0@myplace.net> <Pine.LNX.4.10.10102261534200.27416-100000@surreal.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.10.10102261534200.27416-100000@surreal.localdomain>; from unseen@sover.net on Mon, Feb 26, 2001 at 03:38:45PM -0500
Subject: [linux-lvm] Boot with LVM on RAID1 on entire disk
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

I would like to be able to RAID mirror my entire hard drive,
and run LVM on top of that (/, /boot, /usr, swap, MBR).  So
that if 1 of them dies, I only have to take out the good one,
put it in the hda rack, and reboot.

First off, I need the patch to Lilo to allow /, and /boot to
be LVM partitions.  Can somebody please point me to this?

Second, I need a way to tell pvcreate or lvcreate not to mess
with the MBR.  Some sort of paramater to one of them that I
can use to tell it not to use the first 512 bytes (or 4K, or
whatever it needs).  Or alternatively, some way to create an
LV which covers the MBR, which I can keep blank, by just not
writting to it.  I also saw mention of a patch for this in
the list before, but to an old version of LVM.  If this exists
for LVM 0.9.1b5, and kernel 2.4.2 can somebody point me to
this also?

Thanks, Ralph.
