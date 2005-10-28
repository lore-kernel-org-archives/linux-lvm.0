From: Edward Muller <edwardam@interlix.com>
Subject: Re: [linux-lvm] Can LVM2 and CLVM co-exist
Date: Fri, 28 Oct 2005 11:31:28 -0500
References: <200510272317.02488.edwardam@interlix.com>
	<4361D0EC.3050004@redhat.com>
In-Reply-To: <4361D0EC.3050004@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6470027.6KCtFiPdQO";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200510281131.28632.edwardam@interlix.com>
Reply-To: edwardam@interlix.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Patrick Caulfield <pcaulfie@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--nextPart6470027.6KCtFiPdQO
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 28 October 2005 02:19 am, Patrick Caulfield wrote:
> Edward Muller wrote:
> > I have a system using LVM2 and recently setup a CORAID (www.coraid.com)
> > device. I'd like to use CLVM to manage the volumes on the device. But
> > someone mentioned that LVM2 and CLVM may be incompatible.
>
> What exactly are you trying to do?
>
> LVM2 & CLVM can't be incompatible - they are the same thing! installing t=
he
> lvm2-cluster RPM doesn't replace any LVM2 components, it provides a new
> locking method for clustered VGs and a daemon to distribute the commands
> across the cluster.

What's an RPM? :-)
j/k - This is on gentoo linux and it's a separate package and doesn't depen=
d=20
on the lvm package.

But on investigating further I see that they compile lvm with clvm in that=
=20
package. Presumably so you can have different versions of clvm and lvm=20
installed. Why you would want to do that I don't know.=20

=2D-=20
Edward Muller - Interlix
edwardam@interlix.com
417-862-0573
PGP Key: http://interlix.com/Members/edwardam/pgpkeys

--nextPart6470027.6KCtFiPdQO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDYlJg6NYdR1GOdLkRAslHAJ9XTGP8JGoQiDRMCQvjauL4oRxLHQCeJy+9
LHG8AUQO5B+r4yk7EJwGCT8=
=72Zj
-----END PGP SIGNATURE-----

--nextPart6470027.6KCtFiPdQO--
