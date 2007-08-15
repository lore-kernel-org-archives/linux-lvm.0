Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l7FKL9Af001105
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 16:21:09 -0400
Message-ID: <46C35F9A.60604@redhat.com>
Date: Wed, 15 Aug 2007 21:18:34 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Is this possible with LVM?
References: <200708151303.33774.lothar@tradescape.biz>
In-Reply-To: <200708151303.33774.lothar@tradescape.biz>
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

Lothar Werzinger wrote:
> What I would like to do is to unmount LV2 and be able to remove the external 
> disk from the Ultrabay to replace it with a DVD drive while still be able to 
> acess the filesystem on LV1 (which uses only space on the internal disk).
> I would like to do this to backup data from LV1 to DVD-RW.
> 
> Is this possible with LVM? How would I go and prepare the external disk for 
> removal? How would I reconnect if I insert the disk again.

It is possible, but not with both PVs in the same VG (well, not unless
you want to be doing a lot of manual tweaking and fiddling as you
plug/unplug the external drive and even then you would need to be
extremely careful when changing/resizing LVs - basically, don't! :).

If you put LV2 in its own VG then you can achieve exactly what you
describe via:

umount /path/to/LV2
vgchange -an VG2

Then remove the external disk. Optionally, you could mark the VG as
exported with vgexport if you wanted to move it between different hosts.

To re-activate it, plug it back in and re-activate it:

vgchange -ay VG2

Preceding that with a vgimport if you did choose to export the VG.

Depending on the versions of the tools you are using and they way you
configured the physical volumes when you set them up you can probably
break the VG up using vgsplit.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGw1+a6YSQoMYUY94RAgq8AJ4ohWRaQxAdni4wIa0g9lIpb3SNawCfRMzG
1bn1nBr9GtnN0CWfN1l7oTE=
=5Ff4
-----END PGP SIGNATURE-----
