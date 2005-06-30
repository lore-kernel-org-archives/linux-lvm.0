Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5ULb1u06973
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 17:37:01 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5ULarqi024706
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 17:36:54 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:HPz9fNdUjSfYsGuPs8o1R9A4V9l5ORFy@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j5ULalSa005540
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 17:36:48 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:Z0nIC6zTYBMcIZ8WszzfukeYKk4z3OUa@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j5ULalMl022614
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 17:36:47 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j5ULalpu022610
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 17:36:47 -0400
Date: Thu, 30 Jun 2005 17:36:47 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Message-ID: <Pine.LNX.4.44.0506301735180.21204-100000@algiers.clic.cs.columbia.edu>
MIME-Version: 1.0
Subject: [linux-lvm] LV Status: NOT available?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm trying to recover my file system, and I was able to recreate the PV
and run vgcfgrestore succesfully, but the LV status is 'NOT available'.
Why would this be?  

blade01:root # lvs
  LV      VG         Attr   LSize   Origin Snap%  Move Log Copy%
  home_lv big_cheese -wi--- 195.31G
  proj_lv big_cheese -wi--- 195.31G
  zap_lv  big_cheese -wi---  78.12G

blade01:root # lvdisplay
  --- Logical volume ---
  LV Name                /dev/big_cheese/proj_lv
  VG Name                big_cheese
  LV UUID                lIuJg1-ktEe-02A1-6VtC-uW5n-qIA4-wX4edP
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                195.31 GB
  Current LE             50000
  Segments               1
  Allocation             inherit
  Read ahead sectors     0

  --- Logical volume ---
  LV Name                /dev/big_cheese/home_lv
  VG Name                big_cheese
  LV UUID                NJH2DO-wn2A-Xxs7-P3DV-skEf-v4ly-s1LVbw
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                195.31 GB
  Current LE             50000
  Segments               1
  Allocation             inherit
  Read ahead sectors     0

  --- Logical volume ---
  LV Name                /dev/big_cheese/zap_lv
  VG Name                big_cheese
  LV UUID                wqAlDs-HwGs-vAY0-CL5n-G9zW-5i4x-ux8wXk
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                78.12 GB
  Current LE             20000
  Segments               2
  Allocation             inherit
  Read ahead sectors     0



regards,
dan
