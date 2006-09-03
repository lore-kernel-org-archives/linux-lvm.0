Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k830QrrY016954
	for <linux-lvm@redhat.com>; Sat, 2 Sep 2006 20:26:53 -0400
Received: from postfix2-g20.free.fr (postfix2-g20.free.fr [212.27.60.43])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k830QlUn004508
	for <linux-lvm@redhat.com>; Sat, 2 Sep 2006 20:26:47 -0400
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by postfix2-g20.free.fr (Postfix) with ESMTP id DD746B4E3C
	for <linux-lvm@redhat.com>; Sun,  3 Sep 2006 02:26:46 +0200 (CEST)
Received: from imp1-g19.free.fr (imp1-g19.free.fr [212.27.42.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 07B974F110
	for <linux-lvm@redhat.com>; Sun,  3 Sep 2006 02:26:45 +0200 (CEST)
Message-ID: <1157243204.44fa2144de2a0@imp1-g19.free.fr>
Date: Sun, 03 Sep 2006 02:26:44 +0200
From: fabsk@free.fr
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Restore after lvmove crash
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

Hi,

Today, I tried to "lvmove" a logical volume (my first one) to another I just
created. But after a few percent, my computer crashed and now I can't use my
LVM anymore. I am using Kubuntu 6.06 and LVM2. More details:

When I try to do an operation on the LVM (using a live CD), I get the following
error:

  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group lvm2.
  Volume group "lvm2" inconsistent
  Couldn't find volume 'pvmove0' for segment 'start_extent'.
  Couldn't read all logical volumes for volume group lvm2.
  Inconsistent metadata copies found - updating to use version 39

Then I tried to do "vgreduce --removemissing lvm2" ("lvm2" is the name of my VG)
and it destroyed everything. I was able to restore the VG definition with
"vgcfgrestore" by finding the CFG in the partitions, and now I am back to the
previous state: the definitions of my PV and LV seem OK, but there is still
this "pvmove0" around that prevent me to use my LVM.
I don't understand where LVM2 can find this "pvmove0", I thought that if should
only use the definitions in my restore file...

If anyone have any idea, it would be really nice, I am investigating for hours
now and I'm stuck.

Thank you for your attention
Fabien
