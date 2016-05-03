Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43Dhx5j018562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 09:43:59 -0400
Received: from nm22-vm0.bullet.mail.ne1.yahoo.com
	(nm22-vm0.bullet.mail.ne1.yahoo.com [98.138.91.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB0BF85545
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 13:43:58 +0000 (UTC)
Date: Tue, 3 May 2016 13:43:57 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1093625508.5537728.1462283037119.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1093625508.5537728.1462283037119.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] about the lying nature of thin
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Xen wrote:

> I didn't know thin (or LVM) doesn't maintain maps of used blocks.

Right, so you're ignorant of basics like how the various subsystems work. Like I said, go find a text on OS and filesystem design. Hell, read the EXT and LVM code or even just the design docs.

> The recent DISCARD improvements apparently just signal some special case 
> (?) but SSDs DO maintain maps or it wouldn't even work (?).

Again, read up on the inner workings of SSDs. To over-simplify, SSDs have their own "LVM". No different really than a hardware RAID controller does - admittedly most raid controllers don't do anything particularly advanced.

> I don't know, it would seem that having a map of used extents in a thin 
> pool is in some way deeply important in being able to allocate unused 
> ones?

clearly you are in need of much more studying. LVM knows exactly out of all of it's defined extents which ones are free and which ones have been assigned to an LV - aka written to. What individual blocks (aka range of bytes) inside those extents have FS-managed data in them it knows not nor does it care.
 
> I guess continuous polling would be deeply disrespectful of the hardware 
> and software resources.

Not to mention instantaneously invalid. So you poll LVM, "what is your allocation map and do you have any free extents?" You get the results. Then the FS having been assured there is free space issues writes. But oh no, in the round-trip some other LV has grabbed the extent you had intended to use! IO=FAIL.

The ONLY way for a FS to "reserve" a set of blocks (aka extent) to itself is to write to it - but mind the FS has NO IDEA if needs to do an reservation in the first place nor if this IO just so happens to fit inside the allocated range but the next IO at offset +1 will require a new extent to be allocated from the THINP.

I haven't checked, but it's perfectly possible for LVM THINP to respond to FS issued DISCARD notices and thus build an allocation map of an extent. And should an extent be fully empty to return the extent to the thin pool. Only to have to allocate a new extent if any IO hits the same block range in the future. This kind of extent churn is probably not very useful unless your workload is in the habit of writing tons of data, freeing it and waiting a reasonable amount of time and potentially doing it again. SSDs resort to it because they must - it's the nature of the silicon device itself.

> It would say to a filesystem: these regions are currently unavailable.
>
> You would even get more flags:
> 
> - this region is entirely unavailable
> - this region is now more expensive to allocate to
> - this region is the preferred place

All of this "inside knowledge" and "coordination" you so desperately seem to want is called integration. And again spelled BTRFS and ZFS. et. al. 
 
> In the theoretical system I proposed it would be a constant

yeah, have fun with that theoretical system.

...

Xen, dude seriously. Go do a LOT more reading.
