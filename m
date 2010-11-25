Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAP3Sjcv007628
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 22:28:45 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAP3SXW8021671
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 22:28:33 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id oAP3SWUC019927
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 22:28:32 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id oAP3SWRk019926
	for linux-lvm@redhat.com; Wed, 24 Nov 2010 22:28:32 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Thu, 25 Nov 2010 03:28:32 +0000 (UTC)
Message-ID: <ickl50$tm$3@taco.int.tagonline.com>
References: <icjsgr$tm$1@taco.int.tagonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Unable to use metadata.dirs in lvm.conf? (Was: Re:
 Solving the "metadata too large for circular buffer"	condition)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Wed, 24 Nov 2010 20:28:11 +0000, Andrew Gideon wrote:

> Finally, there was mention of changing lvm.conf - presumably,
> metadata.dirs - to help make more space.  Once lvm.conf is changed, how
> is that change made live?  Is a complete reboot required, or is there a
> quicker way?

It looks like changes to this file are immediate.  However, I'm having a problem
with metadata being stored "outside" the VG.

I tried:
   * For all PVs in the test VG but one:
      * pvcreate -ff --restorefile /etc/lvm/backup/... --uuid ... --metadatacopies 0  /dev/xvdN1
   * vgcfgbackup
   * cp -p the backup file to the directory I will specify for metadata.dirs in lvm.conf
   * Add the directory to lvm.conf as metadata.dirs

I immediately start seeing "memory" errors from LVM commands.  For example:

	[root@noodle6 tagonline]# vgscan
	  Reading all physical volumes.  This may take a while...
	  Found volume group "TestVG0" using metadata type lvm2
	  Found volume group "guestvg00" using metadata type lvm2
	  You have a memory leak (not released memory pool):
	   [0x83e7848]
	   [0x83e7868]
	  You have a memory leak (not released memory pool):
	   [0x83e7848]
	   [0x83e7868]
	[root@noodle6 tagonline]# 

I then
   * pvcreate -ff --restorefile /etc/lvm/backup/... --uuid ... --metadatacopies 0  /dev/xvdN1
on the final PV that has metadata.  

Now, I cannot see the volume group:

	[root@noodle6 tagonline]# vgdisplay -v TestVG0
	    Using volume group(s) on command line
	    Finding volume group "TestVG0"
	    Wiping cache of LVM-capable devices
	  Volume group "TestVG0" not found
	  You have a memory leak (not released memory pool):
	   [0x8c59ef8]
	   [0x8c55fa8]
	   [0x8c55ed0]
	   [0x8c48aa0]
	  You have a memory leak (not released memory pool):
	   [0x8c59ef8]
	   [0x8c55fa8]
	   [0x8c55ed0]
	   [0x8c48aa0]
	[root@noodle6 tagonline]# 

If I
   * pvcreate -ff --restorefile /etc/lvm/backup/... --uuid ... --metadatacopies 1  /dev/xvdN1
   * vgcfgrestore 
then the volume group is back.  More oddly, vgdisplay -v reports:

  Metadata Areas        2

but, for some reason, the metadata area being used on a separate file system isn't
sufficient or working.

Am I doing something wrong?

This is on CentOS 5.5 386 with:

	[root@noodle6 tagonline]# lvm version
	  LVM version:     2.02.56(1)-RHEL5 (2010-04-22)
	  Library version: 1.02.39-RHEL5 (2010-04-22)
	  Driver version:  4.11.5

Thanks...

	- Andrew
