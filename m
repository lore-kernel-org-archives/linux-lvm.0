Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7HMCdn4028318
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 18:12:39 -0400
Received: from minbar.sigsegv.at (minbar.sigsegv.at [83.64.197.38])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7HMCSdb023041
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 18:12:29 -0400
From: Thomas Hager <duke@sigsegv.at>
In-Reply-To: <230ED15F81AFD3409345FFA4E565F0E50CE525BF@NDHV3000.na.corp.mckesson.com>
References: <230ED15F81AFD3409345FFA4E565F0E50CE525BF@NDHV3000.na.corp.mckesson.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-VKJ9C9y0ZJ8cAQDXWULG"
Date: Wed, 18 Aug 2010 00:12:25 +0200
Message-ID: <1282083145.10489.19.camel@zhadum.moger.at>
Mime-Version: 1.0
Subject: Re: [linux-lvm] pvmove hangs
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
To: linux-lvm@redhat.com


--=-VKJ9C9y0ZJ8cAQDXWULG
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-08-17 at 15:26 -0400, Allen, Jack wrote:
> I know pvmove is part ofLVM2, but because it worked with PowerPath and
> not when using Multipath and all other things are the same is the
> reason I am asking the questions here.
we had similar problems with novell SLES every now and then, and they
were not reproduceable and occured in random time frames.=20

among them:

- the pvmove simply stalled, outputting the same %-done message every 15
seconds until we reset the server.

- the server crashed and performed an automated reboot.

and worst:

- pvmove immediately threw an I/O error after starting, committed all
pending moves though -> all data previously residing on the old LUN was
lost :(

novell provided several updates to the kernel, lvm2 and the
device-mapper, but there might still lurk some bugs we haven't triggered
yet. one advise they gave us was to only migrate PEs of one LV at a
time, which we followed afterwards.

we've seen this behaviour only on SLES, which is the distribution we use
on most of our servers. the few redhats we have migrated fine with
pvmove, we didn't migrate much on these though (only some hundred GB
compared to the ~50TB we had to migrate with SLES). and it was not
related to the storage driver we used, we faced the same issues with
HP's adapted qlogic driver as well as with dm-mp.

anyway, you definitely should open an SR in redhat's CC, so they can
investigate the issue more closely.

hth,
tom.

--=20
Thomas "Duke" Hager                               duke@sigsegv.at
GPG: 1024D/D27F858C            http://www.sigsegv.at/gpg/duke.gpg
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
"Never Underestimate the Power of Stupid People in Large Groups."


--=-VKJ9C9y0ZJ8cAQDXWULG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iD8DBQBMawlFO0Kx4NJ/hYwRAheoAJ9TBN1ufqRKv59eojCF3+100UDXJwCfS/5n
/2zGt2zE0cAriNw7Ii8mFpA=
=O7oR
-----END PGP SIGNATURE-----

--=-VKJ9C9y0ZJ8cAQDXWULG--
