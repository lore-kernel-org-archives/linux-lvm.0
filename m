From: "Jason H. Smith" <jason@oes.co.th>
Subject: Re: [linux-lvm] lvm2 and xfs (repost)
References: <200306061044.50925.krienke@uni-koblenz.de> <1054891523.3ee05e03b3e6f@secure.st-peter.stw.uni-erlangen.de>
In-Reply-To: <1054891523.3ee05e03b3e6f@secure.st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_GQI4+dZmaUBOuq0";
  charset="tis-620"
Content-Transfer-Encoding: 7bit
Message-Id: <200306061907.34469.jason@oes.co.th>
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
Date: Mon Jun  9 09:32:08 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-02=_GQI4+dZmaUBOuq0
Content-Type: text/plain;
  charset="tis-620"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Friday 06 June 2003 04:25 pm, Svetoslav Slavtchev wrote:
> why not go for a recent -ac kernel and skip patching :)
> ( in -ac are included both xfs and dm )
>
> and someone posted a dm-patch against xfs kernel on the list

I played with 2.4.20 + xfs + vfs lock + lvm2, plus some patches I made to=20
output snapshot usage in 512-byte increments.  While the patches don't=20
apply, per se, it's mostly because patch isn't smart enough to notice the=20
code moving around.  I think there were like 1 or 2 .reg files, with=20
maybe two trivial fixes each.  So merging manually isn't bad, e.g. if you=20
don't want any of the other -ac changes.

=2D-=20
GPG: 03EE 9EB8 E500 874A F509  7B95 9B9A 84A1 26E9 4F79
http://www.ece.utexas.edu/~jhs/public_key.gpg

--Boundary-02=_GQI4+dZmaUBOuq0
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+4IQGm5qEoSbpT3kRAnmmAJ43l2Je37edSMIM207AV/Vdxw+gTwCeNErz
ahgu6dTuGZOfHKIWAHPAYwk=
=1txR
-----END PGP SIGNATURE-----

--Boundary-02=_GQI4+dZmaUBOuq0--
