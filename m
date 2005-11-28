Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jASIF9V30121
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 13:15:09 -0500
Received: from minbar.sigsegv.at
	(83-64-197-38.kaisermuehlen.xdsl-line.inode.at [83.64.197.38])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jASIEsPY030202
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 13:15:01 -0500
Subject: Re: [linux-lvm] No space on device message, Not true
From: Thomas Hager <duke@sigsegv.at>
In-Reply-To: <438A372A.3080909@cray.com>
References: <438A372A.3080909@cray.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-fuhLFFC5QSeWMBIOa69s"
Date: Mon, 28 Nov 2005 19:14:37 +0100
Message-Id: <1133201677.4161.6.camel@zhadum.wg.at>
Mime-Version: 1.0
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


--=-fuhLFFC5QSeWMBIOa69s
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2005-11-27 at 14:46 -0800, Gord Urquhart wrote:
> Hello all
hi,

> And this only happens on the nodes that NFS mount the file system. On=20
> the local node everything works fine.
well, same here and i don't think this is an lvm issue. it's most likely
a bug in reiserfs (i guess, you're using reiserfs too) or nfs.

run fsck.reiserfs on the partition in question and let it correct things
and afterwards your fs utilization will show 100%.

hth,
tom.

--=20
Thomas "Duke" Hager                       {duke,hager}@sigsegv.at
GPG: 1024D/D27F858C            http://www.sigsegv.at/gpg/duke.gpg
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
"Never Underestimate the Power of Stupid People in Large Groups."



--=-fuhLFFC5QSeWMBIOa69s
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDi0kNO0Kx4NJ/hYwRAuqbAKCnznUhCVnQf7k/dxFbWL6GDs/5XwCff1Ij
a2uQVxUrmf/LZmIBAGZhRcE=
=SmKC
-----END PGP SIGNATURE-----

--=-fuhLFFC5QSeWMBIOa69s--
