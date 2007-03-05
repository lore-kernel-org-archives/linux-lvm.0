Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25KQRtn014110
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 15:26:27 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l25KQIq4010180
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 15:26:19 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l25KQ3lZ022955
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 15:26:03 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l25KQ3LY025441
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 15:26:03 -0500
Date: Mon, 5 Mar 2007 15:26:03 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0703051516200.25210-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] PV marked "NOT available" ondisk only!
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

I'm beginning to find my way around the internals of LVM1.  But I am still 
mystified by this situation.  PV3 (/dev/md3) is active and running 
according to /proc

  [root@cmslax lvm]# cat /proc/lvm/VGs/rootvg/PVs/md3
  name:         /dev/md3
  size:         35374848
  status:       1
  number:       3
  allocatable:  2
  LV current:   0
  PE size:      32768
  PE total:     538
  PE allocated: 57
  device:       09:03
  uuid:         YfvI-pix3-CgxK-rRj1-T2Gu-tzu1-tpsl-8t01

I can read md3 just fine.  So can vgck:

  [root@cmslax lvm]# vgck -v
  vgck -- locking logical volume manager
  vgck -- finding all volume group(s)
  vgck -- checking volume group name "rootvg"
  vgck -- checking existence of volume group "rootvg"
  vgck -- reading volume group data for "rootvg" from lvmtab
  vgck -- checking volume group consistency  of "rootvg" in lvmtab
  vgck -- VGDA of "rootvg" in lvmtab is consistent
  vgck -- reading volume group data for "rootvg" from physical volume(s)
  vgck -- checking volume group consistency  of "rootvg" on physical volumes
  vgck -- VGDA of "rootvg" on physical volumes is consistent
  vgck -- unlocking logical volume manager

So can vgdisplay -D.  Here is a diff of vgdisplay -v  with/without -D:

4c4
< VG Status             NOT available/resizable
---
> VG Status             available/resizable
8c8
< Open LV               0
---
> Open LV               9
26c26
< # open                 0
---
> # open                 1
...
185c185
< PV Status             NOT available / allocatable
---
> PV Status             available / allocatable

Why does the ondisk metadata for md3 get set to NOT available?  If
LVM was able to write the flag to md3, how could it not be
available?  Where is the flag?  Can I patch it by hand?  Why does
vgck not complain about the NOT available PV?  (Perhaps because it
is reading from lvmtab.d to enumerate PVs?)  vgscan *does* complain,
and truncates lvmtab.d/rootvg.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
