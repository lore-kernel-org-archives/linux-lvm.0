Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j33JcHO21653
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 15:38:17 -0400
Received: from pd4mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j33Jc9L6009211
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 15:38:10 -0400
Received: from pd2mr3so.prod.shaw.ca
	(pd2mr3so-qfe3.prod.shaw.ca [10.0.141.108]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0IED00H2CYJLGP8P@l-daemon> for linux-lvm@redhat.com; Sun,
	03 Apr 2005 13:38:09 -0600 (MDT)
Received: from pn2ml10so.prod.shaw.ca ([10.0.121.80])
	by pd2mr3so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IED002QTYJLJYF0@pd2mr3so.prod.shaw.ca> for
	linux-lvm@redhat.com; Sun, 03 Apr 2005 13:38:09 -0600 (MDT)
Received: from [192.168.1.124]
	(S01060050ba84447c.vc.shawcable.net [24.86.200.241])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0IED00E48YJK15@l-daemon> for linux-lvm@redhat.com; Sun,
	03 Apr 2005 13:38:09 -0600 (MDT)
Date: Sun, 03 Apr 2005 11:38:16 -0800
From: Terry Rigby <t-rigby@shaw.ca>
Subject: Re: [linux-lvm] LVM Error
In-reply-to: <20050403191940.GO14307@agk.surrey.redhat.com>
Message-id: <200504031238.16673.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
References: <200504031040.05910.t-rigby@shaw.ca>
	<200504031046.00394.t-rigby@shaw.ca>
	<20050403191940.GO14307@agk.surrey.redhat.com>
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

I am using lvm2.
PV is /dev/hdd
no partition table exists.

I did figure out the problem though.  I had a symlink to /dev/hdd and I think 
that was causing some issues.  I removed that symlink and all the PV's 
display properly now.  My next issue is this..

fileserver:~# vgchange -a y 4474
  Volume group 4474 metadata is inconsistent
  Volume group for uuid not found: 
lIoGSWjLzjHDN61mdY0yqVbilyBU9xzFSoVzKiy750swPFxT8D0ijXGNAi3FddlG
  0 logical volume(s) in volume group "4474" now active

:(
hehe, next...

Terry Rigby

On April 3, 2005 12:19 pm, Alasdair G Kergon wrote:
> On Sun, Apr 03, 2005 at 09:46:00AM -0800, Terry Rigby wrote:
> > > http://ultimate.kicks-ass.net/files/lvm.txt
>
>   PV /dev/hda2        VG 4474   lvm2 [18.18 GB / 0    free]
>   PV /dev/hdc         VG 4474   lvm2 [74.53 GB / 0    free]
>   PV /dev/hdb         VG 4474   lvm2 [74.53 GB / 0    free]
>   PV unknown device   VG 4474   lvm2 [74.53 GB / 0    free]
>
> Which version of LVM2?
> Try upgrading it to at least 2.00.33.
>
> Does hdd have a partition table on it (even an empty one)?
> Is the PV meant to be hdd or hdd1?
> If the PV is genuinely hdd not hdd1 and there's a partition
> table, try removing it.
>
> Alasdair
