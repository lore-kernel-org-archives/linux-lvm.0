Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k34CGALI025412
	for <linux-lvm@redhat.com>; Tue, 4 Apr 2006 08:16:10 -0400
Received: from smtp-out1.tiscali.nl (smtp-out1.tiscali.nl [195.241.79.176])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k34CG9BE020013
	for <linux-lvm@redhat.com>; Tue, 4 Apr 2006 08:16:09 -0400
Message-ID: <44326388.90001@tiscali.nl>
Date: Tue, 04 Apr 2006 14:16:08 +0200
From: Sverre Rabbelier <sverrerabbelier@tiscali.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Shrinking what part of a PV a VG uses, Is it possible?
Reply-To: sverre@rabbelier.nl,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Heya,

I've got two Harddisks, a 250GB (hdb) and a 120GB (hda).
HDB is fully in use by only one VG (unknowingly named "lvg").
Which consists of threre LV, being:
lvm> lvscan
  ACTIVE            '/dev/lvg/root' [117.19 GB] inherit
  ACTIVE            '/dev/lvg/home' [78.12 GB] inherit
  ACTIVE            '/dev/lvg/swap' [4.06 GB] inherit

Also, it's not fully in use (the VG):
lvm> vgs
  VG   #PV #LV #SN Attr  VSize   VFree
  lvg    1   3   0 wz--n 233.66G 34.28G

The trouble is, that on hda I have a Windows XP installation.. (you know 
what's going to be next right?).
Indeed, I want to have the data on hdb (or at least, some 20GB of it) to 
be readable by Windows.
I know of only one way to do that, which would be to format a part of 
hdb as FAT, which is OK by me.
Point being, all of hdb is LVG partitioned, so how am I going to format 
any of it as FAT?

My first choice would be to partition a part of the VG as 
Windows-readable, but I didn't think that's possible (if it is, please 
tell me!).
My second choice would be to shrink the VG 'lvg', making it not use all 
of the disk, and partition the remainder (the 34.28G), as FAT.
But when reading the help files, I ran into:
lvm> help pvresize
  pvresize: Resize a physical volume in use by a volume group
  Not implemented.  Use pvcreate options.

But reading 'info pvcreate' didn't point me in the right direction... at 
all!
My last option would be to remove LVM from hdb, but I have no idea how 
to do that without losing all my data...

So my question is, how do I achieve my goal? How do I get Windows to be 
able to read some (or all?!) of hdb?


Thanks in advance,

Sverre Rabbelier.
