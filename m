Return-Path: <bg@blacknet.de>
Date: Thu, 26 Apr 2001 16:27:42 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] badblocks handling with LVM
Message-ID: <20010426162742.A8220@dragon.blacknet.de>
References: <200104231008.f3NA8Gkx001134@webber.adilger.int> <01042519594802.31687@lyta> <20010426100603.A9820@sistina.com> <20010426152651.B26041@vestdata.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <20010426152651.B26041@vestdata.no>; from lvm@ragnark.vestdata.no on Thu, Apr 26, 2001 at 03:26:52PM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Apr 26 '01 at 15:26, Ragnar Kj=F8rstad wrote:
> And if anyone insist on using LVM to mark the blocks anyway, it can be
> done with out special code. Just create a volume named "broken", and put
> the PVs in question in this.
That would be a waste of space, my PVs are all 10+GB in size, I'd like
bad block handling on PE level not on PV level.
But I can live with out badblock handling in LVM.

Cu,
    Goetz.

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE66DBef5srOMkjkQoRAtiVAJ9ZddoQURkHBfo4UAMPgsFsEp68DQCgliSf
X6qaZPhwcxeCfVSqGQIZDpc=
=Y9Fk
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
