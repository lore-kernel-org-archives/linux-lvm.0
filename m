Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j09LpOr21908
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 16:51:24 -0500
Received: from anubis.medic.chalmers.se (anubis.medic.chalmers.se
	[129.16.30.218])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j09LpIhR007698
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 16:51:19 -0500
Received: from [193.11.254.225] (myrium.csbnet.se [193.11.254.225])
	by anubis.medic.chalmers.se (Postfix) with ESMTP id 164FBD8B3
	for <linux-lvm@redhat.com>; Sun,  9 Jan 2005 22:51:18 +0100 (CET)
Message-ID: <41E1A755.6070305@dtek.chalmers.se>
Date: Sun, 09 Jan 2005 22:51:17 +0100
From: Daniel Roth <d00roth@dtek.chalmers.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount after crash
References: <41BB808E.60108@danielroth.se>
	<41BFC24F.6060207@danielroth.se>	<41C1D30A.6030201@danielroth.se>	<1103222964.31909.224.camel@tesuji.nac.uci.edu>	<20041221211015.GS26670@agk.surrey.redhat.com>
	<1103665984.11479.45.camel@tesuji.nac.uci.edu>
In-Reply-To: <1103665984.11479.45.camel@tesuji.nac.uci.edu>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


>I have my data back now. As a reminder, what I did was:
>
>On FC3's rescue disk...
>
>1) Do startup network interfaces
>2) Don't try to automatically mount the filesystems - not even readonly
>3) lvm vgchange --ignorelockingfailure -P -a y
>4) fdisk -l, and guess which partition is which based on size: the small
>one was /boot, and the large one was /
>5) mkdir /mnt/boot
>6) mount /dev/hda1 /mnt/boot
>7) Look up the device node for the root filesystem
>in /mnt/boot/grub/grub.conf
>8) A first tentative step, to see if things are working: fsck -
>n /dev/VolGroup00/LogVol00
>9) Dive in: fsck -f -y /dev/VolGroup00/LogVol00
>10) Wait a while...  Be patient.  Don't interrupt it
>11) Reboot
>  
>
Thanks Dan! This also restored all my data. Thanks!

Daniel
