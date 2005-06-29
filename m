Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5T8SFu20574
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 04:28:15 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5T8S9rC019210
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 04:28:10 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1DnXoJ-0005E3-Dx
	for linux-lvm@redhat.com; Wed, 29 Jun 2005 10:20:43 +0200
Received: from althur.gotadsl.co.uk ([84.12.135.175])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 10:20:43 +0200
Received: from ross by althur.gotadsl.co.uk with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 10:20:43 +0200
From: Ross Burton <ross@burtonini.com>
Date: Wed, 29 Jun 2005 08:14:09 +0000 (UTC)
Message-ID: <loom.20050629T100626-96@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Dual booting with LVM
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

I'm trying to dual boot my new laptop with both WinXP, Ubuntu Hoary, and Debian
Sid, and am getting stuck.  This is not strictly a LVM problem, but LVM is the
main cause of my situation.  This is what I have so far:

hda1 is NTFS, is WinXP
hda2 is ext3, is /boot
hda3 is a LVM2 PV

The PV is split into four LVs: "ubuntu", "debian", "home", and "swap". 
Currently ubuntu has a fresh Hoary install in, and home is obviously my home
directory.  My plan is to put Debian Sid into the debian LV.

However, I'm getting confused about how LVM, grub, and the boot sequence will
work.  At the moment the MBA contains grub, which reads configuration and
Ubuntu's kernel from hda2 as grub can't read kernels from a LVM partition.  If I
install Debian into the debian LV, what do I do with it's /boot?  Would I need
to create a new partition outside the LVM for it, or is there a way I can share
hda2 with both Debian and Ubuntu as /boot?

If anyone has done this before, some advise would be much appreciated.

Thanks,
Ross
