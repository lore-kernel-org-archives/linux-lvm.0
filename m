Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4SDjTXE013305
	for <linux-lvm@redhat.com>; Mon, 28 May 2007 09:45:29 -0400
Received: from alela.com (host3.200.110.130.ifxnw.com.ar [200.110.130.3] (may
	be forged))
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4SDjH2t015717
	for <linux-lvm@redhat.com>; Mon, 28 May 2007 09:45:27 -0400
Message-ID: <005401c7a12e$5cda0cb0$7627010a@xdnrox>
From: "Alejandro Santillan" <lvm@alela.com>
References: <006401c79eee$a79f79c0$6401a8c0@alelab7bd24fec>
	<1180127786.16219.15.camel@soda.rider.geekspirit.net>
Subject: Re: [linux-lvm] want to remove a disk
Date: Mon, 28 May 2007 10:44:48 -0300
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>, fabien@jakimowicz.com

Thank you for your answer Fabien. The result of vgdisplay and pvdisplay
commands is:

[root@s2 httpd]# /usr/sbin/vgdisplay
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               148.91 GB
  PE Size               32.00 MB
  Total PE              4765
  Alloc PE / Size       4763 / 148.84 GB
  Free  PE / Size       2 / 64.00 MB
  VG UUID               557bDF-15yS-X2uy-o0WH-kBXG-RJ63-7hVw03

[root@s2 httpd]# /usr/sbin/pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               VolGroup00
  PV Size               74.50 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              2384
  Free PE               0
  Allocated PE          2384
  PV UUID               hdfvF4-MWe1-EVZk-0Mej-o5yH-fYrp-Nd2vTC

  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               VolGroup00
  PV Size               74.41 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              2381
  Free PE               2
  Allocated PE          2379
  PV UUID               RGvP2W-GVKx-Ukjk-9gab-mF4F-HXGo-43Ql12

As far as I understand there are two 80GB HD sata. One as a master (sda2)
and one as slave (sdb2).
I would like to have all the logical volume data on the sda2, and be able to
remove the sdb2 without disrupting the server.
Is that possible?

Thanks,

Alejandro

----- Original Message ----- 
From: "Fabien Jakimowicz" <fabien@jakimowicz.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Friday, May 25, 2007 6:16 PM
Subject: Re: [linux-lvm] want to remove a disk

> ==============================================================
> which command should I use to leave all information on the /dev/sda1
> and be able to take out the other disk?
>
You should give more informations, like where does VG VolGroup00 stands
(sda1 ?). Try the following :
vgdisplay
pvdisplay
-- 
Fabien Jakimowicz <fabien@jakimowicz.com>


> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
