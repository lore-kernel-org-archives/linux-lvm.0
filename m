Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r69JJLoF016597
	for <linux-lvm@redhat.com>; Tue, 9 Jul 2013 15:19:21 -0400
Received: from nm25-vm2.access.bullet.mail.bf1.yahoo.com
	(nm25-vm2.access.bullet.mail.bf1.yahoo.com [216.109.115.193])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r69JJKfJ021854
	for <linux-lvm@redhat.com>; Tue, 9 Jul 2013 15:19:20 -0400
Message-ID: <1373397559.87661.YahooMailBasic@web181501.mail.ne1.yahoo.com>
Date: Tue, 9 Jul 2013 12:19:19 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <51DBF2D3.4010009@mglug.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 + "--type raid1" better than md-Raid + lvm?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

>  it is better using two lvm-disks with --type=raid1 option or is it the
> same quality like creating a raid1-device (via mdadm) and
> putting a lvm2 on it?

I think most people go with the latter. Though of course the former gives you much more flexibility in how you assemble raid sets.

I was playing with a script to build 3Par-like (and I use that term loosely) RAID arrays out of scattered extents from a pool (say 16) disks in a volume group and optionally across multiple such volume groups. LVM in this case was used for "soft partition" sizing of the individual MD components, and then of course you can layer LVM on top of the MD device for end-user consumption. The idea being RAID rebuild was a distributed matter and the impact would be spread across a lot of spindles instead of causing a very concentrated heat map.
