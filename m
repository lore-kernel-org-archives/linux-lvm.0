Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6MIvgUm008301
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2007 14:57:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6MIvfiS025885
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2007 14:57:41 -0400
Date: Sun, 22 Jul 2007 14:57:33 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets.
	Good idea or not?
In-Reply-To: <46A38AE6.3070805@emat.be>
Message-ID: <Pine.LNX.4.44.0707221446080.990-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: forums@emat.be, LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 22 Jul 2007, js wrote:

> I'm looking into making a home brewed nas setup. This is not a 
> production, highly critical environment.
> 
> The result needs to be 1 continuous physical storage space.
> Expandable without reformating, removing data, etc,..
> Acceptable redundancy.
> I don't mind 50% loss of data capacity because of raid 1.  Storage is 
> (relatively) cheap.
> 
> I don't have this material to test.  So it's more like a theoretical setup.
...
> Now my question to you is.  Is this completely bunkers?  Or is it 
> reasonable?

This is how all our systems are setup.  It is the only reasonable way
to do raid1.  Hardware RAID is nasty when you need to add/replace disks
and the new models are bigger.

> Any tips, tricks, advice, comments welcome.

The main drawback to md raid1 is that it always resynchronizes
the *entire* partition when a disk goes offline temporarily.  I also
like to split a drive into several pieces, say split a pair of 240G into two
120G md partitions.  This gives me some flexibility to migrate partitions
between physical drives (for performance tuning, or swapping physical
drives around).  To migrate, set the mirror "faulty" with mdadm,
"hot remove" it, then "hot add" the new partition.  If you don't like
leaving the md drive unmirrored while resyncing to its new location,
reserve 3 physical drives in each md device, but use only 2.  Then
you can a 3rd mirror to migrate, then set faulty and hot remove the
old after the new is finished synchronizing.

Of course, I *hate* having to manually manage the md partitions in Linux.  I
cut my teeth on AIX LVM - which has robust useful raid1 built it.
(The latest experimental LVM mirroring in Linux still doesn't cut it.)
AIX is probably too expensive for home brew, but I understand Open Solaris
has similar features (but haven't had time to try it).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
