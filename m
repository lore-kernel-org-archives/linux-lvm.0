Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j59AjEO23502
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 06:45:14 -0400
Received: from baghus1.baghus.net (mail@ns.baghus.net [62.245.167.30])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j59Aj6qs010076
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 06:45:06 -0400
Received: from [192.168.1.254] (helo=bagex01.BAGHUS-LAN.NET)
	by baghus1.baghus.net with esmtp (Exim 3.35 #1 (Debian))
	id 1DgKX3-0007QF-00
	for <linux-lvm@redhat.com>; Thu, 09 Jun 2005 12:45:05 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] lvcreate goes into deep-sleep while creating an
	xfssnapshot
Date: Thu, 9 Jun 2005 12:41:22 +0200
Message-ID: <6A58CFF91886D54BBDA1FE988C4DF79D025069@bagex01.baghus-lan.net>
From: "Sven Riedel" <sr@baghus.net>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

> The HOWTO is way old, 
I wouldn't consider 10/2004 way old. If it's way old, I'm 
ancient ;)

But seriously, that part of the howto should be updated then.
I'm not the first nor will I be the last to run into that
snag.

> with LVM2 the XFS filesystem is 'frozen' 
> automaticly on the mount -onouuid,ro ( not quite sure, but 
> probably also 
> for LVM1 ..., think it's in the XFS code ).
> So, forget xfs_freeze. 
Yes, after posting I found a corresponding entry in debians
bug tracking system. Issueing xfs_freeze -u /filesystem 
will make everything to back to normal.

> It's freezing your box, not your filesystems.
Freezing the lvm processes, the box itself was still responsive.

Regs,
Sven
