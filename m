Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAPKRPV17028
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 15:27:25 -0500
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAPKROtH026952
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 15:27:24 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep15-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051125202127.CMSU10553.viefep15-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 21:21:27 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] can t resize my lvm
Date: Fri, 25 Nov 2005 21:21:26 +0100
References: <200511211934.13943.Matthias.Meyer@gmx.li>
In-Reply-To: <200511211934.13943.Matthias.Meyer@gmx.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511252121.26572.Matthias.Meyer@gmx.li>
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

... ok.
After all my troubles with this not accessible volume group
my logical volume is running again.

But again I can't growth the size of it:
Thats what I do:

vdr:~# vgcreate -v LVM3 /dev/hdd1 -s 256M
vdr:~# mke2fs -m 0 -O sparse_super -T largefile4 /dev/LVM2/Media
vdr:~# lvcreate I do not remeber the paramters :-(

vdr:~# pvcreate -v /dev/hdc1
vdr:~# vgextend LVM2 /dev/hdc1
vdr:~# lvextend -l 1115 /dev/LVM2/Media /dev/hdc1
vdr:~# e2fsadm -v -l 1115 /dev/LVM2/Media
e2fsadm -- checking logical volume name
e2fsadm -- checking existance of logical volume /dev/LVM2/Media
e2fsadm -- checking for relative/absolute size change
e2fsadm -- reading VGDA of volume group "LVM2" from lvmtab
e2fsadm -- calculating absolute logical volume size
e2fsadm -- size of "/dev/LVM2/Media" would not change
vdr:~# echo $?
6

Why e2fsadm do not change the size?

Please help me !

Thanks in advance
Matthias
-- 
Don't Panic
