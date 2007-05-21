Received: from [10.33.1.214] (dhcp-1-214.fab.redhat.com [10.33.1.214])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l4LESZRt008058
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 10:28:36 -0400
Message-ID: <4651AC93.8090309@redhat.com>
Date: Mon, 21 May 2007 15:28:35 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table
References: <247618.80102.qm@web38214.mail.mud.yahoo.com>
In-Reply-To: <247618.80102.qm@web38214.mail.mud.yahoo.com>
Content-Transfer-Encoding: 7bit
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sean McGlynn wrote:
> Hello,
> 
>  
> 
> I did an fdisk -l to review my partition table (see results below), and
> found four entries that end with "Disk /dev/dm-X doesn't contain a valid
> partition table."  I don't recall seeing this in the past, so I believe
> it is something new.

Later kernels include dm devices in the list of partitions in proc, so
fdisk will attempt to scan them for partition tables. It's not harmful,
just noise.

> I recently began using kernel 2.6.21.1, up from 2.6.9-42.  I don't know
> if perhaps this had some effect, or if the entries are normal and I just
> never noticed them.

If you don't like it & you've not configured anything to use /dev/dm-*
devices directly (instead of /dev/mapper/* or /dev/<volgroup>/* or
whatever) then you can reconfigure udev to not create the dm-* nodes.

- From memory, you need to comment out the rule that begins
"KERNEL="dm-[0-9]*" in /etc/udev/rules.d/50-udev.rules, or, for newer
udevs you can add ignore_device:

KERNEL=="dm-[0-9]*", ACTION=="add", OPTIONS+="ignore_device"

>  
> 
> What led me here is that sar -d output includes four entries for hard
> drives (dev253 entries) when there are only three on my system.  Fdisk
> is reporting four DM devices, so I'm thinking there is some correlation,
> but I don't know what.

Those "dev253" entries are your device-mapper devices. Take a look at
/dev/dm-* with ls -l and you will see that the major number is 253.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGUayT6YSQoMYUY94RAqJKAJ9dFJtaRg3fONo7kLOkDezcS/FizwCcDwFj
2McvW5Wl+zudmUZDO2aE1fQ=
=NHOE
-----END PGP SIGNATURE-----
