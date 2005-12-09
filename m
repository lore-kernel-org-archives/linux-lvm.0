Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9GbKV16855
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 11:37:20 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jB9GbFSQ000309
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 11:37:18 -0500
Received: from mnementh.dragonhold.org ([80.229.192.21] ident=www-data)
	by ramoth.dragonhold.org with esmtp (Exim 4.50) id 1EklEz-0004QP-90
	for linux-lvm@redhat.com; Fri, 09 Dec 2005 16:37:01 +0000
Message-ID: <8777.208.178.77.200.1134146221.squirrel@mnementh.dragonhold.org>
In-Reply-To: <439620CE.1030902@ee.duth.gr>
References: <439620CE.1030902@ee.duth.gr>
Date: Fri, 9 Dec 2005 16:37:01 -0000 (GMT)
Subject: Re: [linux-lvm] If one disk fails i loose everything?
From: gwood@dragonhold.org
MIME-Version: 1.0
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

In the answers below I've taken 'one linear volume group' to actually mean
'one linear volume using all the space in the volume group'.  If this is
not what you meant, can you please describe your setup?

>   1. If one hard disk fails (hardware) do I loose all the data stored on
>   the VG?
I'm not sure where you searched, but the answer to this is a fundamental
characteristic of RAID0 - there is no redundancy.  If you have a concat
(rather than a stripe), then you /might/ be able to salvage /some/ data -
but the chances are pretty slim that you'll get anything sane back out of
it, and you're going to have to do some relatively low level stuff to do
even that I would have thought.

>   2. Can I add a new hard disk in the VG without having to format it
>   before? (I mean if it is full of data can I just add it?)
Not easily using LVM on linux, no.  If it already has partitions on it,
then the layout of the data on the drive is incorrect for LVM.  There may
be tools out there to overlay the required metadata, but the underlying
partitions will have to reduce in size, so this would require the
filesystems to support being shrunk.

>   3. In case of failure can I recover the data from a single disk on
>   another box?
What sort of failure?  Any VG that has enough drives to provide you with a
working volume group/volume can be imported to another machine and read. 
So if you have 3 volumes over the VG, and only one of them doesn't have a
complete set of blocks on it - the other 2 can be salvaged.  In the case
of the arrangement you're talking about, no.

If you need to be able to recover the data, then a simple linear volume
(with no redundancy) is not a good idea.

(In answer to the subject line, 'with the arrangement you're talking
about' - YES')
