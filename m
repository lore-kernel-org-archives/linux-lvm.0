Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5A4LbO16687
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2005 00:21:39 -0400
Received: from mail.lnnu.edu.cn (cncln.online.ln.cn [218.25.162.219] (may be
	forged))
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j5A4LQFR027504
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2005 00:21:29 -0400
Message-Id: <200506100421.j5A4LQFR027504@mx1.redhat.com>
From: "cwinl" <cwinl-linux-lvm@lnnu.edu.cn>
Date: Fri, 10 Jun 2005 08:19:22 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <6A58CFF91886D54BBDA1FE988C4DF79D025065@bagex01.baghus-lan.net>
Subject: [linux-lvm] lvm2 disk replacement
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

hi,all
 
i have a DELL PE2800 server with 10 300GB disks.i make 3 PV which are 3
RAID0.then a LV cross the whole 3 PV.
now , one of RAID0 is unstable.
so i want to change disk.
but i can't lose data.
 
here is 'df' information:
 
/dev/mapper/nicvg-niclv       2.0T  774G  1.2T  40% /ftproot
 
and here is 'pvscan' information:
 
ftp:~# pvscan
  /dev/hda: open failed: No medium found
  PV /dev/sdb1   VG nicvg   lvm2 [838.09 GB / 0    free]
  PV /dev/sdc1   VG nicvg   lvm2 [558.72 GB / 0    free]
  PV /dev/sdd1   VG nicvg   lvm2 [558.72 GB / 0    free]
  Total: 3 [1.91 TB] / in use: 3 [1.91 TB] / in no VG: 0 [0   ]
 
the unstable PV is /dev/sdb1
 
i want to move data from /dev/sdb1 to the reset PV such as /dev/sdc1 and
/dev/sdd1.
i think the disk space is enough .
but when i use command 'pvmove -v /dev/sdb1' i got wrong info:
 
ftp:~# pvmove -v /dev/sdb1
    Finding volume group "nicvg"
  No extents available for allocation
 
my question is :
the reset of disk space is 1.2TB
but why 'pvscan' say free space is zero?
why i can't move data?
how can i solve the problem?
 
don't say add another disk to the server. i had added 10 disks to it and
there is no space to plug even one.
