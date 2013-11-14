Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rAE9FGnY007496
	for <linux-lvm@redhat.com>; Thu, 14 Nov 2013 04:15:16 -0500
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAE9FENK021977
	for <linux-lvm@redhat.com>; Thu, 14 Nov 2013 04:15:14 -0500
Received: by mail-oa0-f44.google.com with SMTP id l6so1904110oag.31
	for <linux-lvm@redhat.com>; Thu, 14 Nov 2013 01:15:14 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 14 Nov 2013 17:15:14 +0800
Message-ID: <CAHuLeSmvxHVwKoDzs04N1fWNskwVGy9cYBeX3fm_tE5c2CimRQ@mail.gmail.com>
From: Justin Lee <justinlee5455@gmail.com>
Subject: [linux-lvm] So LVM mirroring is synchronous or asynchronous....?
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

Hello,

I'm confused, the more I google, the more conflicting information I get

*** In this discussion
<http://serverfault.com/questions/76417/lazy-disk-backup-for-a-ramdisk-on-linux>
says its asynchronous:

">    I want something like a write cache that drains only when the
>    system isn't busy.
>
>    For a particular build I'm doing often, I would like to keep build
>    output in a ramdisk that eventually gets written out to disk. It
>    would be nice if the ramdisk was synced out to disk when the
>    system wasn't busy.

you might be able to get away with using an LVM mirror to complete this process.

1. Make the ramdisk a member of a volume group with a physical drive.
2. Mirror the ramdisk to your hard drive. Note that LVM mirrors are
direction-specific, i.e. data flows from one PV to another
unidirectionally.
3. Mount the LVM volume somewhere as a unified filesystem.

Data are written to the LVM-based ramdisk. Unlike a RAID-1 where the
writes are synchronous and parallel (both drives write out at once),
an LVM mirror is asynchronous and sequential (the primary drive
receives the write, then LVM pushes the write to the mirror)."

*** this link <http://osdir.com/ml/linux-lvm/2009-07/msg00092.html>
says its synchronous:

">    Hi,
>    I have a few questions concerning LVM mirror implementation, and I
>    couldn't find any suitable design doc
>    I need to setup a dual site ( a few miles between the 2 sites, around 1 ms
>    RTD) mirror based cluster system.

You need asynchronous mirroring (remote replication module).

>    - *what is the default behaviour of the mirroring, writing in parallel to
>    both mirror legs or serialized ?

It writes in parallel.

>    - for write requests, is the ack returned to the application
>    when the 2 legs are updated or only when the first is updated ?

When two are updated. (you need 'remote replication' module for the
latter behaviour) I couldn't find suitable doc about this, and in fact
that's the behaviour I'm expecting (acking only when the 2 legs are up
to date) . "

Any idea??

Justin
