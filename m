Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6IFdIa26267
	for <linux-lvm@redhat.com>; Sun, 18 Jul 2004 11:39:18 -0400
Received: from darrel.wageswebworks.hom (cols6946139190.cols.net
	[69.46.139.190])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6IFdDe1027500
	for <linux-lvm@redhat.com>; Sun, 18 Jul 2004 11:39:14 -0400
Received: from darrel.wageswebworks.hom (localhost.localdomain [127.0.0.1])
	by darrel.wageswebworks.hom (8.12.11/8.12.11) with ESMTP id
	i6IFd38X025849
	for <linux-lvm@redhat.com>; Sun, 18 Jul 2004 10:39:11 -0500
Received: (from darrel@localhost)
	by darrel.wageswebworks.hom (8.12.11/8.12.11/Submit) id i6IEi3ve025512
	for linux-lvm@redhat.com; Sun, 18 Jul 2004 09:44:03 -0500
From: "Darrel Wages Jr." <dotcomdmc@centurytel.net>
Content-Type: multipart/alternative; boundary="=-GWeE+09N6j7ChtgHMz2n"
Message-Id: <1090076983.4381.15.camel@darrel.wageswebworks.hom>
Mime-Version: 1.0
Date: Sun, 18 Jul 2004 09:44:03 -0500
Subject: [linux-lvm] lvm2 problems adding a new physical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-GWeE+09N6j7ChtgHMz2n
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have a vg darrel I wish to extend to a new disk.  I installed the new
disk and ran 
pvcreate /dev/hdd

it returns 
 No physical volume label read from /dev/hdd
 Physical volume "/dev/hdd" successfully created

pvscan returns 
  PV /dev/hdb    VG darrel   lvm2 [19.08 GB / 0    free]
  PV /dev/sda    VG darrel   lvm2 [8.48 GB / 0    free]
  PV /dev/hda2   VG darrel   lvm2 [26.33 GB / 0    free]
  PV /dev/hdd                lvm2 [115.04 GB]
  Total: 4 [168.93 GB] / in use: 3 [53.89 GB] / in no VG: 1 [115.04 GB]

I try to extend vg darrel with vgextend but it failed. So I ran
pvdisplay

it returns 

  --- Physical volume ---
  PV Name               /dev/hdb
  VG Name               darrel
  PV Size               19.08 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              4885
  Free PE               0
  Allocated PE          4885
  PV UUID               qatt1G-G33A-vgrF-i6pV-MT6N-W91I-cTvJ7q
    
  --- Physical volume ---
  PV Name               /dev/sda
  VG Name               darrel
  PV Size               8.48 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              2170
  Free PE               0
  Allocated PE          2170
  PV UUID               IP2WI7-ye5K-mDME-5z5u-R4v7-nYjB-08Nh1O
    
  --- Physical volume ---
  PV Name               /dev/hda2
  VG Name               darrel
  PV Size               26.33 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              6740
  Free PE               0
  Allocated PE          6740
  PV UUID               1Z1XPp-SzFQ-osnY-HqU5-WGsh-JXjG-TXkDoP
    
  --- NEW Physical volume ---
  PV Name               /dev/hdd
  VG Name
  PV Size               115.04 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               k14iEH-C7W2-904v-DEh1-ANlT-rhD3-H3O0oP

So I try pvchange -v -x y /dev/hdd

    Using physical volume(s) on command line
  /dev/cdrom: open failed: Read-only file system
  Allocatability not supported by orphan lvm2 format PV /dev/hdd
  0 physical volumes changed / 1 physical volume not changed

I have searched the net and found nothing about this.  I have also tried
fdisk and added a lvm partition /dev/hdd1 with the same results.  I can
however make a linux partition on the disk and it works fine.  I have
used dd and blockdev as discribed in the howto to wipe the partition
table on the disk.  I am using FC2 with all the updates and latest
kernel.  This drive is a new IBM drive 120 G. 

Thank you.





--=-GWeE+09N6j7ChtgHMz2n
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.1.7">
</HEAD>
<BODY>
I have a vg darrel I wish to extend to a new disk.&nbsp; I installed the new disk and ran <BR>
pvcreate /dev/hdd<BR>
<BR>
it returns <BR>
 No physical volume label read from /dev/hdd<BR>
 Physical volume &quot;/dev/hdd&quot; successfully created<BR>
<BR>
pvscan returns <BR>
&nbsp; PV /dev/hdb&nbsp;&nbsp;&nbsp; VG darrel&nbsp;&nbsp; lvm2 [19.08 GB / 0&nbsp;&nbsp;&nbsp; free<BR>
&nbsp; PV /dev/sda&nbsp;&nbsp;&nbsp; VG darrel&nbsp;&nbsp; lvm2 [8.48 GB / 0&nbsp;&nbsp;&nbsp; free]<BR>
&nbsp; PV /dev/hda2&nbsp;&nbsp; VG darrel&nbsp;&nbsp; lvm2 [26.33 GB / 0&nbsp;&nbsp;&nbsp; free]<BR>
&nbsp; PV /dev/hdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [115.04 GB]<BR>
&nbsp; Total: 4 [168.93 GB] / in use: 3 [53.89 GB] / in no VG: 1 [115.04 GB]<BR>
<BR>
I try to extend vg darrel with vgextend but it failed. So I ran<BR>
pvdisplay<BR>
<BR>
it returns <BR>
<BR>
&nbsp; --- Physical volume ---<BR>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; darrel<BR>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19.08 GB / not usable 0<BR>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4885<BR>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4885<BR>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qatt1G-G33A-vgrF-i6pV-MT6N-W91I-cTvJ7q<BR>
&nbsp;&nbsp;&nbsp; <BR>
&nbsp; --- Physical volume ---<BR>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; darrel<BR>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.48 GB / not usable 0<BR>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2170<BR>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2170<BR>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP2WI7-ye5K-mDME-5z5u-R4v7-nYjB-08Nh1O<BR>
&nbsp;&nbsp;&nbsp; <BR>
&nbsp; --- Physical volume ---<BR>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hda2<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; darrel<BR>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 26.33 GB / not usable 0<BR>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6740<BR>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6740<BR>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1Z1XPp-SzFQ-osnY-HqU5-WGsh-JXjG-TXkDoP<BR>
&nbsp;&nbsp;&nbsp; <BR>
&nbsp; --- NEW Physical volume ---<BR>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdd<BR>
&nbsp; VG Name<BR>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 115.04 GB<BR>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO<BR>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; k14iEH-C7W2-904v-DEh1-ANlT-rhD3-H3O0oP<BR>
<BR>
So I try pvchange -v -x y /dev/hdd<BR>
<BR>
&nbsp;&nbsp;&nbsp; Using physical volume(s) on command line<BR>
&nbsp; /dev/cdrom: open failed: Read-only file system<BR>
&nbsp; Allocatability not supported by orphan lvm2 format PV /dev/hdd<BR>
&nbsp; 0 physical volumes changed / 1 physical volume not changed<BR>
<BR>
I have searched the net and found nothing about this.&nbsp; I have also tried fdisk and added a lvm partition /dev/hdd1 with the same results.&nbsp; I can however make a linux partition on the disk and it works fine.&nbsp; I have used dd and blockdev as discribed in the howto to wipe the partition table on the disk.&nbsp; I am using FC2 with all the updates and latest kernel.&nbsp; This drive is a new IBM drive 120 G. <BR>
<BR>
Thank you.<BR>
<BR>
<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-GWeE+09N6j7ChtgHMz2n--
