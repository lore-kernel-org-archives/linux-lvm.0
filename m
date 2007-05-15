Received: from [10.33.1.214] (dhcp-1-214.fab.redhat.com [10.33.1.214])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l4FEZSjK026178
	for <linux-lvm@redhat.com>; Tue, 15 May 2007 10:35:28 -0400
Message-ID: <4649C52F.9080000@redhat.com>
Date: Tue, 15 May 2007 15:35:27 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
References: <Pine.LNX.4.44.0705122130070.27083-100000@bmsred.bmsi.com>	<464672A6.3000408@davidb.org>	<46481E32.4060808@redhat.com>
	<46487F15.4070108@davidb.org>
In-Reply-To: <46487F15.4070108@davidb.org>
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

David Brown wrote:
> A simple lvm volume, mounted with XFS gives the following kernel
> message:
> 
>  Filesystem "dm-11": Disabling barriers, not supported by the underlying
> device
> XFS mounting filesystem dm-11

So it does. I don't use XFS on my boxes & hadn't noticed this before.

Turns out that xfs is checking barrier capabilities using queue->ordered
in the device struct. If it has QUEUE_ORDERED_NONE, barriers are
disabled (fs/xfs/linux-2.6/xfs_super.c).

I'll look into why this is the case as given this check there shouldn't
be any need for snap & mpath to check for barrier bios themselves.

The patches that introduced those checks were submitted after problems
were seen with barriers on these target types, so something was clearly
submitting them at some stage.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGScUv6YSQoMYUY94RAh3sAKCpcTdyvLKpwni1VYssyo2cORBG6ACbBrbl
xlJIlDXDdZGNAX5Tmjbt7RI=
=yaL7
-----END PGP SIGNATURE-----
