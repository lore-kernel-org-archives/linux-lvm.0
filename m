Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9N6qbr5004791
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 02:52:37 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9N6qLJV011064
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 02:52:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 2462486F2D
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 08:52:20 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id SeP30HkLjfGm for <linux-lvm@redhat.com>;
	Fri, 23 Oct 2009 08:52:20 +0200 (CEST)
Date: Fri, 23 Oct 2009 08:52:20 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
Message-ID: <20091023065219.GA8733@maude.comedia.it>
References: <c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Oct 21, 2009 at 03:03:24PM -0400, Lou Arnold wrote:
>I read the How-To. It doesn't talk about the specific case or being mounted
I hate how-tos, they are a collection of particular cases and leave the
luser with a feeling of knowledge. which is not.

>at root, so I had to experiment. It is likely that commands were in the
>wrong order, but I don't know what the right order is.
>I have attached the terminal session I used. In the end it did not work.

the commands were not in the wrong order,
they were just the wrong commands, unless your aim was reinstalling.

>There was still 66 GB free, and when I rebooted, the file system failed. The
>superblock was too big.
>
>I obviously don't understand the difference between pvresize, lvreduce and
>vgreduce, and how  resize2fs  is related to these commands.

I think you need to go over the basics again
LVM is used to abstract storage management
it is done by creating layers
Physical Volumes: which represent disks (or partitions, or whatever
block device...)
Volume Group: which is a collection of disks
Logical Volume: which is a portion of a volume group

LVM allows to add/remove PVs to/from a VG. Add/remove/increase/shrink
LVs in a VG.
This is done by dividing each PV in Physical Extents (PE), and then
mapping those to Logical Extenst (LE) in a LV, so a LV is composed of
chunks of disk taken from one or more PV in a VG.

When using lvm you create filesystems over logical volumes instead of
creating them on disk (or partition....)

Lvm has no knowledge of what lays over it, a logical volume
is just a block device.

The above sentence means that if you use a logical volume to host a
filesystem and want to resize the lv, you have to deal with the
filesystem yourself.
i.e.
if you enlarge a LV, you have to tell the filesystem that the space
available has increased.
if you want to reduce an LV, you have to ensure _before_ doing it that
the space removed does not contain any data.
so if you want to reduce an LV containing a filesystem you _have_ to
tell the filesystem _before_ to let that space alone. if you fail to do
this you will loose all data that was on the portion of disk you
removed, and the filesystem will still think it can use that portion of
data, until it will actually try, then sudden realization will hit like
a brick. as you just discovered.

btw, let pvresize alone, it is used only in the particular case in which
you are able to resize the disk underlying a volume group, which is
impossible for a plain disk.

L.
