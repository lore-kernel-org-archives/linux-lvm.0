In-Reply-To: <559B7C6C-C825-4223-805A-BC80BFF4261A@terrascale.net>
References: <559B7C6C-C825-4223-805A-BC80BFF4261A@terrascale.net>
Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-4--1037113420"
Message-Id: <C0DAF829-CDED-4E67-A7C3-2E6D40FFDCCF@terrascale.net>
Content-Transfer-Encoding: 7bit
From: AJ Lewis <aj@terrascale.net>
Date: Tue, 11 Apr 2006 11:43:30 -0500
Subject: [linux-lvm] Re: [PATCH] remove stripe chunk size limitation for
	striped volumes in LVM2
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
Cc: Alasdair Kergon <agk@redhat.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--Apple-Mail-4--1037113420
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

I forgot - this patch is against LVM2.2.01.15

On Apr 11, 2006, at 11:35 AM, AJ Lewis wrote:

> This patch removes the artificial limitation on stripe size that  
> lvm2 had for backwards compatibility with lvm1.  It is now only  
> limited by the size of the variable used to store the chunk size.


--Apple-Mail-4--1037113420
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFEO9yzn95okVnkz6cRAiqJAJ9Asy10F6yf5lPlLQNtbO7Ly7UWlQCeNJIT
b0lmm02TzMuGVb2MBj0Nv1I=
=wrnP
-----END PGP SIGNATURE-----

--Apple-Mail-4--1037113420--
