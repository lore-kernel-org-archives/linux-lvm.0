Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j33KIsO27549
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 16:18:54 -0400
Received: from pd3mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j33KImX5013577
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 16:18:48 -0400
Received: from pd3mr7so.prod.shaw.ca (pd3mr7so-qfe3.prod.shaw.ca [10.0.141.23])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0IEE003JS0FBKD20@l-daemon> for linux-lvm@redhat.com; Sun,
	03 Apr 2005 14:18:47 -0600 (MDT)
Received: from pn2ml10so.prod.shaw.ca ([10.0.121.80])
	by pd3mr7so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IEE00FV50FBW6E0@pd3mr7so.prod.shaw.ca> for
	linux-lvm@redhat.com; Sun, 03 Apr 2005 14:18:47 -0600 (MDT)
Received: from [192.168.1.124]
	(S01060050ba84447c.vc.shawcable.net [24.86.200.241])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0IEE00B320FB9H@l-daemon> for linux-lvm@redhat.com; Sun,
	03 Apr 2005 14:18:47 -0600 (MDT)
Date: Sun, 03 Apr 2005 12:18:55 -0800
From: Terry Rigby <t-rigby@shaw.ca>
Subject: Re: [linux-lvm] LVM Error
In-reply-to: <200504031313.39260.t-rigby@shaw.ca>
Message-id: <200504031318.55164.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
References: <200504031040.05910.t-rigby@shaw.ca>
	<20050403195141.GR14307@agk.surrey.redhat.com>
	<200504031313.39260.t-rigby@shaw.ca>
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

one more thing I just noticed...

fileserver:~# vgscan -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Wiping cache of LVM-capable devices
      /dev/4474.old/storage: stat failed: No such file or directory
      /dev/cdrom: stat failed: No such file or directory
    Wiping internal cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
      /dev/hda: No label detected
      /dev/hdc: lvm2 label detected
      /dev/hdc1: No label detected
      /dev/hda2: lvm2 label detected
      /dev/hda5: No label detected
      /dev/hda6: No label detected
      /dev/hda7: No label detected
      /dev/hdb: lvm2 label detected
      /dev/hdd: lvm2 label detected
      /dev/hdb1: No label detected
      Locking /var/lock/lvm/V_4474 RB
    Finding volume group "4474"
      /dev/hda2: lvm2 label detected
      /dev/hdc: lvm2 label detected
      /dev/hdb: lvm2 label detected
      /dev/hdd: lvm2 label detected
      /dev/hda2: lvm2 label detected
      /dev/hdc: lvm2 label detected
      /dev/hdb: lvm2 label detected
      /dev/hdd: lvm2 label detected
      /dev/hda2: lvm2 label detected
      /dev/hdc: lvm2 label detected
      /dev/hdb: lvm2 label detected
      /dev/hdd: lvm2 label detected
  Found volume group "4474" using metadata type lvm2
      Unlocking /var/lock/lvm/V_4474

the two lines      " /dev/4474.old/storage: stat failed: No such file or 
directory" and   " /dev/cdrom: stat failed: No such file or directory"
I find curious.  This could be nothing but then again, maybe it is.  I am 
really too new to LVM to know.

Terry Rigby
