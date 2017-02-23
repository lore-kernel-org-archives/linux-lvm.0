Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1NKNSPA019370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2017 15:23:28 -0500
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72F52C05AA66
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2017 20:23:26 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id BCDAB400D673
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2017 21:23:23 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 23 Feb 2017 21:23:23 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <b55d9679-db08-7e72-ff0f-ec471fc8f514@free.fr>
References: <b55d9679-db08-7e72-ff0f-ec471fc8f514@free.fr>
Message-ID: <8e009a96764979131283584ca8695b7d@dds.nl>
Subject: Re: [linux-lvm] Sorry to ask here ...
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Georges Giralt schreef op 23-02-2017 20:25:

> Lastly, I bet the cause is an upgrade of some packages, the machine
> refuses to boot. It drops onto initramfs shell because the vg0 volume
> group is not activated. Launching lvm and doing a vgchange -a y does
> the trick and the system boots fine afterwards.

I don't know what is the cause, but...


The /boot is on the same partition so it should be no problem right.

In the initrd the root is opened but it fails?

The quickest thing to do is to go to:

/usr/share/initramfs-tools/scripts/local-top

And edit lvm2

You must add a call to "/sbin/lvm vgchange -ay" at the bottom. If this 
works it will try to activate everything while still being in the 
initrd.

Normally only root and swap are activated. I assume the mdX array will 
be assembled just fine, but I am not sure. However I think the chance is 
high that it would work.

There is a call in there I think to activate only $ROOT and $RESUME. 
Maybe it will work if you just vgchange -ay.

If you can enter the system in a chroot and edit this file, and then 
regenerate the initramfs, it will be included in the new initramfs.

If "lvm2" is upgraded this file will be overwritten.

I assume you can override it in 
/etc/initramfs-tools/scripts/local-top/lvm2

You could need to copy lvm2 there and edit it there, for that:

mkdir -p /etc/initramfs-tools/scripts/local-top

cp /usr/share/initramfs-tools/scripts/local-top/lvm2 
/etc/initramfs-tools/scripts/local-top

But I am not 100% sure of that.



In any case that would definitely add a call to "vgchange -ay" to the 
initramfs, so that the entire volume group can be activated prior to 
passing control to systemd.

Good luck.
