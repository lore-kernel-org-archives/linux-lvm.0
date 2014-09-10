Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8AADr3x028284
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 06:13:54 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8AADp7p022532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 06:13:52 -0400
Received: from mfilter15-d.gandi.net (mfilter15-d.gandi.net [217.70.178.143])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 674D8A80C8
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 12:13:50 +0200 (CEST)
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by mfilter15-d.gandi.net (mfilter15-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id Q56kmLtG3MSM for <linux-lvm@redhat.com>;
	Wed, 10 Sep 2014 12:13:48 +0200 (CEST)
Received: from [10.21.12.10] (meiling.tontut.fi [94.237.68.51])
	(Authenticated sender: oranenj@gensoukyou.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B6792A80D1
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 12:13:48 +0200 (CEST)
Message-ID: <1410344027.13625.51.camel@kurenai.local>
From: Jarkko Oranen <oranenj@iki.fi>
Date: Wed, 10 Sep 2014 13:13:47 +0300
In-Reply-To: <5410138C.9010603@cemery.org.uk>
References: <5410138C.9010603@cemery.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Replace small drive with bigger, using LVM?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2014-09-10 at 10:02 +0100, Craig wrote:

<cut out a bunch of stuff>

> So I've got /boot in a primary partition and then swap and / come via 
> LVM in the extended.
> 
> So I'd love to do something like
> * dd /dev/sda1 to /dev/sdb1 or something like that and have my /boot 
> volume set up
> * install grub into the MBR of /dev/sdb
> 
> The if I can make the right LVM setup, get / from my live system copied 
> to the new drive, remove the old drive lv from the vg and then 
> physically swap the HDDs round.
> 
> Can someone help me with the finer details of this or isn't it doable?
> TIA
> -C

It's very much doable, but as always, the standard disclaimer applies:
back up your data etc.

As it is now, you might just as well move /boot to reside on an LV as
well; a recent enough GRUB2 (meaning: not ancient) will support booting
from it just fine. This way, you won't even need to partition your new
disk. Of course, you're free to use an actual boot partition if you
want.

to move a VG from one PV to another, you can do the following

Assuming source PV is sda2 and new disk is sdb and you don't partition
it:

pvcreate /dev/sdb

vgextend volume_group /dev/sdb

pvmove volume_group /dev/sda2 /dev/sdb

vgreduce volume_group /dev/sda2 # this removes the old PV from the VG.
it will only succeed if the PV is not actually in use, so it's safe.

GRUB2 supports being installed in the MBR of a disk that's an LVM2 PV.

You can keep your old disk with its boot partition and bootloader
installed until you've successfully booted off the new disk, so there's
little danger that you'd actually render your system completely
unbootable.

Remember to update fstab etc. to reflect the new boot partition as well.

I've been told that moving data off the VG with the root volume in it on
a running system may result in a deadlock due to the way the LV device
is temporarily suspended during copies, leading to trouble if the copy
operation requires a read from the LV. However, I've done it several
times with no issues. Still, using a live USB or CD is recommended. If
it does deadlock, you should just be able to reset and continue the
pvmove where it left off... it's quite resilient and won't lose your
data very easily.


--
Jarkko
