Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8A8xg1f011645
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 04:59:43 -0400
Received: from christel.heitec.net (christel.heitec.net [62.206.253.11])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8A8xYcn004230
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 04:59:35 -0400
Received: from prag.er.heitec.net (paladin.heitec.net [62.206.253.14])
	by christel.heitec.net (Postfix) with ESMTP id 8EDCAA893D
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 10:59:19 +0200 (CEST)
Date: Mon, 10 Sep 2007 10:59:21 +0200
From: Holger Rauch <holger.rauch@heitec.de>
Subject: Re: [linux-lvm] Question on duplicating equally-sized HDs with dd and
	changing VG name and PV UUIDs
Message-ID: <20070910085921.GC22296@heitec.net>
References: <20070907121306.GA27457@heitec.net>
	<20070907175345.GA5931@racke.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <20070907175345.GA5931@racke.local>
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
To: linux-lvm@redhat.com


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

Hi Lars (and all the other list members),

first of all, thanks for this nice little script (and I see nothing wrong
with that :-))) ), but it assumes that VG backupvg and the underlying VG
has already been created, right? I see no pvcreate and vgcreate invocations
in there. Is this on purpose, i.e. is that already done just by duplicating
the partition table using sfdisk?

Thanks in advance for clarifying things.

Kind regards,

	Holger

On Fri, 07 Sep 2007, Lars Ellenberg wrote:

> [...]
> what is wrong with
>  sfdisk -d /dev/sda | sfdisk /dev/sdb
>  lvs -o attr,name,size --noheadings rootvg |
>  while read a n s; do
>  	[[ $a == -* ]] || continue;
> 	lvcreate -L $s -n $n backupvg ;
> 	# dd bs=1M if=/dev/rootvg/$n of=/dev/backupvg/$n
>  done
> ?
> [...]

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFG5QdpbiVtWpZdKQIRAgxsAKCDmyt4845SvfnWR1v2IdUtS9a0bwCfUDEz
4ihTVZc9uQUE91+tETRaapQ=
=iWO4
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
