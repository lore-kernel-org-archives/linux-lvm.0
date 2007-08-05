Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l754HMD7020724
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2007 00:17:22 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l754HLQX019540
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2007 00:17:21 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l754HFip026410
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2007 00:17:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l754HFlT022974
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2007 00:17:15 -0400
Date: Sun, 5 Aug 2007 00:17:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0708050009370.22952-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Best practice: metadata backup
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

LVM keeps backups of metadata in /etc/lvm (or some distro specific place).  
This is not especially useful when the root filesystem itself is in LVM.  
I have been making rsync backups of /etc/lvm to /boot (which is non-LVM
since grub doesn't support LVM until 1.95).  Should I make /etc/lvm a
symlink to /boot/lvm?

When grub supports LVM, and the entire disk is LVM (no partition table),
how will backups be made?  AIX treats the boot LV specially, and ensures
that its PEs are contiguous at the beginning of the disk(s).  Will Linux
LVM do something similar?  Or will we just keep allocating a non-LVM boot
partition?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
