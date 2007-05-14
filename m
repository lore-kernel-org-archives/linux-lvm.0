Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l4E8apSA000643
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 04:36:52 -0400
Message-ID: <46481E32.4060808@redhat.com>
Date: Mon, 14 May 2007 09:30:42 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
References: <Pine.LNX.4.44.0705122130070.27083-100000@bmsred.bmsi.com>
	<464672A6.3000408@davidb.org>
In-Reply-To: <464672A6.3000408@davidb.org>
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
> Of course, any of the re-ordering (SCSI TCQ, or SATA NCQ) requires
> filesystem and driver support of write barriers for reliability.
> Write barriers are not implement in DM, hence LVM, so there is a

Only the dm-mpath and dm-snap targets treat barrier bios specially (they
return EOPNOTSUPP). Other dm targets pass the barriers on to the
underlying devices unchanged.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGSB4y6YSQoMYUY94RApajAJ4kyrw+DDEjj3WiXPOysO5J6KKmOQCgxC0M
oQrw2KA74j+ytiKFoMLPQdg=
=CZvy
-----END PGP SIGNATURE-----
