Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7FKaZGG028764
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 16:36:35 -0400
Received: from vms048pub.verizon.net (vms048pub.verizon.net [206.46.252.48])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7FKaXIi013433
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 16:36:33 -0400
Received: from [192.168.1.13] ([209.172.69.66])
	by vms048.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0JMU001V918BCB32@vms048.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 15 Aug 2007 15:36:13 -0500 (CDT)
Date: Wed, 15 Aug 2007 13:36:10 -0700
From: Lothar Werzinger <lothar@tradescape.biz>
Subject: Re: [linux-lvm] Is this possible with LVM?
In-reply-to: <46C35F9A.60604@redhat.com>
Message-id: <200708151336.11249.lothar@tradescape.biz>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
References: <200708151303.33774.lothar@tradescape.biz>
	<46C35F9A.60604@redhat.com>
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

On Wednesday 15 August 2007 13:18, Bryn M. Reeves wrote:
> Lothar Werzinger wrote:
> > What I would like to do is to unmount LV2 and be able to remove the
> > external disk from the Ultrabay to replace it with a DVD drive while
> > still be able to acess the filesystem on LV1 (which uses only space on
> > the internal disk). I would like to do this to backup data from LV1 to
> > DVD-RW.
> >
> > Is this possible with LVM? How would I go and prepare the external disk
> > for removal? How would I reconnect if I insert the disk again.
>
> It is possible, but not with both PVs in the same VG (well, not unless
> you want to be doing a lot of manual tweaking and fiddling as you
> plug/unplug the external drive and even then you would need to be
> extremely careful when changing/resizing LVs - basically, don't! :).
>
> If you put LV2 in its own VG then you can achieve exactly what you
> describe via:
>
> umount /path/to/LV2
> vgchange -an VG2
>
> Then remove the external disk. Optionally, you could mark the VG as
> exported with vgexport if you wanted to move it between different hosts.
>
> To re-activate it, plug it back in and re-activate it:
>
> vgchange -ay VG2
>
> Preceding that with a vgimport if you did choose to export the VG.
>
> Depending on the versions of the tools you are using and they way you
> configured the physical volumes when you set them up you can probably
> break the VG up using vgsplit.

I read the manpage to vgsplit and I am lost :-(
Can two VGs use the same PV? How do they know how to share the space?

can you give an example on how I might use vgsplit?

Here's the version I used:
vgcreate --version
  LVM version:     2.02.26 (2007-06-15)
  Library version: 1.02.20 (2007-06-15)
  Driver version:  4.11.0

> Kind regards,
> Bryn.

Lothar
