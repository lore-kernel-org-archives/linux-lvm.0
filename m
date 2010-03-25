Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2PCsqfU013541
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2010 08:54:53 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2PCsc4t032420
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2010 08:54:39 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id F2EA21A739
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2010 13:54:31 +0100 (CET)
Message-ID: <BCCA5923972740C7A167865BABE25FDB@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <4BA3BEBE.2010204@cfl.rr.com>
	<20100319192537.GA7345@redhat.com><4BA3EC26.7000302@cfl.rr.com>
	<20100319222156.GE7345@redhat.com>
Date: Thu, 25 Mar 2010 13:54:39 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Called while suspended
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

I'm in the progress of switching a WD15EADS-00P8B0 disk to a  Samsung F2 
1.5TB drive because of all the reouble associated with the WD drives 
regarding 4kb block, system freeze and poor performance.

I unmounted the VG and began doing a pvmove.

At first it went well but after 30-40% done it began complaining big time.

**** snip****

 WARNING: dev_open(/dev/hdb2) called while suspended
  WARNING: dev_open(/dev/hdb3) called while suspended
  WARNING: dev_open(/dev/hdb4) called while suspended
  /dev/sdc1: Moved: 40.8%
  WARNING: dev_open(/dev/sdc1) called while suspended
  WARNING: dev_open(/dev/hda1) called while suspended
  WARNING: dev_open(/dev/hda2) called while suspended
  WARNING: dev_open(/dev/hda3) called while suspended
  WARNING: dev_open(/dev/hda4) called while suspended
  WARNING: dev_open(/dev/sdb1) called while suspended
  WARNING: dev_open(/dev/sdd1) called while suspended
  WARNING: dev_open(/dev/sde) called while suspended
  WARNING: dev_open(/dev/hdb1) called while suspended
  WARNING: dev_open(/dev/hdb2) called while suspended
  WARNING: dev_open(/dev/hdb3) called while suspended
  WARNING: dev_open(/dev/hdb4) called while suspended
  WARNING: dev_open(/dev/sdc1) called while suspended
  WARNING: dev_open(/dev/sdc1) called while suspended
  WARNING: dev_open(/dev/hda1) called while suspended
  WARNING: dev_open(/dev/hda2) called while suspended
  WARNING: dev_open(/dev/hda3) called while suspended
  WARNING: dev_open(/dev/hda4) called while suspended
  WARNING: dev_open(/dev/sdb1) called while suspended
  WARNING: dev_open(/dev/sdb1) called while suspended
  WARNING: dev_open(/dev/sdd1) called while suspended
  WARNING: dev_open(/dev/sde) called while suspended
  WARNING: dev_open(/dev/hdb1) called while suspended
  WARNING: dev_open(/dev/hdb2) called while suspended
  WARNING: dev_open(/dev/hdb3) called while suspended
  WARNING: dev_open(/dev/hdb4) called while suspended
  WARNING: dev_open(/dev/sdc1) called while suspended
  WARNING: dev_open(/dev/hda1) called while suspended
  WARNING: dev_open(/dev/hda2) called while suspended
  WARNING: dev_open(/dev/hda3) called while suspended
  WARNING: dev_open(/dev/hda4) called while suspended
  WARNING: dev_open(/dev/sdb1) called while suspended
  WARNING: dev_open(/dev/sdd1) called while suspended
  WARNING: dev_open(/dev/sde) called while suspended
  WARNING: dev_open(/dev/hdb1) called while suspended
  WARNING: dev_open(/dev/hdb2) called while suspended
  WARNING: dev_open(/dev/hdb3) called while suspended
  WARNING: dev_open(/dev/hdb4) called while suspended
  /dev/sdc1: Moved: 40.9%
  WARNING: dev_open(/dev/sdc1) called while suspended
  WARNING: dev_open(/dev/hda1) called while suspended
  WARNING: dev_open(/dev/hda2) called while suspended

**** snip***

What is happening here and should i be worried the data will be lost? I'm 
not very good at LVM so I'm very worried right now.

Thanks for any input on this

/Fredrik Skog
