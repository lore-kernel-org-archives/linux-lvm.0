Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0FGHuYD001363
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 11:17:56 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0FGHsnC017076
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 11:17:54 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id DFB9D20040F
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 17:17:52 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id oRyHI3xLwZNY for <linux-lvm@redhat.com>;
	Wed, 15 Jan 2014 17:17:52 +0100 (CET)
Received: from [192.168.0.11] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 9C80720040E
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 17:17:52 +0100 (CET)
Message-ID: <52D6B4AF.9010007@mglug.de>
Date: Wed, 15 Jan 2014 17:17:51 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>
In-Reply-To: <87zjmxzmga.fsf@red.mvo.lan>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
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

Hi Marius!

the /dev/mapper/.. devices are for internal use only. This is needed,
because the thinPOOL is a device logical between vg and lv, which is
represented with help of these special devices.

Normally you should alway use the /dev/vg/lv name scheme for you own
lvm-devices. Nevertheless, if you would persist to use /dev/mapper/
pathes, you can create the path with /dev/mapper/<vg>-<lv>. Note: If you
lv-name includes some "-", they will be doubled in /dev/mapper notation
for differentiating to the "-", which separates vg and lv name. I.e. you
LV is name my-own-lv and your VG is mariusvg, then you can find the
(thintpool-) device under /dev/mapper/mariusvg-my--own--lv and (better)
as link /dev/mariusvg/my-own-lv.

There is a point you have unfortunatly to use the /dev/mapper-notation:
If you need i.e. kpartx for creating subdevices (i.e. the lv includes a
virtual windows disk with partitions), then the temporalily created
names are only accessible via /dev/mapper.

The other created metadevices for thinpool-managment you should never touch.

Hth,
Oliver


On 15.01.2014 09:19, Marius Vollmer wrote:
> Hi,
>
> when looking at the udev properties of a device mapper node, how can I
> decide whether this is a block device that the user can use for creating
> filesystems on, etc?
>
> For example, when creating a thinly provisioned logical volume with these
> steps
>
>  # vgcreate TEST /dev/loop1
>  # lvcreate TEST --thinpool pool -L 80
>  # lvcreate -T TEST/pool -n thin -V 100
>
> I end up with a lot of devices:
>
>  # ls /dev/mapper/TEST-*
>  /dev/mapper/TEST-pool        /dev/mapper/TEST-pool_tmeta  /dev/mapper/TEST-thin
>  /dev/mapper/TEST-pool_tdata  /dev/mapper/TEST-pool-tpool
>
> How can a program tell that only /dev/mapper/TEST-thin can really be
> used as a block device, and the rest should be ignored?
>
> Is there a way to do this by looking at "udevadm info", for example?
>
> (What seems to work is skipping all nodes that have
> DM_UDEV_IGNORE_DISK_RULES_FLAG set to true.  Is this maybe even
> documented somewhere?)
>
> Thanks!
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
