Message-ID: <46B1B5E1.1050406@redhat.com>
Date: Thu, 02 Aug 2007 11:45:53 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
References: <46B0EAEF.6090305@cfl.rr.com>
	<20070802065012.GA28687@percy.comedia.it>
In-Reply-To: <20070802065012.GA28687@percy.comedia.it>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: LVM on dmraid breakage
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
To: device-mapper development <dm-devel@redhat.com>, "ATARAID (eg, Promise Fasttrak,
	Highpoint 370) related discussions" <ataraid-list@redhat.com>, linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Luca Berra wrote:
> Two things come to mind
> 1) dmraid should use ioctl BLKPG_DEL_PARTITION, to clean up any eventual
> partition table on component devices
> 
> 2) lvm tool filter could be modified to check if a device has been
> already claimed by device-mapper.
> 

But device-mapper already opens devices exclusively when a target claims
them.

The problem here sounds more like it's down to ordering; LVM2 is being
given a chance to scan the devices & build LVs / claim devices before
dmraid gets a look at them.


Kind regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGsbXh6YSQoMYUY94RAp5aAKDHrjX/LIoM5XPkeD/3hkd+oQ9vHgCZAXHS
Ykme+1gwvYuRat0fZwBALJs=
=mIsK
-----END PGP SIGNATURE-----
