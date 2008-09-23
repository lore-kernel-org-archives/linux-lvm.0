Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8N9iDpu023925
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 05:44:14 -0400
Received: from smtp1.versatel.nl (smtp1.versatel.nl [62.58.50.88])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8N9fO5g021360
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 05:41:25 -0400
Received: from [192.168.1.18] (unknown [80.101.105.201])
	by mail.vermeer.tv (Postfix) with ESMTPSA id E3B4026F1BB
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 10:40:16 +0200 (CEST)
Subject: Re: [linux-lvm] Mirrored LV
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <C6403FD1-E3EE-45EC-B294-F8C55FB07896@redhat.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com> <1221599565.6037.82.camel@localhost>
	<20080916215759.GA11670@us.ibm.com>
	<1221836810.4051.8.camel@koenws.oogziekenhuis.lan>
	<20080919173108.GA15000@us.ibm.com> <1221861679.4718.1.camel@localhost>
	<C6403FD1-E3EE-45EC-B294-F8C55FB07896@redhat.com>
Date: Tue, 23 Sep 2008 10:41:22 +0200
Message-Id: <1222159282.9690.11.camel@koenws.oogziekenhuis.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2008-09-19 at 22:39 -0500, Jonathan Brassow wrote:
> Just to answer some questions:
> 
> You can use just 2 disks to create a mirror and a disk log:
> prompt> lvcreate --alloc anywhere -m1 -L 500M -n my_lv my_vg
> I wish the allocation policy 'normal' (which is the default) would  
> also do this... but instead you must choose a looser allocation policy  
> to get what you want.

With vg_test already containing 2 equally sized PVs (one on /dev/sda,
the other on /dev/sdb), I did this:
vgextend vg_test /dev/sda6
lvconvert -m 1 vg_test/XP
(XP is a small LV with an XP image, /dev/sda6 is a small partition)
That seems to work fine:
lvs -a -o +devices
  XP                     vg_test   mwi-ao  15.00G
XP_mlog 100.00         XP_mimage_0(0),XP_mimage_1(0)                  
  [XP_mimage_0]          vg_test   iwi-ao
15.00G                                           /dev/sda4(2560)                                
  [XP_mimage_1]          vg_test   iwi-ao
15.00G                                           /dev/sdb3(0)                                   
  [XP_mlog]              vg_test   lwi-ao
4.00M                                           /dev/sda6(0) 

> The reason that you want the disk-based log is to prevent all the  
> extra work when you machine comes up.

Yes, I understand that now. It wasn't clear from the documentation that
with corelog, it would rebuild the whole mirror.

> The reason that LVM wants a separate disk for the log is so the head  
> on the storage device doesn't need to go ping-ponging around the  
> device.  (The log is touched for almost every write.)  So, its a  
> performance thing... and possibly a not-wear-out-your-hardware thing  
> too.

I see. So I guess that means that in the general case, an LVM-mirror
approach is not a good substitute for an LVM-on-RAID1 approach? My
original rationale was to have a more flexible system by using
LVM-mirror than I'd get when using LVM-on-RAID1.

What I'd expect is some way to have the log lazily cached in memory. In
that way, there is no ping-ponging, you'd only have to rebuild the
log/mirror when there is a power outage and you wouldn't have the
startup delays, i.e. something like a regular filesystem.

> It won't matter if the master disk with the log dies.  Your mirror  
> will simply become a linear device composed of the last remaining disk  
> anyway.

That makes sense, at least with two drives.

Thanks for your comments!

Koen
