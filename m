Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8AEPl7A020058
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 10:25:47 -0400
Received: from vwclub.ro (lcx.at [88.198.217.75])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8AEPgGH020809
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 10:25:43 -0400
Received: from [192.168.0.208] (dtc2.mx2.lcx.at [213.143.120.142])
	by vwclub.ro (Postfix) with ESMTP id AC2BC55936B
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 16:26:25 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Message-Id: <9C7FE4B9-DDE4-4A85-A96D-4953E9F545A2@livadaru.net>
From: Cristian Livadaru <cristian@livadaru.net>
Date: Sun, 10 Sep 2006 16:25:32 +0200
Subject: [linux-lvm] huge performance problems 25kb/s write speed
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

I have since yesterday huge performance problems on my LVM!
I have 2x 300GB as 1 unstriped LVM.

dd if=/dev/zero of=dd.txt count=500
500+0 records in
500+0 records out
256000 bytes transferred in 9.999764 seconds (25601 bytes/sec)

dd if=/dev/zero of=dd.txt count=500 bs=4096
500+0 records in
500+0 records out
2048000 bytes transferred in 10.020213 seconds (204387 bytes/sec)

After a reboot it worked normal again for a while, now I have the  
same problem again.

esplendidos:~# pvs
   PV         VG      Fmt  Attr PSize   PFree
   /dev/hde1  sharevg lvm2 a-   279.45G      0
   /dev/hdg1  sharevg lvm2 a-   279.45G   4.00M

esplendidos:~# lvs
   LV         VG      Attr   LSize   Origin Snap%  Move Copy%
   sharelv    sharevg -wi-ao 558.90G

esplendidos:~# vgs
   VG      #PV #LV #SN Attr  VSize   VFree
   sharevg   2   1   0 wz--n 558.91G   4.00M


   --- Volume group ---
   VG Name               sharevg
   System ID
   Format                lvm2
   Metadata Areas        2
   Metadata Sequence No  2
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                1
   Open LV               1
   Max PV                0
   Cur PV                2
   Act PV                2
   VG Size               558.91 GB
   PE Size               4.00 MB
   Total PE              143080
   Alloc PE / Size       143079 / 558.90 GB
   Free  PE / Size       1 / 4.00 MB
   VG UUID               LaGWNF-9Ace-li4f-h8z2-SJYk-YeyB-joXznp


   --- Logical volume ---
   LV Name                /dev/sharevg/sharelv
   VG Name                sharevg
   LV UUID                zCe6sI-pglI-7yh1-EnL4-gsKo-FOEb-POyVoL
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                558.90 GB
   Current LE             143079
   Segments               2
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:8

   --- Physical volume ---
   PV Name               /dev/hde1
   VG Name               sharevg
   PV Size               279.45 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              71540
   Free PE               0
   Allocated PE          71540
   PV UUID               g3jfAR-Z2Ka-SCgr-08QB-8WBn-5g4h-jXLrn1

   --- Physical volume ---
   PV Name               /dev/hdg1
   VG Name               sharevg
   PV Size               279.45 GB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              71540
   Free PE               1
   Allocated PE          71539
   PV UUID               kYQB4j-fYV9-3NUa-g0Sg-H4Bk-Kx5F-wRO9G1


hdparm -tT /dev/hde

/dev/hde:
Timing cached reads:   952 MB in  2.00 seconds = 476.00 MB/sec
Timing buffered disk reads:  130 MB in  3.00 seconds =  43.33 MB/sec
esplendidos:/shared# hdparm -tT /dev/hdg

/dev/hdg:
Timing cached reads:   960 MB in  2.00 seconds = 480.00 MB/sec
Timing buffered disk reads:  154 MB in  3.01 seconds =  51.16 MB/sec


I don't have any errors in logfiles ( syslog/messages/lvm2.log )
Any hints what else I can check or do to improve performance? I mean  
25kb/s on a local HD is more then just slow!
Please please help.


--
Cristian Livadaru
http://livadaru.net
