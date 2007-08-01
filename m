Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l71AMD1J000863
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 06:22:13 -0400
Message-ID: <46B05E52.1050000@redhat.com>
Date: Wed, 01 Aug 2007 11:20:02 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting a lvm volume from an external machine?
References: <46B05A7E.7020001@cdmon.com>
In-Reply-To: <46B05A7E.7020001@cdmon.com>
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

Jordi Moles wrote:
> hi.
> 
> i've been googleing for days with no luck about this issue.
> 
> i've got some machines which i perform a daily backup from.
> some of these machines have lvm volumes with one or more partitions.
> is there any way i can mount those virtual partitions from the machines
> that performs the daily backup?
> 

Well, you could export the file system content using services like NFS
or Samba, but it sounds like you're after exporting actual block
devices, in which case you'll need to consider something like iSCSI, nbd
(or gnbd) or some other network block device type.

This is all assuming that your lvm volumes are on local storage (e.g.
SATA, IDE, single initiator SCSI/SAS) - if they're on shared storage
like a SAN you should just be able to present them to the backup host
via the storage network.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGsF5S6YSQoMYUY94RAktpAKDHY4uaWNCH28CJF4ECE0iyFjfneACfZB2m
cS+kmrO8eoT2tj8Fr752o+8=
=OCjg
-----END PGP SIGNATURE-----
