Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9HEmNV28705
	for <linux-lvm@redhat.com>; Mon, 17 Oct 2005 10:48:23 -0400
Received: from mail.compfort.com.pl (mail.compfort.com.pl [195.117.140.101])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9HEmIwe023853
	for <linux-lvm@redhat.com>; Mon, 17 Oct 2005 10:48:18 -0400
Received: from mirror.compfort.com.pl (mirror [195.117.140.111])
	by mail.compfort.com.pl (8.8.7/8.8.7) with SMTP id QAA09730
	for <linux-lvm@redhat.com>; Mon, 17 Oct 2005 16:47:35 +0200
Received: from BDNOTEBOOK (localhost [127.0.0.1])
	by e150.compfort.com.pl (8.9.3/8.9.1) with ESMTP id QAA19726
	for <linux-lvm@redhat.com>; Mon, 17 Oct 2005 16:56:28 +0200
From: =?iso-8859-2?Q?Bart=B3omiej_Dolata?= <gejzer@ibt.com.pl>
Date: Mon, 17 Oct 2005 16:47:59 +0200
Message-ID: <003901c5d329$c7eac960$6f00000a@compfort.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] My PVs got corrupted, pvcreate did not help...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

hi,
i am using lvm version:
 LVM version:     2.01.09 (2005-04-04)
  Library version: 1.01.03 (2005-06-13)
  Driver version:  4.4.0

somehow after unexpected server's shutdown i lost my lvm configuration,
that is - no logical, nor volume nor physical groups are recognised by LVM.

i tried using lvcreate (i have the /etc/lvm/archive and backup dirs) as
shown:

pvcreate --uuid "Svwv4M-0ShJ-gQHg-j5Kd-ie26-7O8x-F7uwWB" --restorefile
vg1_00023.vg /dev/hdc
  Couldn't find device with uuid 'Svwv4M-0ShJ-gQHg-j5Kd-ie26-7O8x-F7uwWB'.
  Couldn't find device with uuid 'tgSUcc-ihhv-5f1w-VkzU-SBYT-lq0N-Fx6C12'.
  Device /dev/hdc not found.

pvcreate --uuid "tgSUcc-ihhv-5f1w-VkzU-SBYT-lq0N-Fx6C12" --restorefile
vg1_00023.vg /dev/hdd
  Couldn't find device with uuid 'Svwv4M-0ShJ-gQHg-j5Kd-ie26-7O8x-F7uwWB'.
  Couldn't find device with uuid 'tgSUcc-ihhv-5f1w-VkzU-SBYT-lq0N-Fx6C12'.
  Device /dev/hdd not found.

there is something strange: on both hdc and hdd there are ext2 partitions of
size 2gigs
(both hdc and hdd are 160gb). is this a normal LVM behaviour ?
i used hdc and hdd and striped data on it through LVMs logical groups.

pvscan shows:
pvscan --verbose
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
    Walking through all physical volumes
  No matching physical volumes found

is there any way to recover the data that exist on those harddrives 
or the only choice is to wipe everything off and start from the very
beginning?

i would really appreciate all the help

good day,
terry
