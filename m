Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6NEMXr4020107
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 10:22:33 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6NEMVWN026421
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 10:22:31 -0400
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q6NEMTVJ027032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 10:22:30 -0400
Message-ID: <500D5E25.8050004@bmsi.com>
Date: Mon, 23 Jul 2012 10:22:29 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <CALVifsbrDh=CmFoAegg1Q-E6maNGaCPRugmGONkr+wg045xH_w@mail.gmail.com>
In-Reply-To: <CALVifsbrDh=CmFoAegg1Q-E6maNGaCPRugmGONkr+wg045xH_w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM2 snapshotting and new blocks
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
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 07/23/2012 09:27 AM, Fred van
Zwieten would write:
> I have a question. I am used to the NetApp snapshotting
> implementation. These are what I call "new block" aware. This means a
> block is only held in a snapshot when the changed block was already in
> use. This means when new blocks are written they will not get snapped.
> This is a great feature.
>
> I have done some tests with LVM2 snapshots on Fedora17 and this seems
> not to be the case in the LVM2 implementation. Can someone confirm
> this?
>
No need for any tests.  That feature requires detailed knowledge of the
filesystem in use.  LVM is filesystem agnostic, and doesn't care what
kind of filesystem you put on your logical volumes. 

Btrfs provides snapsnots with the feature you want - but, of course, you
have to use the btrfs filesystem.

There is a tradeoff.  Being filesystem agnostic means that *any*
filesystem, including one that you just invented and are currently
developing, works.  But there are certainly efficiency gains to be had
from knowledge of and cooperation with the filesystem.

That said, there is currently the DISCARD API, which lets filesystems
tell the underlying block device (including LVM) that we don't care
about a block anymore (which makes for more efficient recycling on flash
devices among other things).

1) can the "new block" feature be implemented by having a filesystem
DISCARDing a block before writing it the first time?

2) failing that, would a NEWBLOCK API that filesystems could use make sense?
