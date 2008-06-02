Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m52GRoGS003908
	for <linux-lvm@redhat.com>; Mon, 2 Jun 2008 12:27:50 -0400
Received: from v-mailgw.milnet.lan (mailgw.milnet.ch [193.47.190.37])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m52GRdFt013237
	for <linux-lvm@redhat.com>; Mon, 2 Jun 2008 12:27:40 -0400
Received: from v-mailgw.milnet.lan (localhost [192.168.193.37])
	by v-mailgw-despam.milnet.lan (Postfix) with ESMTP id 5A3C719C0C1
	for <linux-lvm@redhat.com>; Mon,  2 Jun 2008 18:27:33 +0200 (CEST)
Received: from v-mailgw.milnet.lan (localhost [192.168.193.37])
	by v-mailgw-clamav.milnet.lan (Postfix) with ESMTP id 4348E19C0C6
	for <linux-lvm@redhat.com>; Mon,  2 Jun 2008 18:27:33 +0200 (CEST)
Received: from groupwise.milnet.lan (groupwise.milnet.lan [192.168.193.18])
	by v-mailgw.milnet.lan (Postfix) with ESMTP id 30F2219C0C1
	for <linux-lvm@redhat.com>; Mon,  2 Jun 2008 18:27:30 +0200 (CEST)
Message-Id: <48443B86.DB9C.0010.0@milprog.ch>
Date: Mon, 02 Jun 2008 18:27:19 +0200
From: "Marcel Gsteiger" <Marcel.Gsteiger@milprog.ch>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Can't get rid of INACTIVE read/write snapshot
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

Hi all

I'm using lvm2-2.01.08-2.1 on fc4, kernel 2.6.16-1 with linux-vserver patches.

A while ago, I mistakenly created a 39GB read-write snapshot of my /vservers partition (which, btw, seemed to work). But after some time this partition got to an overflow and since then I can't get rid of it anymore. See the lvdisplay output below.

lvchange -an or --refresh gives me a message "Can't change snapshot logical volume "vservers_snapshot"".

lvremove lets me wait, then "top" shows 100% IO-Wait but does not come to an end (at least after an hour). I don't know how much patience I would need, this box is rather fast otherwise (dual xeon 2.8GHz w/ SATA drives).

Rebooting does not help anything.

Is there a safe way to simply get rid of this snapshot? Any help would much be appreciated.

Regards
--Marcel

 --- Logical volume ---
  LV Name                /dev/vg00/lv00_vservers
  VG Name                vg00
  LV UUID                9oELP3-2l7d-gTML-2xg2-unTu-znP0-qVd3Mc
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/vg00/vservers_snapshot [INACTIVE]
  LV Status              available
  # open                 1
  LV Size                39,06 GB
  Current LE             625
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0
  Block device           253:9
   
  --- Logical volume ---
  LV Name                /dev/vg00/vservers_snapshot
  VG Name                vg00
  LV UUID                cQEj3z-V2jD-QOCl-3Yea-ETQZ-Egj9-2B7nd2
  LV Write Access        read/write
  LV snapshot status     INACTIVE destination for /dev/vg00/lv00_vservers
  LV Status              available
  # open                 0
  LV Size                39,06 GB
  Current LE             625
  Segments               1
  Snapshot chunk size    4,00 KB
  Allocated to snapshot  100,00% 
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:8
