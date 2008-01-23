Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0NBdulI027795
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 06:39:56 -0500
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0NBdPBY008014
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 06:39:25 -0500
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id 78277331FA9
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 12:39:19 +0100 (CET)
Received: from webmail.cesca.es (calderer.cesca.es [84.88.0.35])
	by carlit.cesca.es (Postfix) with ESMTP id 49536330A7D
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 12:38:59 +0100 (CET)
Message-ID: <1746.193.144.33.101.1201088359.squirrel@webmail.cesca.es>
Date: Wed, 23 Jan 2008 12:39:19 +0100 (CET)
From: Jordi Prats =?iso-8859-1?Q?Catal=E0?= <jprats@cesca.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] how to remove a device
Reply-To: jprats@cesca.es,
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,
I'm currently using cLVM. I moved a RAID0 disc to a RAID5 disc using
pvmove on my first node and removed from it's volume group using vgreduce.

After that I deleted de first disk. Now on the secondary node I'm getting
IO errors like that:

[root@inf18 ~]# pvscan
  /dev/sdb: read failed after 0 of 4096 at 214748299264: Input/output error
  /dev/sdb1: read failed after 0 of 512 at 214745481216: Input/output error
  PV /dev/sde1           VG padicat.bench   lvm2 [200.00 GB / 0    free]
  PV /dev/sda1           VG vm.fibra        lvm2 [10.00 GB / 0    free]
  PV /dev/sdd1           VG vm.fibra        lvm2 [25.00 GB / 0    free]
  PV /dev/sdc2           VG vm.fibra        lvm2 [1012.00 MB / 492.00 MB
free]
  PV /dev/cciss/c0d0p3                      lvm2 [91.69 GB]
  Total: 5 [327.66 GB] / in use: 4 [235.98 GB] / in no VG: 1 [91.69 GB]
[root@inf18 ~]# vgreduce padicat.bench /dev/sdb1
  Physical Volume "/dev/sdb1" not found in Volume Group "padicat.bench"

Also I can't use the LV on the VG that was that disk. Anyone can help me
on telling LVM not to use sdb anymore? It's a production system, so by now
reboot it it's no an option to me.

Thanks!
Jordi
