Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2N28VO22633
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2005 21:08:31 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.207])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2N28VbH022524
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2005 21:08:31 -0500
Received: by rproxy.gmail.com with SMTP id 40so185792rnz
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2005 18:08:31 -0800 (PST)
Message-ID: <e5146c2a050322180870063741@mail.gmail.com>
Date: Tue, 22 Mar 2005 21:08:31 -0500
From: Sasha Z <kleptophobiac@gmail.com>
Subject: Re: [linux-lvm] Can't restore the volume group after ghosting an hdd
In-Reply-To: <20050322232617.GR19749@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <e5146c2a05032215124af3c0d7@mail.gmail.com>
	<20050322232617.GR19749@agk.surrey.redhat.com>
Reply-To: Sasha Z <kleptophobiac@gmail.com>,
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
To: Sasha Z <kleptophobiac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Oh confound it!

I cleaned off a bunch of junk on my array to reduce total usage to two
drives. I pvmoved the other two drives and reduced the logical volume.
Then I reduced the volume group to eliminate those two drives. I went
to resize the reiserfs, but here's what I get:

[root@fileserver archive]# resize_reiserfs /dev/vg0/lv0
resize_reiserfs 3.6.19 (2003 www.namesys.com)

bread: Cannot read the block (2): (Invalid argument).
reiserfs_open: bread failed reading block 2
bread: Cannot read the block (16): (Invalid argument).
reiserfs_open: bread failed reading block 16

reiserfs_open: the reiserfs superblock cannot be found on /dev/vg0/lv0.

but

  PV         VG   Fmt  Attr PSize   PFree
  /dev/hde4  vg0  lvm2 a-   179.75G      0
  /dev/hdg1       lvm2 --   172.55G 172.55G
  /dev/hdi        lvm2 --   152.67G 152.67G
  /dev/hdk1  vg0  lvm2 a-   233.76G  37.81G

and again:

  VG   #PV #LV #SN Attr  VSize   VFree
  vg0    2   1   0 wz--n 413.51G 37.81G

and finally:

  LV   VG   Attr   LSize   Origin Snap%  Move Copy%
  lv0  vg0  -wi-s- 375.70G

What caused this to die? Just after I got DVD-R's too! :(
